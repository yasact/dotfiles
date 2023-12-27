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

# デフォルトエディターをneoVimにする
export EDITOR=nvim

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
