# posh-git is optional: load it only when installed (git branch is handled
# by prompt_settings.ps1, so the prompt works without it)
if (Get-Module -ListAvailable -Name posh-git)
{
    Import-Module posh-git -Force
}

# zsh-like tab completion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Write-Host "completionSettings.ps1 is loaded"
