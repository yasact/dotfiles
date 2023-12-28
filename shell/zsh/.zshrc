# osを判別する
# macの場合
if [[ "$ostype" == "darwin"* ]]; then
    ostype="mac"
# それ以外の場合
else 
    ostype="linux"
fi


# set up the prompt
autoload -uz promptinit
promptinit
# prompt adam1

prompt='%f{green}┌(%f%f{magenta}%n%f%f{green})-[%f%f{blue}%u%~%u%f%f{green}]
└%#%f '
rprompt='%k{magenta}%f{cyan}[%d %t]%f%k'

setopt histignorealldups sharehistory

# use emacs keybindings even if our editor is set to vi
bindkey -v

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
autoload -uz compinit
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

# .zsh_aliasesがあったら読み込む
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# disable beep
setopt no_beep 

# disable beep sound after completion
setopt nolistbeep


### added by zinit's installer
if [[ ! -f $home/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -p "%f{33} %f{220}installing %f{33}zdharma-continuum%f{220} initiative plugin manager (%f{33}zdharma-continuum/zinit%f{220})…%f"
    command mkdir -p "$home/.local/share/zinit" && command chmod g-rwx "$home/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$home/.local/share/zinit/zinit.git" && \
        print -p "%f{33} %f{34}installation successful.%f%b" || \
        print -p "%f{160} the clone has failed.%f%b"
fi

source "$home/.local/share/zinit/zinit.git/zinit.zsh"
autoload -uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load a few important annexes, without turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### end of zinit's installer chunk


if [ -f ~/dotfiles/shell/zsh/.zshplugins ]; then
    . ~/dotfiles/shell/zsh/.zshplugins
fi


# eval "$(jump shell)"
# eval "$(jump shell --bind=z)"


# 現在のモードがわからない問題(insなのかcmdなのか)対応
# for vi mode
function zle-keymap-select {
    if [[ $keymap = vicmd ]] || [[ $1 = block ]]; then
        echo -ne "\e[2 q" # コマンドモードでブロックカーソル
    else
        echo -ne "\e[6 q" # インサートモードでiビームカーソル
    fi
}

zle -n zle-keymap-select
zle-keymap-select # 初期状態のカーソル形状を設定

# ターミナルを終了するときにカーソルを通常状態に戻す
function zshext {
    echo -ne "\e[1 q" # カーソルを通常状態に戻す
}

# insert modeでbackspaceが効かない問題対応
bindkey "^?" backward-delete-char
bindkey "^h" backward-delete-char


