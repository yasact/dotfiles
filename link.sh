#!/bin/sh

# bash
ln -sf ~/dotfiles/shell/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/shell/bash/.profile ~/.profile
ln -sf ~/dotfiles/shell/bash/.inputrc ~/.inputrc

# zsh
ln -sf ~/dotfiles/shell/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/shell/zsh/.zshenv ~/.zshenv

# aliases
ln -sf ~/dotfiles/shell/.aliases ~/.aliases

mkdir -p ~/.vim
ln -sf ~/dotfiles/colors ~/.vim/colors

# .vimrc
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

# nvim
# nvim用のディレクトリがない場合は作成する
mkdir -p ~/.config/nvim
# nvim用のinit.vimをlinkする
ln -sf ~/dotfiles/vim/nvim/init.vim ~/.config/nvim/init.vim

# mkdir -p ~/.config/nvim/lua
# ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
# ln -sf ~/dotfiles/nvim/lua/base.lua ~/.config/nvim/lua/base.lua
# ln -sf ~/dotfiles/nvim/lua/keymaps.lua ~/.config/nvim/lua/keymaps.lua
# ln -sf ~/dotfiles/nvim/lua/options.lua ~/.config/nvim/lua/options.lua
# ln -sf ~/dotfiles/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua

# tmax用の.tmux.confをlinkする
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
