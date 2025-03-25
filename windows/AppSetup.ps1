# winget
$applications = @(
    "7zip.7zip"
    "AgileBits.1Password"
    "Amazon.Kindle"
    "Anki.Anki"
    # "AutoHotkey.AutoHotkey"
    "Brave.Brave"
    # "DeepL.DeepL"
    # "Docker.DockerDesktop"
    "Dropbox.Dropbox"
    # "Foxit.FoxitReader"
    "Git.Git"
    "Google.Chrome"
    # "LGUG2Z.komorebi"
    # "LGUG2Z.whkd"
    # "LibreWolf.LibreWolf"
    "Logitech.LGS"
    "Microsoft.PowerShell"
    "Microsoft.PowerToys"
    "Microsoft.SQLServerManagementStudio"
    "Microsoft.VisualStudioCode"
    "Microsoft.WindowsTerminal"
    "Neovim.Neovim"
    "OpenJS.NodeJS"
    # "PhraseExpress.PhraseExpress"
    "Python.Launcher"
    "Python.Python.3.10"
    "SlackTechnologies.Slack"
    "vim.vim"
    "Mozilla.Thunderbird"
    "ajeetdsouza.zoxide"
    "Doist.Todoist"
)

foreach ($app in $applications)
{
    Write-Host "Installing $app..."
    winget install $app
}


# scoop
# install scoop
# Scoopの存在を確認
if (-not (Get-Command scoop -ErrorAction SilentlyContinue))
{
    try
    {
        # Scoopが存在しない場合、インストールを試みる
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    }
    catch
    {
        # エラーが発生した場合の処理
        Write-Error "Scoopのインストール中にエラーが発生しました: $_"
        exit
    }
}

# bucket
scoop bucket add versions
scoop bucket add extras
scoop bucket add main
scoop bucket add nerd-fonts


# scoop install uutils-coreutils
# scoop install lsd
# scoop install sudo
scoop install FiraCode
scoop install FiraCode
scoop install FiraCode-NF
scoop install FiraCode-NF-Mono
scoop install FiraCode-Script
scoop install archwsl
# scoop install posh-git
scoop install zoxide
# PowerShell公式モジュールを使ったposh-gitのインストール（推奨）
if (-not (Get-Module -ListAvailable -Name posh-git))
{
    Install-Module posh-git -Scope CurrentUser -Force
}





