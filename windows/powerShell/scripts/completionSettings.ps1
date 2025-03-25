Import-Module posh-git -Force

# zsh-like tab completion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Write-Host "completionSettings.ps1 is loaded"
