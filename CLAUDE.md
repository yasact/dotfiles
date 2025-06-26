# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a cross-platform dotfiles repository supporting Linux (including WSL), macOS, and Windows. The repository uses symbolic links to manage configuration files across different tools and environments.

## Key Commands

### Installation
```bash
# Main installation script - creates symbolic links for all configurations
./link.sh

# Windows-specific setup (run in PowerShell as Administrator)
./windows/powerShell/setup.ps1
```

### Shell Configuration Changes
After modifying shell configurations:
```bash
# Reload Zsh configuration
source ~/.zshrc

# Reload Bash configuration
source ~/.bashrc
```

## Architecture and Structure

### Directory Organization
- **shell/** - Shell configurations organized by shell type
  - **bash/** - Bash-specific configs (.bashrc, .profile, .inputrc)
  - **zsh/** - Zsh configs (.zshrc, .zshenv, .zshPrompt, .zshplugins) using Zinit plugin manager
  - **common/** - Shared aliases and git-prompt scripts
- **git/** - Git configuration with custom aliases
- **vim/** - Vim and Neovim configurations
  - **nvim/** - Neovim with Lua-based configuration
- **macos/** - macOS-specific tools (Brewfile, yabai, skhd)
- **windows/** - Windows PowerShell and AutoHotkey scripts
- **tmux/** - Terminal multiplexer configuration
- **utils/** - Utility scripts including OS detection

### OS Detection Pattern
The repository uses `utils/setOsType.sh` to detect the operating system and set appropriate variables:
- Detects macOS, Linux, WSL, and Windows environments
- Shell configurations conditionally load OS-specific settings based on these variables

### Configuration Management
- All configurations are managed through symbolic links created by `link.sh`
- The script creates necessary directories and links configuration files to their expected locations
- OS-specific configurations are handled within the same structure

### Key Integration Points
1. **Zsh Plugin Management**: Uses Zinit for plugin management
2. **Modern CLI Tools**: Integrates with zoxide, lsd, bat, gh
3. **Git Aliases**: Extensive git aliases defined in git/.gitconfig
4. **Vim/Neovim**: Dual support with shared configurations where possible

## Development Notes

### When modifying shell configurations:
- Test changes in both bash and zsh environments
- Ensure OS-specific conditionals are properly handled
- Common aliases should go in shell/common/.aliases

### When adding new tools:
- Add configuration files in appropriate tool-specific directory
- Update link.sh to create symbolic links for new configurations
- Consider OS-specific installation requirements

### Git workflow:
The repository uses custom git aliases:
- `git st` - status
- `git aa` - add all
- `git ac` - add and commit
- `git gr` - graph log view