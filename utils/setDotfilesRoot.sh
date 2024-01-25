#!/bin/bash -xe

function setDotfilesRoot() {
    local current_dir
    current_dir=$(dirname "$1") # スクリプトのディレクトリ

    # .git ディレクトリを探索
    while [ ! -d "$current_dir/.git" ]; do
        if [ "$current_dir" = "/" ]; then
            echo "Error: .git directory not found. Are you in a Git repository?"
            return 1
        fi
        current_dir=$(dirname "$current_dir") # 親ディレクトリに移動
    done

    # dotfilesのルートディレクトリへの絶対パスを取得
    DOTFILES_ROOT=$(git -C "$current_dir" rev-parse --show-toplevel)
    if [ $? -ne 0 ]; then
        echo "Error: Failed to get absolute path to repository root."
        return 1
    fi

    echo "$DOTFILES_ROOT" # 絶対パスを出力
}

# 関数の使用例
script_path="$0" # このスクリプトのパス
dotfiles_root=$(find_dotfiles_root "$script_path")
if [ $? -eq 0 ]; then
    echo "Dotfiles root: $dotfiles_root"
else
    echo "Error finding dotfiles root."
fi
