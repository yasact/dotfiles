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

# nvim (LazyVim config files)
mkdir -p ~/.config/nvim/lua/config
ln -sf ~/dotfiles/vim/nvim/lua/config/options.lua ~/.config/nvim/lua/config/options.lua
ln -sf ~/dotfiles/vim/nvim/lua/config/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua
echo "✓ nvim config files linked"

echo "Setup complete!"
echo "Please restart your terminal or run: source ~/.zshrc"
