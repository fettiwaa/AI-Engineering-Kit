#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Installs the kit's prompts as Claude Code skills.
.DESCRIPTION
    Every prompt in prompts/ with "skill:" frontmatter becomes <skills-dir>/<skill>/SKILL.md:
      - Scope project: <Project>/.claude/skills/   (commit it; shared with the team)
      - Scope user:    ~/.claude/skills/           (available in every project)
    The prompt stays the single source: re-run this script after updating the kit. Only
    SKILL.md files carrying the kit's marker are overwritten; a skill of the same name that
    you wrote yourself is left untouched.
.PARAMETER Skills
    Skill names to install, or "all". Run with -List to see them.
.PARAMETER Scope
    project (default) or user.
.PARAMETER Project
    Project directory for -Scope project. Defaults to the current directory.
.PARAMETER List
    List available skills and exit.
.PARAMETER DryRun
    Print what would change without writing anything.
.EXAMPLE
    ./scripts/install-skills.ps1 -List
    ./scripts/install-skills.ps1 -Skills all -Scope user
    ./scripts/install-skills.ps1 -Project ../my-app -Skills debug-issue,review-code
#>
[CmdletBinding()]
param(
    [string[]]$Skills = @(),
    [ValidateSet('project', 'user')][string]$Scope = 'project',
    [string]$Project = (Get-Location).Path,
    [switch]$List,
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$KitRoot = Split-Path -Parent $PSScriptRoot
$Utf8NoBom = New-Object System.Text.UTF8Encoding $false
$Marker = 'ai-kit:skill'

function Read-Text([string]$Path) { ([System.IO.File]::ReadAllText($Path)) -replace "`r`n", "`n" }

# Parse "key: value" frontmatter at the top of a prompt; returns $null when absent.
function Get-PromptSkill([System.IO.FileInfo]$File) {
    $text = Read-Text $File.FullName
    $m = [regex]::Match($text, '\A---\n(.*?)\n---\n(.*)\z', 'Singleline')
    if (-not $m.Success) { return $null }
    $meta = @{}
    foreach ($line in ($m.Groups[1].Value -split "`n")) {
        $kv = [regex]::Match($line, '^([a-z-]+):\s*(.*?)\s*$')
        if ($kv.Success) { $meta[$kv.Groups[1].Value] = $kv.Groups[2].Value }
    }
    if (-not $meta['skill']) { return $null }
    [pscustomobject]@{
        Name        = $meta['skill']
        Description = $meta['description']
        ManualOnly  = ($meta['manual-only'] -eq 'true')
        Source      = "prompts/$($File.Name)"
        Body        = $m.Groups[2].Value.Trim()
    }
}

$changelog = Read-Text (Join-Path $KitRoot 'CHANGELOG.md')
$versionMatch = [regex]::Match($changelog, '(?m)^## \[(\d+\.\d+\.\d+)\]')
$Version = if ($versionMatch.Success) { $versionMatch.Groups[1].Value } else { 'unversioned' }

$available = @(Get-ChildItem (Join-Path $KitRoot 'prompts') -Filter *.md |
    ForEach-Object { Get-PromptSkill $_ } | Where-Object { $_ } | Sort-Object Name)

if ($List -or -not $Skills) {
    Write-Host "Skills available in AI Engineering Kit v${Version}:"
    foreach ($s in $available) {
        $mode = if ($s.ManualOnly) { 'manual' } else { 'auto  ' }
        Write-Host ("  {0,-24} {1}  {2}" -f $s.Name, $mode, $s.Source)
    }
    if (-not $List) { Write-Host ''; Write-Host 'Pass -Skills <names> or -Skills all to install.' }
    return
}

$requested = @($Skills | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim().ToLower() } | Where-Object { $_ })
if ($requested -contains 'all') { $selected = $available }
else {
    $unknown = @($requested | Where-Object { $n = $_; -not ($available | Where-Object { $_.Name -eq $n }) })
    if ($unknown) { throw "Unknown skill(s): $($unknown -join ', '). Run with -List to see available skills." }
    $selected = @($available | Where-Object { $requested -contains $_.Name })
}

if ($Scope -eq 'user') {
    $homeDir = if ($env:HOME) { $env:HOME } else { $env:USERPROFILE }
    $target = Join-Path $homeDir '.claude/skills'
} else {
    if (-not (Test-Path $Project -PathType Container)) { throw "Project directory not found: $Project" }
    $target = Join-Path (Resolve-Path $Project).Path '.claude/skills'
}
$prefix = if ($DryRun) { '[dry-run] ' } else { '' }
Write-Host "Installing $($selected.Count) skill(s) ($Scope scope) -> $target"

foreach ($s in $selected) {
    $body = $s.Body -replace '`core/', '`.ai-kit/core/' -replace '`templates/', '`.ai-kit/templates/' -replace '`checklists/', '`.ai-kit/checklists/'
    $body = $body -replace '\]\(([a-z0-9-]+\.md)\)', '](.ai-kit/prompts/$1)'
    $quoted = '"' + ($s.Description -replace '\\', '\\' -replace '"', '\"') + '"'
    $lines = @('---', "name: $($s.Name)", "description: $quoted")
    if ($s.ManualOnly) { $lines += 'disable-model-invocation: true' }
    $lines += @('---', '', "<!-- $Marker v$Version | generated from $($s.Source) by AI Engineering Kit; local edits are overwritten when scripts/install-skills.ps1 runs again -->", '', $body, '',
        '## Project Rules', '',
        'If the project has an `AGENTS.md` or an `.ai-kit/` directory, its rules apply to this task. Paths above that start with `.ai-kit/` refer to that vendored kit; skip them if it is absent.')
    $content = ($lines -join "`n") + "`n"

    $file = Join-Path (Join-Path $target $s.Name) 'SKILL.md'
    if (Test-Path $file) {
        $existing = Read-Text $file
        if ($existing -notmatch [regex]::Escape($Marker)) {
            Write-Warning "skip    $($s.Name): $file exists and was not installed by the kit"
            continue
        }
        if ($existing -eq $content) { Write-Host "${prefix}ok      $($s.Name) (unchanged)"; continue }
        Write-Host "${prefix}update  $($s.Name)"
    } else {
        Write-Host "${prefix}create  $($s.Name)"
    }
    if (-not $DryRun) {
        New-Item -ItemType Directory -Path (Split-Path -Parent $file) -Force | Out-Null
        [System.IO.File]::WriteAllText($file, $content, $Utf8NoBom)
    }
}

Write-Host ''
Write-Host 'Invoke a skill in Claude Code with /<name>, or describe the task (non-manual skills load automatically).'
