unlet! slip_defaults_vim
"source $VIMRUNTIME/defaults.vim
syntax enable
"vim 8から導入されたデフォルトで設定の読み込み
set encoding=utf-8 "文字コードをUTF-8に設定
set fileencoding=utf-8 
set nobackup "バックアップファイルを作らない
set noswapfile "スワップファイルを作らない
set autoread "編集中のファイルが変更されたら自動で読み直す
set hidden "バッファが編集中でもそのファイルが開けるように
set showcmd "入力中のコマンドをステータス表示にする
"set visualbell "ビープ音を可視化
set showmatch "括弧入力時の対応する括弧を表示
set matchtime=1 "showmatchのカーソルが飛ぶ時間
set laststatus=2 "ステータスラインを常に表示
set wildmode=list:longest "コマンドラインの補完
set expandtab "tab文字を半角スペースにする
set tabstop=2 "行頭以外のTab文字の表示幅(スペース幾つか分)
set shiftwidth=2 "行頭でのTab文字の表示幅
set ambiwidth=double "全角文字を正しく表示するための設定
set mouse=a " ターミナル内のvimでマウススクロールを有効にする

"見た目系
"ColorSchemeをvim-hybridに設定
set background=dark
colorscheme hybrid
set number "行番号を表示
set ruler "カーソル位置表示
set cursorline "現在の行を強調表示
hi clear CursorLine "上と合わせることで行番号のみハイライト
"set cursorcolumn "現在の列を強調表示
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set autoindent "自動インデント
set smartindent "インデントはスマートインデント

"文字・カーソル系
"折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末でのカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする

"検索系
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase "検索文字列に大文字が含まれている場合は区別して検索する
set smartcase "検索文字列入力時に順次対象文字列にヒットさせる
set incsearch "検索時に最後まで行ったら最初に戻る
set wrapscan "検索語をハイライト表示
set hlsearch 
nmap <Esc><Esc> :nohlsearch<Cr><Esc> "検索のハイライト表示をescの2連打で消す
set breakindent


"--------------------------------------------------
"閉じタグを補完入力180126
"---------------------------------------------------
augroup complete
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 端末のvimでも挿入モードで縦棒カーソルを使いたい
" https://qiita.com/Linda_pp/items/9e0c94eb82b18071db34
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
