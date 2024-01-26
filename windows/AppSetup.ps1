
# winget
# winget install AgileBits.1Password
# winget install Amazon.Kindle
# winget install AutoHotkey.AutoHotkey
# winget install LGUG2Z.komorebi
# winget install LGUG2Z.whkd
# winget install Anki.Anki
# winget install Brave.Brave
# winget install Docker.DockerDesktop
# winget install Dropbox.Dropbox
# winget install Foxit.FoxitReader
# winget install Git.Git
# winget install Google.Chrome
# winget install LibreWolf.LibreWolf
# winget install Logitech.LGS
# winget install Microsoft.WindowsTerminal
# # winget install Mozilla.Thunderbird
# # winget install Microsoft.OneDrive
# winget install PhraseExpress.PhraseExpress
# # winget install PostgreSQL.PostgreSQL
# # winget install Debian.Debian
# winget install vim.vim
# # winget install Waterfox.Waterfox
# # winget install Microsoft.VisualStudio.2022.Community
# # winget install Microsoft.VisualStudio.2022.BuildTools
# winget install OpenJS.NodeJS
# winget install DeepL.DeepL
# winget install SlackTechnologies.Slack
# winget install Microsoft.SQLServerManagementStudio
# # winget install Kensington.KensingtonWorks
# winget install Neovim.Neovim
# winget install Microsoft.PowerShell
# # winget install Microsoft.VisualStudioCode.Insiders
# winget install Microsoft.VisualStudioCode
# winget install Python.Python.3.10
# winget install Python.Launcher
# winget install Microsoft.PowerShell
# winget install Microsoft.PowerToys
# winget install 7zip.7zip




$applications = @(
    "AgileBits.1Password"
    "Amazon.Kindle"
    "AutoHotkey.AutoHotkey"
    "LGUG2Z.komorebi"
    "LGUG2Z.whkd"
    "Anki.Anki"
    "Brave.Brave"
    "Docker.DockerDesktop"
    "Dropbox.Dropbox"
    "Foxit.FoxitReader"
    "Git.Git"
    "Google.Chrome"
    "LibreWolf.LibreWolf"
    "Logitech.LGS"
    "Microsoft.WindowsTerminal"
    "PhraseExpress.PhraseExpress"
    "vim.vim"
    "OpenJS.NodeJS"
    "DeepL.DeepL"
    "SlackTechnologies.Slack"
    "Microsoft.SQLServerManagementStudio"
    "Neovim.Neovim"
    "Microsoft.PowerShell"
    "Microsoft.VisualStudioCode"
    "Python.Python.3.10"
    "Python.Launcher"
    "Microsoft.PowerShell"
    "Microsoft.PowerToys"
    "7zip.7zip"
)

foreach ($app in $applications)
{
    Write-Host "Installing $app..."
    winget install $app
}


# scoop
# install scoop
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# bucket
scoop bucket add versions
scoop bucket add extras
scoop bucket add main

scoop install uutils-coreutils
scoop install lsd
scoop install sudo
scoop install FiraCode
scoop install FiraCode
scoop install FiraCode-NF
scoop install FiraCode-NF-Mono
scoop install FiraCode-Script
scoop install archwsl