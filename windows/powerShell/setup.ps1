# PowerShell setup for dotfiles
#   Run from anywhere (paths are resolved relative to this script):
#     pwsh -File ~\dotfiles\windows\powerShell\setup.ps1
#   Symbolic links need Administrator or Developer Mode.

$dotfilesDir = Resolve-Path (Join-Path $PSScriptRoot "..\..")

# ── 1. Profile ───────────────────────────────────────────────
# Copy profile scripts into $PROFILE's directory
$PowerShellDir = Split-Path -Parent $PROFILE

if (-not (Test-Path -Path $PowerShellDir))
{
    New-Item -Path $PowerShellDir -ItemType Directory | Out-Null
}

Copy-Item -Path (Join-Path $PSScriptRoot "profile\*") -Destination $PowerShellDir -Force
Write-Host "Copied profile scripts to $PowerShellDir" -ForegroundColor Green

# ── 2. Symbolic links ────────────────────────────────────────
function New-SymbolicLink
{
    param (
        [string]$LinkPath,
        [string]$TargetPath
    )

    if (-not (Test-Path $TargetPath))
    {
        Write-Warning "Target not found, skipping: $TargetPath"
        return
    }

    if (Test-Path $LinkPath)
    {
        Remove-Item $LinkPath -Force
    }

    try
    {
        New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath -ErrorAction Stop | Out-Null
        Write-Host "Linked $LinkPath -> $TargetPath" -ForegroundColor Green
    }
    catch
    {
        Write-Warning "Failed to create symlink $LinkPath (run as Administrator or enable Developer Mode): $_"
    }
}

New-SymbolicLink -LinkPath (Join-Path $HOME ".vimrc")     -TargetPath (Join-Path $dotfilesDir "vim\.vimrc")
New-SymbolicLink -LinkPath (Join-Path $HOME ".gitconfig") -TargetPath (Join-Path $dotfilesDir "git\.gitconfig")

Write-Host "Done. Restart PowerShell to apply the new prompt." -ForegroundColor Cyan
