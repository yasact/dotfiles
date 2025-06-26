# Minimal .zshrc - シンプルで必要最小限の設定

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups  # 重複を記録しない
setopt share_history     # 履歴を共有

# Basic completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別しない

# Simple prompt
PROMPT='%F{blue}%~%f %# '

# Basic aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias grep='grep --color=auto'

# Git aliases (基本的なもののみ)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline -10'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Editor
export EDITOR=vim

# Path (必要に応じて追加)
# export PATH=$HOME/.local/bin:$PATH

# OS specific settings
case "$OSTYPE" in
  darwin*)
    # macOS specific
    export PATH="/opt/homebrew/bin:$PATH"
    ;;
  linux*)
    # Linux/WSL specific
    ;;
esac

# マシン固有の設定 (gitで管理しない)
# 例: NVM、pyenv、特殊なPATH設定など
# ~/.zshrc.local に以下のような内容を記載:
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -f ~/.zshrc.local ] && source ~/.zshrc.local