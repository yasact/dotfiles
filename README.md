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
- **karabiner** (macOS): Karabiner-Elements 設定。`~/.config/karabiner` をディレクトリごと symlink

## Codex

`codex/config.toml` を `~/.codex/config.toml` からシンボリックリンクで参照する。
`./link.sh` は既存の通常ファイルをバックアップしてからリンクを作成する。

現在の設定をそのまま管理しているため、Mac 固有の絶対パス・MCP 設定・プロジェクト信頼設定も含む。
別マシンでは内容を確認してから適用する。Codex が保存する設定変更もこのファイルに反映される。
`auth.json`、セッション履歴、キャッシュなどは管理対象に含めない。API キーやトークンをこの TOML に直接追加しない。

## Grok

`grok/config.toml` を `~/.grok/config.toml` からシンボリックリンクで参照する。
`./link.sh` は既存の通常ファイルをバックアップしてからリンクを作成する。

UI・モデル・marketplace の設定をこのファイルで管理する。Grok が `/settings` から保存した変更も、リンクが切れていなければこのファイルに書き戻る。
`auth.json`、セッション履歴、`trusted_folders.toml`、キャッシュ、memory は管理対象に含めない。API キーやトークンをこの TOML に直接追加しない。
