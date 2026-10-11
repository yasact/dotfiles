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

# Cascadia Code NF (Nerd Font variant, used by windows/terminal/settings.json and the prompt icons)
# Not in winget; installed per-user from the official microsoft/cascadia-code release.
$fontDir = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
$fontReg = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts"
$fonts = @{
    "CascadiaCodeNF.ttf"       = "Cascadia Code NF (TrueType)"
    "CascadiaCodeNFItalic.ttf" = "Cascadia Code NF Italic (TrueType)"
}

if (-not (Test-Path (Join-Path $fontDir "CascadiaCodeNF.ttf")))
{
    try
    {
        $release = Invoke-RestMethod "https://api.github.com/repos/microsoft/cascadia-code/releases/latest"
        $asset = $release.assets | Where-Object { $_.name -like "CascadiaCode-*.zip" } | Select-Object -First 1
        $work = Join-Path ([System.IO.Path]::GetTempPath()) "cascadia-code-nf"
        New-Item -Path $work -ItemType Directory -Force | Out-Null
        Invoke-WebRequest $asset.browser_download_url -OutFile (Join-Path $work "CascadiaCode.zip")
        Expand-Archive (Join-Path $work "CascadiaCode.zip") -DestinationPath $work -Force

        New-Item -Path $fontDir -ItemType Directory -Force | Out-Null
        foreach ($file in $fonts.Keys)
        {
            $dest = Join-Path $fontDir $file
            Copy-Item (Join-Path $work "ttf\$file") $dest -Force
            New-ItemProperty -Path $fontReg -Name $fonts[$file] -Value $dest -PropertyType String -Force | Out-Null
        }
        Remove-Item $work -Recurse -Force
        Write-Host "Installed Cascadia Code NF ($($release.tag_name)). Restart Windows Terminal to pick it up."
    }
    catch
    {
        Write-Error "Cascadia Code NF のインストール中にエラーが発生しました: $_"
    }
}





