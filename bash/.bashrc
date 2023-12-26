# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  # Kali linuxのデフォルトが2段になっていてかっこよかったのでそれに変更221116
  PS1='\[\e]0;\u@\h: \w\a\]\[\033[;32m\]┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)\[\033[;32m\])}(\[\033[1;34m\]\u@\h\[\033[;32m\])-[\[\033[0;1m\]\w\[\033[;32m\]]\n\[\033[;32m\]└─\[\033[1;34m\]\$\[\033[0m\]'
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# the looks of prompt
# export PS1="\[\e[36;40m\]\u:\W \\$ \[\e[0m\]"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# PATHの追加-------------------------------------------
export PATH=$HOME/.nodebrew/current/bin:$PATH
# PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# nim用にPATHを追加
export PATH=$HOME/.nimble/bin:$PATH

# autocadCore Console用にPATHを追加
export PATH=/mnt/c/"Program Files"/Autodesk/"AutoCAD 2023":$PATH

# Inventor用にPATHを追加
# Inventor.exe でInventorが起動できるようにするため
export PATH=/mnt/c/Program\ Files/Autodesk/Inventor\ 2023/Bin/:$PATH

# Ctrl + s でターミナルへの出力がロックされるのを解除
stty stop undef

# デフォルトエディターをVimにする
export EDITOR=vim

# macOS用設定------------------
if [ "$(uname)" = 'Darwin' ]; then #OSがmacのとき
  # macのデフォルトシェルをbashにすると、
  # zshを使えというwarningがでてくるのでそれを表示させなくする
  export BASH_SILENCE_DEPRECATION_WARNING=1
  # homebrewをPATHに追加
  export PATH="$PATH:/opt/homebrew/bin"
fi
# ---------------------------------

# NVM(NodePackageManager)用の設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# cargo(Rustのパッケージマネージャー)があったらcargoのパスをシェルに追加
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# fzf(fuzzy finder)の設定
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
