#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.inputrc ~/.inputrc

mkdir -p ~/.vim
ln -sf ~/dotfiles/colors ~/.vim/colors
