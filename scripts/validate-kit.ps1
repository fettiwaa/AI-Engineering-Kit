#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Validates internal consistency of the AI Engineering Kit.
.DESCRIPTION
    Checks that every core module imported by core/AGENTS.md exists, and that
    all referenced markdown files resolve within the repo. Link-integrity
    coverage is intentionally minimal (see docs/technical-debt.md T2).
#>

$ErrorActionPreference = "Stop"
$root = (Get-Location).Path

# 1. Every @import target referenced in core/AGENTS.md must exist under core/.
$imports = Select-String -Path "$root\core\AGENTS.md" -Pattern '@import \[(.*?)\]\((.*?)\)' |
    ForEach-Object { $_.Matches.Groups[2].Value }

$missing = $imports | Where-Object { -not (Test-Path "$root\core\$_") }
if ($missing) {
    Write-Error "Missing core modules referenced in AGENTS.md: $missing"
    exit 1
}

# 2. Framework packs and adapters must be present in expected counts.
$packs = Get-ChildItem "$root\framework-packs\*.md" -ErrorAction Stop
$adapters = Get-ChildItem "$root\adapters\*.md" -ErrorAction Stop
if ($packs.Count -lt 20) {
    Write-Error "Expected >=20 framework packs, found $($packs.Count)"
    exit 1
}
if ($adapters.Count -lt 8) {
    Write-Error "Expected >=8 adapters, found $($adapters.Count)"
    exit 1
}

Write-Host "All core module imports resolve."
Write-Host "Framework packs: $($packs.Count) | Adapters: $($adapters.Count)"
Exit 0
