#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Sync AI-assisted output instruction files across all repositories in c:\git

.DESCRIPTION
    This script scans the c:\git directory tree for copies of ai-assisted-output.instructions.md
    and updates them from the canonical version if they are out of date. The canonical version
    is located at: c:\git\AIASD\AI-Assisted-Software-Development\.github\instructions\

.PARAMETER WhatIf
    Show what would be updated without making changes

.PARAMETER Force
    Update all files regardless of age (force overwrite)

.PARAMETER Backup
    Create .bak backups before updating files

.PARAMETER Detailed
    Show detailed information during execution

.EXAMPLE
    .\sync-ai-instructions.ps1
    # Scan and update outdated files

.EXAMPLE
    .\sync-ai-instructions.ps1 -WhatIf
    # Show what would be updated without making changes

.EXAMPLE
    .\sync-ai-instructions.ps1 -Force -Backup -Detailed
    # Force update all files with backups and detailed output
#>

[CmdletBinding()]
param(
    [switch]$WhatIf,
    [switch]$Force,
    [switch]$Backup,
    [switch]$Detailed
)

# Configuration
$CanonicalPath = "c:\git\AIASD\AI-Assisted-Software-Development\.github\instructions\ai-assisted-output.instructions.md"
$SearchRoot = "c:\git"
$FileName = "ai-assisted-output.instructions.md"

# Colors for output
$ColorSuccess = "Green"
$ColorWarning = "Yellow"
$ColorError = "Red"
$ColorInfo = "Cyan"
$ColorCanonical = "Magenta"

function Write-StatusMessage {
    param(
        [string]$Message,
        [string]$Color = "White",
        [string]$Prefix = ""
    )

    if ($Prefix) {
        Write-Host "[$Prefix] " -ForegroundColor $Color -NoNewline
    }
    Write-Host $Message -ForegroundColor $Color
}

function Get-FileHash {
    param([string]$FilePath)

    try {
        $hash = Get-FileHash -Path $FilePath -Algorithm SHA256
        return $hash.Hash
    }
    catch {
        return $null
    }
}

function Test-FileOutdated {
    param(
        [string]$FilePath,
        [string]$CanonicalPath
    )

    if (-not (Test-Path $FilePath)) {
        return $false
    }

    if ($Force) {
        return $true
    }

    $fileInfo = Get-Item $FilePath
    $canonicalInfo = Get-Item $CanonicalPath

    # Check size first (quick comparison)
    if ($fileInfo.Length -ne $canonicalInfo.Length) {
        return $true
    }

    # Check last write time
    if ($fileInfo.LastWriteTime -lt $canonicalInfo.LastWriteTime) {
        return $true
    }

    # If sizes and times match, check content hash
    $fileHash = Get-FileHash -FilePath $FilePath
    $canonicalHash = Get-FileHash -FilePath $CanonicalPath

    return $fileHash -ne $canonicalHash
}

function Backup-File {
    param([string]$FilePath)

    if (-not $Backup) {
        return $true
    }

    try {
        $backupPath = "$FilePath.bak.$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        Copy-Item $FilePath $backupPath -Force
        Write-StatusMessage "Created backup: $backupPath" $ColorInfo "BACKUP"
        return $true
    }
    catch {
        Write-StatusMessage "Failed to create backup: $($_.Exception.Message)" $ColorError "ERROR"
        return $false
    }
}

function Update-InstructionFile {
    param(
        [string]$TargetPath,
        [string]$CanonicalPath
    )

    if ($WhatIf) {
        Write-StatusMessage "Would update: $TargetPath" $ColorWarning "WHATIF"
        return $true
    }

    try {
        # Create backup if requested
        if ($Backup) {
            if (-not (Backup-File $TargetPath)) {
                return $false
            }
        }

        # Copy canonical file to target
        Copy-Item $CanonicalPath $TargetPath -Force

        # Verify the copy succeeded
        $newSize = (Get-Item $TargetPath).Length
        $canonicalSize = (Get-Item $CanonicalPath).Length

        if ($newSize -eq $canonicalSize) {
            Write-StatusMessage "Updated: $TargetPath ($newSize bytes)" $ColorSuccess "UPDATED"
            return $true
        }
        else {
            Write-StatusMessage "Size mismatch after copy: $TargetPath" $ColorError "ERROR"
            return $false
        }
    }
    catch {
        Write-StatusMessage "Failed to update $TargetPath`: $($_.Exception.Message)" $ColorError "ERROR"
        return $false
    }
}

