#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Validates the internal consistency of the AI Engineering Kit.
.DESCRIPTION
    Runs from any working directory (paths resolve from the script location). Checks:
      1. Every @import in core/AGENTS.md resolves, and every core module is indexed there.
      2. Every relative Markdown link resolves (templates/ is skipped: it holds placeholders).
      3. Every "`FILE.md` <section-sign>Section" reference points at a real heading.
      4. Every framework pack and adapter cites the canonical core.
      5. Expected pack/adapter counts, the ESSENTIALS.md size budget, and CHANGELOG shape.
      6. Skill frontmatter in prompts/ (name format, uniqueness, description length, keys).
      7. No hard-coded personal paths (C:\Users\<name>, /home/<name>, /Users/<name>).
    Exits 1 and lists every problem when any check fails.
#>

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$errors = New-Object System.Collections.Generic.List[string]
$EssentialsBudgetBytes = 6KB

function Get-Rel([string]$Path) { $Path.Substring($root.Length + 1) -replace '\\', '/' }
function Read-Text([string]$Path) { ([System.IO.File]::ReadAllText($Path)) -replace "`r`n", "`n" }

# Markdown text with fenced code blocks and inline code spans blanked out (links inside code
# are examples, not navigation).
function Get-Prose([string]$Text) {
    $Text = [regex]::Replace($Text, '(?ms)^\s*```.*?^\s*```', '')
    [regex]::Replace($Text, '`[^`\n]*`', '``')
}

$mdFiles = @(Get-ChildItem -Path $root -Recurse -Filter *.md -File |
    Where-Object { $_.FullName -notmatch '[\\/](\.git|node_modules)[\\/]' })

# 1. Core index ------------------------------------------------------------------------------

$coreIndex = Join-Path $root 'core/AGENTS.md'
$indexText = Read-Text $coreIndex
$imports = @([regex]::Matches($indexText, '@import \[[^\]]*\]\(([^)]+\.md)\)') | ForEach-Object { $_.Groups[1].Value })
foreach ($target in $imports) {
    if (-not (Test-Path (Join-Path $root "core/$target"))) { $errors.Add("core/AGENTS.md imports missing module: $target") }
}
foreach ($module in Get-ChildItem (Join-Path $root 'core') -Filter *.md) {
    if ($module.Name -eq 'AGENTS.md') { continue }
    if ($indexText -notmatch [regex]::Escape("($($module.Name))")) {
        $errors.Add("core/$($module.Name) is not linked from core/AGENTS.md")
    }
}

# 2. Relative links --------------------------------------------------------------------------

$linkCount = 0
foreach ($file in $mdFiles) {
    $rel = Get-Rel $file.FullName
    if ($rel -like 'templates/*') { continue }
    $prose = Get-Prose (Read-Text $file.FullName)
    foreach ($m in [regex]::Matches($prose, '\]\(([^)\s]+)\)')) {
        $target = $m.Groups[1].Value
        if ($target -match '^(https?:|mailto:|#)' -or $target -match '[<>${}]') { continue }
        $target = ($target -split '#')[0]
        if (-not $target) { continue }
        $linkCount++
        $resolved = if ($target.StartsWith('/')) { Join-Path $root $target.TrimStart('/') }
                    else { Join-Path $file.DirectoryName $target }
        if (-not (Test-Path $resolved)) { $errors.Add("${rel}: broken link -> $target") }
    }
}

# 3. Section references ----------------------------------------------------------------------

$sectionCount = 0
$sectionSign = [string][char]0xA7   # Kept out of the source: PowerShell 5.1 reads BOM-less scripts as ANSI.
$sectionPattern = '`(?:[\w./-]*/)?([A-Z_]+\.md)`\s*' + $sectionSign + '\s*([A-Z][A-Za-z-]*(?: [A-Z][A-Za-z-]*)*)'
foreach ($file in $mdFiles) {
    $rel = Get-Rel $file.FullName
    if ($rel -like 'templates/*') { continue }
    foreach ($m in [regex]::Matches((Read-Text $file.FullName), $sectionPattern)) {
        $module = Join-Path $root "core/$($m.Groups[1].Value)"
        $section = $m.Groups[2].Value
        $sectionCount++
        if (-not (Test-Path $module)) { $errors.Add("${rel}: section '$section' refers to missing core/$($m.Groups[1].Value)"); continue }
        $headings = [regex]::Matches((Read-Text $module), '(?m)^#{1,6} (.+)$') | ForEach-Object { $_.Groups[1].Value }
        if (-not ($headings | Where-Object { $_ -match "\b$([regex]::Escape($section))\b" })) {
            $errors.Add("${rel}: no heading '$section' in core/$($m.Groups[1].Value)")
        }
    }
}

# 4. Packs and adapters cite the core --------------------------------------------------------

$packs = @(Get-ChildItem (Join-Path $root 'framework-packs') -Filter *.md)
$adapters = @(Get-ChildItem (Join-Path $root 'adapters') -Filter *.md)
foreach ($pack in $packs) {
    if ((Read-Text $pack.FullName) -notmatch '(?m)^> Extends `core/AGENTS\.md`') {
        $errors.Add("framework-packs/$($pack.Name): missing '> Extends ``core/AGENTS.md``' header")
    }
}
foreach ($adapter in $adapters) {
    if ((Read-Text $adapter.FullName) -notmatch 'core/AGENTS\.md') {
        $errors.Add("adapters/$($adapter.Name): does not reference core/AGENTS.md")
    }
}

