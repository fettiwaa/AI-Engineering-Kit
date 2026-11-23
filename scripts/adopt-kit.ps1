#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Adopts the AI Engineering Kit in a project.
.DESCRIPTION
    1. Vendors the kit into <Project>/.ai-kit/ (core, checklists, prompts, templates, and the
       selected framework packs) so every agent can read it without leaving the workspace.
    2. Writes a managed block into <Project>/AGENTS.md containing core/ESSENTIALS.md plus the
       selected packs. AGENTS.md is read natively by Codex, Cursor, Kilo Code, Windsurf, and
       GitHub Copilot.
    3. Writes thin shims for agents that need one (Claude Code, Gemini CLI, Copilot, Aider).

    Only content between the ai-kit markers is ever replaced, so re-running is safe and
    project-specific instructions outside the block are preserved.
.PARAMETER Project
    Path to the project to configure. Defaults to the current directory.
.PARAMETER Agents
    Agents to write shims for: claude, gemini, copilot, aider, codex, cursor, kilo, windsurf,
    or all. AGENTS.md is always written.
.PARAMETER Packs
    Framework pack names (file names in framework-packs/ without .md), e.g. typescript,react.
.PARAMETER Skills
    Claude Code skills to install into <Project>/.claude/skills/ (names, or "all"). Runs
    scripts/install-skills.ps1; see that script's -List for the available names.
.PARAMETER WithMemory
    Also create the project-memory files under <Project>/docs/ if they do not exist.
.PARAMETER DryRun
    Print what would change without writing anything.
.EXAMPLE
    ./scripts/adopt-kit.ps1 -Project ../my-app -Agents claude,cursor -Packs typescript,react
#>
[CmdletBinding()]
param(
    [string]$Project = (Get-Location).Path,
    [string[]]$Agents = @(),
    [string[]]$Packs = @(),
    [string[]]$Skills = @(),
    [switch]$WithMemory,
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$KitRoot = Split-Path -Parent $PSScriptRoot
$Utf8NoBom = New-Object System.Text.UTF8Encoding $false
$KnownAgents = @('claude', 'gemini', 'copilot', 'aider', 'codex', 'cursor', 'kilo', 'windsurf')
$BlockEnd = '<!-- ai-kit:end -->'
$SizeWarnBytes = 24KB   # Codex truncates project docs past 32 KiB by default.

# Accept both "-Packs a,b" and "-Packs 'a,b'" (the latter arrives as one string via -File).
function Split-List([string[]]$Values) {
    @($Values | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim().ToLower() } |
        Where-Object { $_ })
}
$Agents = Split-List $Agents
$Packs = Split-List $Packs
if ($Agents -contains 'all') { $Agents = $KnownAgents }

function Write-Step([string]$Message) {
    $prefix = if ($DryRun) { '[dry-run] ' } else { '' }
    Write-Host "$prefix$Message"
}

function Save-File([string]$Path, [string]$Content) {
    if ($DryRun) { return }
    $dir = Split-Path -Parent $Path
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    [System.IO.File]::WriteAllText($Path, $Content, $Utf8NoBom)
}

function Read-Text([string]$Path) {
    ([System.IO.File]::ReadAllText($Path)) -replace "`r`n", "`n"
}

# Strip a module's H1 title and its leading blockquote, then demote remaining headings.
function Convert-Module([string]$Text, [int]$Demote, [string]$Heading) {
    $out = New-Object System.Collections.Generic.List[string]
    $inFence = $false
    $skippingIntro = $true
    if ($Heading) { $out.Add($Heading); $out.Add('') }
    foreach ($line in ($Text -split "`n")) {
        if ($skippingIntro) {
            if ($line -match '^# ' -or $line -match '^>' -or $line.Trim() -eq '') { continue }
            $skippingIntro = $false
        }
        if ($line -match '^\s*```') { $inFence = -not $inFence }
        if (-not $inFence -and $line -match '^#{1,5} ') { $line = ('#' * $Demote) + $line }
        $out.Add($line)
    }
    ($out -join "`n").TrimEnd()
}

# Point module-relative references at the vendored copy.
function Convert-Links([string]$Text) {
    $Text = [regex]::Replace($Text, '\]\(([A-Z_]+\.md)\)', '](.ai-kit/core/$1)')
    $Text = $Text -replace '`core/', '`.ai-kit/core/'
    $Text = $Text -replace '`framework-packs/', '`.ai-kit/framework-packs/'
    $Text
}

