#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Quick sync script for AI instruction files - wrapper for sync-ai-instructions.ps1

.DESCRIPTION
    A simplified wrapper that runs the full sync with common options.
    This is the script you'll typically run for regular maintenance.

.EXAMPLE
    .\quick-sync.ps1
    # Standard sync with backup
#>

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
& "$ScriptDir\sync-ai-instructions.ps1" -Backup

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "💡 Quick tip: Run 'git status' in updated repositories to see changes" -ForegroundColor Cyan
}