# Main execution starts here
Write-Host ""
Write-Host "=== AI Instructions Synchronization Script ===" -ForegroundColor $ColorInfo
Write-Host ""

# Verify canonical file exists
if (-not (Test-Path $CanonicalPath)) {
    Write-StatusMessage "Canonical file not found: $CanonicalPath" $ColorError "FATAL"
    exit 1
}

$canonicalInfo = Get-Item $CanonicalPath
Write-StatusMessage "Canonical source: $CanonicalPath" $ColorCanonical "SOURCE"
Write-StatusMessage "Size: $($canonicalInfo.Length) bytes, Modified: $($canonicalInfo.LastWriteTime)" $ColorCanonical "SOURCE"
Write-Host ""

# Find all instruction files
Write-StatusMessage "Scanning $SearchRoot for $FileName files..." $ColorInfo "SCAN"

try {
    $allFiles = Get-ChildItem -Path $SearchRoot -Recurse -Name $FileName -ErrorAction SilentlyContinue |
    ForEach-Object { Join-Path $SearchRoot $_ }
}
catch {
    Write-StatusMessage "Error scanning directories: $($_.Exception.Message)" $ColorError "ERROR"
    exit 1
}

if ($allFiles.Count -eq 0) {
    Write-StatusMessage "No $FileName files found in $SearchRoot" $ColorWarning "RESULT"
    exit 0
}

Write-StatusMessage "Found $($allFiles.Count) files" $ColorInfo "SCAN"
Write-Host ""

# Process each file
$updatedCount = 0
$skippedCount = 0
$errorCount = 0

foreach ($file in $allFiles) {
    $isCanonical = $file -eq $CanonicalPath

    if ($isCanonical) {
        Write-StatusMessage "$file" $ColorCanonical "CANONICAL"
        continue
    }

    if (-not (Test-Path $file)) {
        Write-StatusMessage "File no longer exists: $file" $ColorWarning "SKIP"
        $skippedCount++
        continue
    }

    $fileInfo = Get-Item $file
    $isOutdated = Test-FileOutdated -FilePath $file -CanonicalPath $CanonicalPath

    if ($Detailed -or $WhatIf) {
        $status = if ($isOutdated) { "OUTDATED" } else { "CURRENT" }
        $color = if ($isOutdated) { $ColorWarning } else { $ColorSuccess }
        Write-StatusMessage "$file ($($fileInfo.Length) bytes, $($fileInfo.LastWriteTime))" $color $status
    }

    if ($isOutdated) {
        if (Update-InstructionFile -TargetPath $file -CanonicalPath $CanonicalPath) {
            $updatedCount++
        }
        else {
            $errorCount++
        }
    }
    else {
        if ($Detailed) {
            Write-StatusMessage "Already current: $file" $ColorSuccess "SKIP"
        }
        $skippedCount++
    }
}

# Summary
Write-Host ""
Write-Host "=== Synchronization Summary ===" -ForegroundColor $ColorInfo

if ($WhatIf) {
    Write-StatusMessage "WhatIf mode - no files were actually modified" $ColorWarning "SUMMARY"
}

Write-StatusMessage "Files processed: $($allFiles.Count - 1)" $ColorInfo "SUMMARY"
Write-StatusMessage "Files updated: $updatedCount" $ColorSuccess "SUMMARY"
Write-StatusMessage "Files current: $skippedCount" $ColorSuccess "SUMMARY"
Write-StatusMessage "Errors: $errorCount" $(if ($errorCount -gt 0) { $ColorError } else { $ColorSuccess }) "SUMMARY"

if ($errorCount -gt 0) {
    exit 1
}

Write-Host ""
Write-StatusMessage "Synchronization completed successfully!" $ColorSuccess "DONE"

# Additional helpful output
if ($updatedCount -gt 0 -and -not $WhatIf) {
    Write-Host ""
    Write-StatusMessage "Next steps:" $ColorInfo "HELP"
    Write-Host "  1. Review updated files in their respective repositories" -ForegroundColor Gray
    Write-Host "  2. Commit changes with semantic commit messages" -ForegroundColor Gray
    Write-Host "  3. Push changes to keep repositories synchronized" -ForegroundColor Gray

    if ($Backup) {
        Write-Host ""
        Write-StatusMessage "Backup files were created with .bak.YYYYMMDD-HHMMSS extensions" $ColorInfo "HELP"
        Write-Host "  - Review and delete backups once you're satisfied with the updates" -ForegroundColor Gray
    }
}