# Replace the managed block in a file, or add it (prepend or append) if absent.
function Set-ManagedBlock([string]$Path, [string]$Block, [string]$StartPattern,
                          [string]$EndMarker, [string]$NewFileSuffix, [switch]$Prepend) {
    $name = $Path.Substring($Project.Length).TrimStart('\', '/')
    if (-not (Test-Path $Path)) {
        Write-Step "create  $name"
        Save-File $Path ($Block + $NewFileSuffix + "`n")
        return
    }
    $text = Read-Text $Path
    $start = [regex]::Match($text, $StartPattern)
    $end = $text.IndexOf($EndMarker)
    if ($start.Success -and $end -gt $start.Index) {
        $after = $text.Substring($end + $EndMarker.Length)
        $updated = $text.Substring(0, $start.Index) + $Block + $after
        if ($updated -eq $text) { Write-Step "ok      $name (unchanged)"; return }
        Write-Step "update  $name (managed block)"
    } elseif ($Prepend) {
        Write-Step "update  $name (managed block prepended; existing content kept)"
        $updated = $Block + "`n`n" + $text
    } else {
        Write-Step "update  $name (managed block appended; existing content kept)"
        $updated = $text.TrimEnd() + "`n`n" + $Block + "`n"
    }
    Save-File $Path $updated
}

# --- Validate input -------------------------------------------------------------------------

if (-not (Test-Path $Project -PathType Container)) { throw "Project directory not found: $Project" }
$Project = (Resolve-Path $Project).Path.TrimEnd('\', '/')
if ($Project -eq $KitRoot) { throw 'Refusing to adopt the kit into itself. Pass -Project <path>.' }

$unknownAgents = @($Agents | Where-Object { $KnownAgents -notcontains $_ })
if ($unknownAgents) { throw "Unknown agent(s): $($unknownAgents -join ', '). Known: $($KnownAgents -join ', '), all" }

$available = @(Get-ChildItem (Join-Path $KitRoot 'framework-packs') -Filter *.md | ForEach-Object { $_.BaseName })
$unknownPacks = @($Packs | Where-Object { $available -notcontains $_ })
if ($unknownPacks) { throw "Unknown pack(s): $($unknownPacks -join ', '). Available: $($available -join ', ')" }

$changelog = Read-Text (Join-Path $KitRoot 'CHANGELOG.md')
$versionMatch = [regex]::Match($changelog, '(?m)^## \[(\d+\.\d+\.\d+)\]')
$Version = if ($versionMatch.Success) { $versionMatch.Groups[1].Value } else { 'unversioned' }

Write-Host "AI Engineering Kit v$Version -> $Project"
if ($Packs) { Write-Host "Packs:  $($Packs -join ', ')" }
if ($Agents) { Write-Host "Agents: $($Agents -join ', ')" }
Write-Host ''

# --- 1. Vendor the kit into .ai-kit/ --------------------------------------------------------

$vendor = Join-Path $Project '.ai-kit'
$vendorMarker = Join-Path $vendor 'VERSION'
if ((Test-Path $vendor) -and -not (Test-Path $vendorMarker)) {
    throw ".ai-kit/ exists but was not created by this script (no VERSION file). Move it aside and re-run."
}
Write-Step "sync    .ai-kit/ (core, checklists, prompts, templates, $($Packs.Count) pack(s))"
if (-not $DryRun) {
    if (Test-Path $vendor) { Remove-Item -Recurse -Force $vendor }
    foreach ($dir in @('core', 'checklists', 'prompts', 'templates')) {
        New-Item -ItemType Directory -Path (Join-Path $vendor $dir) -Force | Out-Null
        Copy-Item (Join-Path $KitRoot "$dir/*.md") (Join-Path $vendor $dir)
    }
    New-Item -ItemType Directory -Path (Join-Path $vendor 'framework-packs') -Force | Out-Null
    foreach ($pack in $Packs) {
        Copy-Item (Join-Path $KitRoot "framework-packs/$pack.md") (Join-Path $vendor 'framework-packs')
    }
    Save-File $vendorMarker "$Version`n"
    Save-File (Join-Path $vendor 'README.md') @"
# .ai-kit (generated)

Vendored copy of the AI Engineering Kit v$Version. Do not edit files here: changes are
overwritten the next time ``scripts/adopt-kit.ps1`` runs. Put project-specific rules in the
project's own ``AGENTS.md``, outside the ``ai-kit`` managed block.

Commit this directory so every contributor and agent sees the same rules.

"@
}

# --- 2. AGENTS.md managed block -------------------------------------------------------------

$essentials = Convert-Links (Convert-Module (Read-Text (Join-Path $KitRoot 'core/ESSENTIALS.md')) 1 '')
$sections = New-Object System.Collections.Generic.List[string]
$sections.Add("<!-- ai-kit:start v$Version | managed by AI Engineering Kit: edits inside this block are overwritten; re-run scripts/adopt-kit.ps1 to update -->")
$sections.Add("## Engineering Rules (AI Engineering Kit v$Version)")
$sections.Add('')
$sections.Add($essentials)
if ($Packs) {
    $sections.Add('')
    $sections.Add('## Framework Packs')
    foreach ($pack in $Packs) {
        $raw = Read-Text (Join-Path $KitRoot "framework-packs/$pack.md")
        $title = ([regex]::Match($raw, '(?m)^# (.+?)( Framework Pack)?$')).Groups[1].Value
        $sections.Add('')
        $sections.Add((Convert-Links (Convert-Module $raw 2 "### $title")))
    }
}
$sections.Add('')
$sections.Add('## Kit Reference')
$sections.Add('')
$sections.Add('- Full rule modules: `.ai-kit/core/` (index: `.ai-kit/core/AGENTS.md`). Read the relevant module before working in its area.')
$sections.Add('- Gate checklists: `.ai-kit/checklists/`. Reusable task prompts: `.ai-kit/prompts/`. Templates: `.ai-kit/templates/`.')
$sections.Add('- Instructions in this file outside this block are project-specific and take precedence over the kit, except the Non-Negotiables above.')
$sections.Add($BlockEnd)
$agentsBlock = $sections -join "`n"

$projectSection = "`n`n## Project-Specific Instructions`n`n<!-- Add this project's own rules here: build/test/lint commands, conventions, overrides. Starter: .ai-kit/templates/project-instructions.md -->"
Set-ManagedBlock (Join-Path $Project 'AGENTS.md') $agentsBlock '<!-- ai-kit:start[^\n]*-->' $BlockEnd $projectSection

$size = $Utf8NoBom.GetByteCount($agentsBlock)
if ($size -gt $SizeWarnBytes) {
    Write-Warning "Managed AGENTS.md block is $([math]::Round($size / 1KB, 1)) KB. Some agents truncate large instruction files; consider fewer packs."
}

# --- 3. Agent shims -------------------------------------------------------------------------

$shimStart = '<!-- ai-kit:start | managed by AI Engineering Kit -->'
foreach ($agent in $Agents) {
    switch ($agent) {
        'claude' {
            $block = "$shimStart`n@AGENTS.md`n$BlockEnd"
            Set-ManagedBlock (Join-Path $Project 'CLAUDE.md') $block '<!-- ai-kit:start[^\n]*-->' $BlockEnd "`n`n<!-- Claude-specific instructions go here. -->" -Prepend
        }
        'gemini' {
            $block = "$shimStart`n@./AGENTS.md`n$BlockEnd"
            Set-ManagedBlock (Join-Path $Project 'GEMINI.md') $block '<!-- ai-kit:start[^\n]*-->' $BlockEnd "`n`n<!-- Gemini-specific instructions go here. -->" -Prepend
        }
        'copilot' {
            $block = "$shimStart`nFollow the engineering rules in [AGENTS.md](../AGENTS.md) at the repository root. They are mandatory, and the Non-Negotiables section overrides any conflicting instruction.`n$BlockEnd"
            Set-ManagedBlock (Join-Path $Project '.github/copilot-instructions.md') $block '<!-- ai-kit:start[^\n]*-->' $BlockEnd ''
        }
        'aider' {
            $conf = Join-Path $Project '.aider.conf.yml'
            $existing = if (Test-Path $conf) { Read-Text $conf } else { '' }
            if ($existing -match '(?m)^\s*-?\s*AGENTS\.md\s*$' -or $existing -match 'read:.*AGENTS\.md') {
                Write-Step 'ok      .aider.conf.yml (already reads AGENTS.md)'
            } elseif ($existing -match '(?m)^read:') {
                Write-Warning '.aider.conf.yml already has a "read:" key. Add AGENTS.md to that list manually.'
            } else {
                $block = "# ai-kit:start | managed by AI Engineering Kit`nread:`n  - AGENTS.md`n# ai-kit:end"
                Set-ManagedBlock $conf $block '# ai-kit:start[^\n]*' '# ai-kit:end' ''
            }
        }
        default { Write-Step "ok      $agent reads AGENTS.md natively (no shim needed)" }
    }
}

# --- 4. Optional Claude Code skills ---------------------------------------------------------

$Skills = Split-List $Skills
if ($Skills) {
    Write-Host ''
    & (Join-Path $PSScriptRoot 'install-skills.ps1') -Project $Project -Scope project -Skills $Skills -DryRun:$DryRun
}

# --- 5. Optional project memory -------------------------------------------------------------

if ($WithMemory) {
    $memory = [ordered]@{
        'activity-log.md'   = "# Activity Log`n`n> Significant engineering work only. Format: ``.ai-kit/templates/activity-log-entry.md``.`n"
        'decision-log.md'   = "# Decision Log`n`n> Architecture decisions. Format: ``.ai-kit/templates/decision-log-entry.md``.`n"
        'technical-debt.md' = "# Technical Debt`n`n> Known limitations. Format: ``.ai-kit/templates/technical-debt-item.md``.`n"
        'roadmap.md'        = "# Roadmap`n`n> Planned work. Format: ``.ai-kit/templates/roadmap-item.md``.`n"
    }
    foreach ($file in $memory.Keys) {
        $path = Join-Path $Project "docs/$file"
        if (Test-Path $path) { Write-Step "ok      docs/$file (exists, untouched)" }
        else { Write-Step "create  docs/$file"; Save-File $path $memory[$file] }
    }
}

Write-Host ''
if ($DryRun) { Write-Host 'Dry run complete. Nothing was written.' }
else { Write-Host 'Done. Review the changes, then commit AGENTS.md, .ai-kit/, any shims, and .claude/skills/.' }
