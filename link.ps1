# シンボリックリンクへのパス
$linkPath = "~\.vimrc"

# ターゲットファイルのパス
$targetPath = ".\dotfiles\vim\.vimrc"

# シンボリックリンクがすでに存在するかどうかを確認
if (Test-Path $linkPath)
{
    # 存在する場合は削除
    Remove-Item $linkPath
}

sudo New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath




