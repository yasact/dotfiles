#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.profile ~/.profile

mkdir -p ~/.vim
ln -sf ~/dotfiles/colors ~/.vim/colors
