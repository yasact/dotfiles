
# PowerShellのドキュメントディレクトリへのパスを結合する
$PowerShellDir = Join-Path -Path $HOME -ChildPath "Documents\PowerShell"

# ディレクトリが存在しない場合は作成する
if (-not (Test-Path -Path $PowerShellDir))
{
    New-Item -Path $PowerShellDir -ItemType Directory
}
# ファイルをコピーする
Copy-Item -Path .\profile\* -Destination $PowerShellDir


# nvim
# nvim用のディレクトリがない場合は作成する
# init.vimはシンボリックリンク参照するのは読み込んでくれないのでコピーする
$NeoVimDir = Join-Path -Path $HOME -ChildPath "\AppData\Local\nvim"
# ディレクトリが存在しない場合は作成する
if (-not (Test-Path -Path $NeoVimDir))
{
    New-Item -Path $NeoVimDIr -ItemType Directory
}
# nvim用のinit.vimをコピーする
Copy-Item -Path "~\dotfiles\vim\nvim\*" -Destination $NeoVimDir


# シンボリックリンクを作成する関数
function New-SymbolicLink
{
    param (
        [string]$LinkPath,
        [string]$TargetPath
    )

    # ユーザーホームディレクトリを解決
    # $resolvedLinkPath = Resolve-Path $LinkPath

    # シンボリックリンクがすでに存在するかどうかを確認
    if (Test-Path $LinkPath)
    {
        # 存在する場合は削除
        Remove-Item $LinkPath
    }

    # シンボリックリンクを作成
    sudo New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath
}

# .vimrcのシンボリックリンクを作成
New-SymbolicLink -LinkPath "~\.vimrc" -TargetPath ".\dotfiles\vim\.vimrc"

# .gitconfigのシンボリックリンクを作成
New-SymbolicLink -LinkPath "~\.gitconfig" -TargetPath ".\dotfiles\git\.gitconfig"


