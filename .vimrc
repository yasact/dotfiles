".vimrc by yas 171129-------------------------
"180126 dein.vim用に追記
"---------------------------------------------
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
set visualbell "ビープ音を可視化
set showmatch "括弧入力時の対応する括弧を表示
" set matchtime=1 "showmatchのカーソルが飛ぶ時間
set laststatus=2 "ステータスラインを常に表示
set wildmode=list:longest "コマンドラインの補完
set expandtab "tab文字を半角スペースにする
set tabstop=2 "行頭以外のTab文字の表示幅(スペース幾つか分)
set shiftwidth=2 "行頭でのTab文字の表示幅

"見た目系
"ColorSchemeをvim-hybridに設定
set background=dark
colorscheme hybrid
set number "行番号を表示
set ruler "カーソル位置表示
"set cursorline "現在の行を強調表示
"hi clear CursorLine "上と合わせることで行番号のみハイライト
"set cursorcolumn "現在の行を強調表示
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set autoindent "自動インデント
set smartindent "インデントはスマートインデント
set visualbell "ビープ音を可視化
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
set hlsearch "検索のハイライト表示をescの2連打で消す
nmap <Esc><Esc> :nohlsearch<Cr><Esc>
set breakindent

filetype plugin indent on

"--------------------------------------------------
"閉じタグを補完入力180126
"---------------------------------------------------
augroup complete
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

""----------------------------------------------------------------------------
"""dein.vimインストール用に追記180713
"""dein Scripts-----------------------------
"if &compatible
" set nocompatible
"endif
"" Add the dein installation directory into runtimepath
"set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
"
"if dein#load_state('~/.cache/dein')
" call dein#begin('~/.cache/dein')
"
" call dein#add('~/.cache/dein')
" call dein#add('Shougo/deoplete.nvim')
"
"
" if !has('nvim')
"   call dein#add('roxma/nvim-yarp')
"   call dein#add('roxma/vim-hug-neovim-rpc')
" endif
"
" call dein#end()
" call dein#save_state()
"endif
"
"filetype plugin indent on
"syntax enable
""-----------------------------------------------------


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
  endif

  let g:neocomplete#enable_at_startup =1
  let g:neosnippet#snippets_directory='/home/yas/.vim/snippets/'
 
