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

# Git情報を取得する関数
git_prompt_info() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        local git_status=""
        # 変更がある場合は*を表示
        if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
            git_status="*"
        fi
        echo " %F{green}($branch$git_status)%f"
    fi
}

# プロンプトの設定
setopt prompt_subst  # プロンプト内で変数展開を有効に
PROMPT='%F{blue}%~%f$(git_prompt_info) %# '

# Basic aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto '
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

# tmux
alias tm='tmux'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Editor
export EDITOR=vim

bindkey -e

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
[ -f ~/.zshrc.local ] && source ~/.zshrc.local [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



alias claude="/home/ysn/.claude/local/claude"
