#!/bin/sh -xe

# dotfilesのルートディレクトリに移動する
# ここでは .git ディレクトリがプロジェクトのルートにあると仮定
cd "$(dirname "$0")"
while [ ! -d .git ]; do
    if [ "$PWD" = "/" ]; then
        # ルートディレクトリに到達した場合、.git が見つからなかったことを意味する
        echo "Error: .git directory not found. Are you in a Git repository?"
        exit 1
    fi
    cd ..
done

# プロジェクトのルートディレクトリへの絶対パスを取得
DOTFILES_ROOT=$(git rev-parse --show-toplevel)
if [ $? -ne 0 ]; then
    echo "Error: Failed to get absolute path to repository root."
    exit 1
fi

# bash
ln -sf "$DOTFILES_ROOT/shell/bash/.bashrc" ~/.bashrc
ln -sf "$DOTFILES_ROOT/shell/bash/.profile" ~/.profile
ln -sf "$DOTFILES_ROOT/shell/bash/.inputrc" ~/.inputrc

# zsh
ln -sf "$DOTFILES_ROOT/shell/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_ROOT/shell/zsh/.zshenv" ~/.zshenv

# aliases
ln -sf "$DOTFILES_ROOT/shell/common/.aliases" ~/.aliases

# .vimrc
ln -sf "$DOTFILES_ROOT/vim/.vimrc" ~/.vimrc

# nvim
# nvim用のディレクトリがない場合は作成する
mkdir -p ~/.config/nvim
# nvim用のinit.vimをlinkする
ln -sf "$DOTFILES_ROOT/vim/nvim/init.vim" ~/.config/nvim/init.vim

# mkdir -p ~/.config/nvim/lua
# ln -sf "$DOTFILES_ROOT./nvim/init.lua" ~/.config/nvim/init.lua
# ln -sf "$DOTFILES_ROOT./nvim/lua/base.lua" ~/.config/nvim/lua/base.lua
# ln -sf "$DOTFILES_ROOT./nvim/lua/keymaps.lua" ~/.config/nvim/lua/keymaps.lua
# ln -sf "$DOTFILES_ROOT./nvim/lua/options.lua" ~/.config/nvim/lua/options.lua
# ln -sf "$DOTFILES_ROOT./nvim/lua/plugins.lua" ~/.config/nvim/lua/plugins.lua

# tmax用の.tmux.confをlinkする
ln -sf "$DOTFILES_ROOT/tmux/.tmux.conf" ~/.tmux.conf
