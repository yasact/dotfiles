#!/bin/bash -xe
#
# dotfilesのルートディレクトリへの絶対パス(DOTFILES_ROOT)を取得
script_path="$0" # このスクリプトのパス
source "$(dirname "$0")"/utils/setDotfilesRoot.sh
DOTFILES_ROOT=$(setDotfilesRoot "$script_path")
if [ $? -eq 0 ]; then
    echo "Dotfiles root: $DOTFILES_ROOT"
else
    echo "Error finding dotfiles root."
fi

# osを判別する
# shellcheck source=/Users/ysn/dotfiles/utils/setOsType.sh
if [ -e ~/dotfiles/utils/setOsType.sh ]; then
    . $DOTFILES_ROOT/utils/setOsType.sh
    setOsType
else
    echo "setOsType.sh notfound"
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

# git
ln -sf "$DOTFILES_ROOT/git/.gitconfig" ~/.gitconfig

# .vimrc
ln -sf "$DOTFILES_ROOT/vim/.vimrc" ~/.vimrc

# lsd
# lsd用のディレクトリが無い場合は作成する
mkdir -p ~/.config/lsd
ln -sf "$DOTFILES_ROOT/lsd/config.yaml" ~/.config/lsd/config.yaml

# nvim
# nvim用のディレクトリがない場合は作成する
mkdir -p ~/.config/nvim
# nvim用のinit.vimをlinkする
ln -sf "$DOTFILES_ROOT/vim/nvim/init.vim" ~/.config/nvim/init.vim

# mkdir -p ~/.config/nvim/lua
# ln -sf "$DOTFILES_ROOT./nvim/init.lua" ~/.config/nvim/init.lua
# ln -sf "$DOTFILES_ROOT./nvim/lua/base.lua" ~/.config/nvim/lua/base.lua
# ln  -sf "$DOTFILES_ROOT./nvim/lua/keymaps.lua" ~/.config/nvim/lua/keymaps.lua
# ln -sf "$DOTFILES_ROOT./nvim/lua/options.lua" ~/.config/nvim/lua/options.lua
# ln -sf "$DOTFILES_ROOT./nvim/lua/plugins.lua" ~/.config/nvim/lua/plugins.lua

# tmax用の.tmux.confをlinkする
ln -sf "$DOTFILES_ROOT/tmux/.tmux.conf" ~/.tmux.conf

# macos用のsymbolicLinkを作成する
if [ "$ostype" = "mac" ]; then
    . $DOTFILES_ROOT/macos/link.macos.sh
fi
