#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.inputrc ~/.inputrc

mkdir -p ~/.vim
ln -sf ~/dotfiles/colors ~/.vim/colors

mkdir -p ~/.config/nvim/lua
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/nvim/lua/base.lua ~/.config/nvim/lua/base.lua
ln -sf ~/dotfiles/nvim/lua/keymaps.lua ~/.config/nvim/lua/keymaps.lua
ln -sf ~/dotfiles/nvim/lua/options.lua ~/.config/nvim/lua/options.lua
ln -sf ~/dotfiles/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua

