#!/bin/bash

# Minimal dotfiles setup script

echo "Setting up minimal dotfiles..."

# zsh
ln -sf ~/dotfiles/shell/zsh/.zshrc ~/.zshrc
echo "✓ .zshrc linked"

# git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
echo "✓ .gitconfig linked"

# vim
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
echo "✓ .vimrc linked"

# tmux
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
echo "✓ .tmux.conf linked"

echo "Setup complete!"
echo "Please restart your terminal or run: source ~/.zshrc"