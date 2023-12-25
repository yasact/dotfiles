# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh --color=auto'
alias la='ls -A'
alias l='ls -CF'

# cdしたあと自動でls
cdls() {
    \cd "$@" && ll
}
alias cd="cdls"

# OCamlのエイリアスを設定
# OCamlでカーソル移動ができるようにrlwrap経由で起動する
alias ocaml='rlwrap ocaml'

# docker-compose用のエイリアスを設定
alias fig='docker-compose'

# VScode-insidersをcodeで起動できるように設定
alias code='code-insiders'

# lsを色付きにする
if [ "$(uname)" = 'Darwin' ]; then #OSがmacのとき
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ll='ls -alFG'
else #OSがDebian系のとき
    # ここで~/.colorrcがない。と言われている。
    eval 'dircolors ~/dotfiles/dircolors/dircolors.ansi-universal' >/dev/null
    alias ll='ls -alF  --color=auto'
fi
