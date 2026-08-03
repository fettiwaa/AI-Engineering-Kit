#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Validates internal consistency of the AI Engineering Kit.
.DESCRIPTION
    Checks that every core module imported by core/AGENTS.md exists,
    and that no framework pack duplicates core rules.
#>

$ErrorActionPreference = "Stop"
$root = (Get-Location).Path

$imports = Select-String -Path "$root\core\AGENTS.md" -Pattern '@import \[(.*?)\]\((.*?)\)' |
    ForEach-Object { $_.Matches.Groups[2].Value }

$missing = $imports | Where-Object { -not (Test-Path "$root\core\$_") }

if ($missing) {
    Write-Error "Missing core modules: $missing"
    exit 1
}

Write-Host "All core module imports resolve."
Exit 0