# 5. Counts, budget, changelog ---------------------------------------------------------------

if ($packs.Count -lt 20) { $errors.Add("Expected >= 20 framework packs, found $($packs.Count)") }
if ($adapters.Count -lt 8) { $errors.Add("Expected >= 8 adapters, found $($adapters.Count)") }

$essentialsBytes = (Get-Item (Join-Path $root 'core/ESSENTIALS.md')).Length
if ($essentialsBytes -gt $EssentialsBudgetBytes) {
    $errors.Add("core/ESSENTIALS.md is $essentialsBytes bytes; budget is $EssentialsBudgetBytes (it is inlined into every project)")
}

$changelog = Read-Text (Join-Path $root 'CHANGELOG.md')
$unreleased = [regex]::Matches($changelog, '(?m)^## \[Unreleased\]').Count
if ($unreleased -ne 1) { $errors.Add("CHANGELOG.md must have exactly one [Unreleased] section, found $unreleased") }
$versions = @([regex]::Matches($changelog, '(?m)^## \[(\d+\.\d+\.\d+)\]') | ForEach-Object { [version]$_.Groups[1].Value })
if ($versions.Count -eq 0) { $errors.Add('CHANGELOG.md has no released versions') }
for ($i = 1; $i -lt $versions.Count; $i++) {
    if ($versions[$i] -ge $versions[$i - 1]) { $errors.Add("CHANGELOG.md versions are not in descending order at $($versions[$i])") }
}

# 6. Skill frontmatter in prompts ------------------------------------------------------------

$skillNames = @{}
foreach ($prompt in Get-ChildItem (Join-Path $root 'prompts') -Filter *.md) {
    $text = Read-Text $prompt.FullName
    $fm = [regex]::Match($text, '\A---\n(.*?)\n---\n', 'Singleline')
    if (-not $fm.Success) { continue }
    $rel = "prompts/$($prompt.Name)"
    $meta = @{}
    foreach ($line in ($fm.Groups[1].Value -split "`n")) {
        $kv = [regex]::Match($line, '^([a-z-]+):\s*(.*?)\s*$')
        if ($kv.Success) { $meta[$kv.Groups[1].Value] = $kv.Groups[2].Value }
        else { $errors.Add("${rel}: unparseable frontmatter line '$line'") }
    }
    $name = $meta['skill']
    if (-not $name) { $errors.Add("${rel}: frontmatter has no 'skill:' key"); continue }
    if ($name -cnotmatch '^[a-z0-9]+(-[a-z0-9]+)*$' -or $name.Length -gt 64) { $errors.Add("${rel}: invalid skill name '$name' (lowercase, digits, hyphens; max 64)") }
    if ($skillNames.ContainsKey($name)) { $errors.Add("${rel}: skill name '$name' already used by $($skillNames[$name])") }
    $skillNames[$name] = $rel
    $desc = $meta['description']
    if (-not $desc) { $errors.Add("${rel}: skill '$name' has no description") }
    elseif ($desc.Length -gt 1024) { $errors.Add("${rel}: description is $($desc.Length) chars (max 1024)") }
    elseif ($desc -match '[<>]') { $errors.Add("${rel}: description must not contain '<' or '>'") }
    if ($meta.ContainsKey('manual-only') -and @('true', 'false') -notcontains $meta['manual-only']) { $errors.Add("${rel}: manual-only must be true or false") }
    foreach ($key in $meta.Keys) {
        if (@('skill', 'description', 'manual-only') -notcontains $key) { $errors.Add("${rel}: unknown frontmatter key '$key'") }
    }
}

# 7. Personal paths --------------------------------------------------------------------------

$personalPath = '(?i)([a-z]:\\Users\\|/home/|/Users/)(?!<|\$|you|name|me\b)[A-Za-z0-9._-]+'
$scanFiles = $mdFiles + @(Get-ChildItem -Path $root -Recurse -Include *.ps1, *.yml -File |
    Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' })
foreach ($file in $scanFiles) {
    $hit = [regex]::Match((Read-Text $file.FullName), $personalPath)
    if ($hit.Success) { $errors.Add("$(Get-Rel $file.FullName): hard-coded personal path '$($hit.Value)'") }
}

# Report -------------------------------------------------------------------------------------

if ($errors.Count -gt 0) {
    Write-Host "Kit validation FAILED ($($errors.Count) problem(s)):"
    $errors | ForEach-Object { Write-Host "  - $_" }
    exit 1
}

Write-Host 'Kit validation passed.'
Write-Host "  Core modules indexed: $($imports.Count) | Framework packs: $($packs.Count) | Adapters: $($adapters.Count)"
Write-Host "  Links checked: $linkCount | Section refs checked: $sectionCount | Skills: $($skillNames.Count) | ESSENTIALS.md: $essentialsBytes bytes"
exit 0
