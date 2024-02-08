# Add posh-git
Import-Module posh-git

# zsh-like tab completion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

write-host "completionSettings.ps1 is loaded"