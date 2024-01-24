# osを判別する
# macの場合
if [[ "$OSTYPE" == "darwin"* ]]; then
    ostype="mac"
# WSLの場合
elif grep -qi microsoft /proc/version; then
    ostype='wsl'
# それ以外の場合
else 
    ostype="linux"
fi

# echo "ostype=$ostype"


# .zshPromptを読み込む
#
if [ -f ~/dotfiles/shell/zsh/.zshPrompt ]; then
    . ~/dotfiles/shell/zsh/.zshPrompt
fi

# .git-completion.zshを読み込む
if [ -f ~/dotfiles/shell/common/.git-completion.zsh ]; then
    . ~/dotfiles/shell/common/.git-completion.zsh
fi


setopt histignorealldups sharehistory

# use emacs keybindings even if our EDITOR is set to vi
# bindkey -v

# keep 1000 lines of history within the shell and save it to ~/.zsh_history:
histsize=1000
savehist=1000
histfile=~/.zsh_history


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

# macだとgdircolorsになってる
if [[ $ostype == "mac" ]]; then
    eval "$(gdircolors -b)"
else
    eval "$(dircolors -b)"
fi

zstyle ':completion:*:default' list-colors ${(s.:.)ls_colors}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %sat %p: hit tab for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={a-z}' 'm:{a-za-z}={a-za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %sscrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $user -o pid,%cpu,tty,cputime,cmd'

# 自動補完を有効にする
# autoload -u compinit: compinit
autoload -Uz compinit
compinit -i

# コマンドの打ち間違いがあったら修正案を提示する
setopt correct

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリにcdする
setopt auto_cd

# cdした先のディレクトリをディレクトリスタックに追加する
setopt auto_pushd

# pushdしたとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古い方のコマンドを削除する
setopt hist_ignore_all_dups

# .aliasesがあったら読み込む
if [ -e ~/.aliases ]; then
  source ~/.aliases
fi

# disable beep
setopt no_beep 

# disable beep sound after completion
setopt nolistbeep

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk


if [ -f ~/dotfiles/shell/zsh/.zshplugins ]; then
    . ~/dotfiles/shell/zsh/.zshplugins
fi


# Debian用の変換キーの設定
if [[ $ostype == "linux" ]]; then
    xmodmap -e "keycode 131 = Muhenkan"
    xmodmap -e "keycode 130= Henkan_Mode"
else
fi

# eval "$(jump shell)"
# eval "$(jump shell --bind=z)"

# 231229 zsh-vi-modeを入れたら不要かもしれない
# zsh-vi-modeはよくわからないので一回コメントアウトした(at .zshPlugins)
# のでこのsnippetを復活240104
# 現在のモードがわからない問題(insなのかcmdなのか)対応
# for vi mode
 function zle-keymap-select {
     if [[ $KEYMAP = vicmd ]] || [[ $1 = block ]]; then
         echo -ne "\e[2 q" # コマンドモードでブロックカーソル
     else
         echo -ne "\e[6 q" # インサートモードでiビームカーソル
     fi
 }
 
 zle -N zle-keymap-select
 zle-keymap-select # 初期状態のカーソル形状を設定
 
 # ターミナルを終了するときにカーソルを通常状態に戻す
 function zshext {
     echo -ne "\e[1 q" # カーソルを通常状態に戻す
 }
 
 # insert modeでbackspaceが効かない問題対応
 bindkey "^?" backward-delete-char
 bindkey "^H" backward-delete-char
 


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zoxideを初期化
# zoxideの実行ファイルがあるかどうか確認する
# zoxideのpathを格納する
zoxide_path=""
if [[ $ostype = "mac" ]]; then
    zoxide_path="/opt/homebrew/bin/zoxide"
elif [[ $ostype =  "wsl" ]]; then
    zoxide_path="/usr/sbin/zoxide"
elif [[ $ostype = "linux" ]]; then
    zoxide_path="/usr/sbin/zoxide"
fi

# zoxideがinstallされていたらzoxideを初期化する
if [[ -e $zoxide_path ]]; then
    echo "zoxide is available"
    eval "$(zoxide init zsh)"
fi

# echo ".zshrc is loaded"
