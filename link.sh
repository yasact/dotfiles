#!/bin/sh
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/bash/.profile ~/.profile
ln -sf ~/dotfiles/bash/.inputrc ~/.inputrc
ln -sf ~/dotfiles/bash/.bash_aliases ~/.bash_aliases

mkdir -p ~/.vim
ln -sf ~/dotfiles/colors ~/.vim/colors

# nvim用のinit.vimをlinkする
ln -sf ~/dotfiles/vim/nvim/init.vim ~/.config/nvim/init.vim

# mkdir -p ~/.config/nvim/lua
# ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
# ln -sf ~/dotfiles/nvim/lua/base.lua ~/.config/nvim/lua/base.lua
# ln -sf ~/dotfiles/nvim/lua/keymaps.lua ~/.config/nvim/lua/keymaps.lua
# ln -sf ~/dotfiles/nvim/lua/options.lua ~/.config/nvim/lua/options.lua
# ln -sf ~/dotfiles/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua
