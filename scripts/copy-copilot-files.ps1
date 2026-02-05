<#
.SYNOPSIS
Copies selected GitHub Copilot instruction/chatmode files from a source repo to a destination.

.PARAMETER SourceRoot
Root of the source repository (defaults to the path you provided).

.PARAMETER DestinationRoot
Root where files will be copied (defaults to current directory).

.PARAMETER WhatIf
If specified, runs as a dry-run.

.PARAMETER Force
If specified, overwrites existing files.
#>

param(
    [string]$SourceRoot = 'C:\git\AIASD\AI-Assisted-Software-Development',
    [string]$DestinationRoot = (Get-Location).Path,
    [switch]$WhatIf,
    [switch]$Force
)

$patterns = @(
    '.github\chatmodes\*.chatmode.md',
    '.github\instructions\ai-assisted-output.instructions.md',
    '.github\instructions\create-chatmode.instructions.md',
    '.github\instructions\prompt-file.instructions.md',
    '.github\instructions\instruction-prompt.instructions.md',
    '.github\instructions\create-instruction-files.instructions.md',
    '.github\instructions\create-chatmode.instructions.md',
    '.github\instructions\instruction-prompt.instructions.md',
    '.github\prompts\check-context.prompt.md'
)

if (-not (Test-Path -Path $SourceRoot)) {
    Write-Error "SourceRoot not found: $SourceRoot"
    exit 1
}

$copied = @()
foreach ($pattern in $patterns) {
    $fullPattern = Join-Path -Path $SourceRoot -ChildPath $pattern
    $files = Get-ChildItem -Path $fullPattern -File -ErrorAction SilentlyContinue
    if (-not $files) {
        Write-Verbose "No matches for $fullPattern"
        continue
    }
    foreach ($item in $files) {
        $relative = $item.FullName.Substring($SourceRoot.Length).TrimStart('\', '/')
        $destPath = Join-Path $DestinationRoot $relative
        $destDir = Split-Path $destPath -Parent
        if (-not (Test-Path $destDir)) {
            New-Item -ItemType Directory -Path $destDir -Force | Out-Null
        }

        $copyParams = @{
            Path        = $item.FullName
            Destination = $destPath
            ErrorAction = 'Stop'
        }
        if ($Force) { $copyParams['Force'] = $true }
        if ($WhatIf) { $copyParams['WhatIf'] = $true }

        try {
            Copy-Item @copyParams
            $copied += $destPath
            Write-Output "Copied: $($item.FullName) -> $destPath"
        }
        catch {
            Write-Warning "Failed to copy $($item.FullName): $($_.Exception.Message)"
        }
    }
}

if ($copied.Count -eq 0) {
    Write-Warning "No files copied. Use `-Verbose` or run with `-WhatIf` to verify patterns and paths."
}
else {
    Write-Output "Total files copied: $($copied.Count)"
}

exit 0
