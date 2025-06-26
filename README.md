# Minimal Dotfiles

シンプルで最小限のdotfiles設定。

## セットアップ

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./link.sh
```

## マシン固有の設定

各マシンで異なる設定（NVM、pyenvなど）は `~/.zshrc.local` に記載してください。

### WSL/Linux の例
```bash
# ~/.zshrc.local
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
```

### macOS の例
```bash
# ~/.zshrc.local
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## 含まれる設定

- **zsh**: 基本的なalias、プロンプト、補完設定
- **git**: 最小限のalias設定
- **vim**: 緊急時用の基本設定
- **tmux**: ターミナルマルチプレクサ設定