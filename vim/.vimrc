unlet! slip_defaults_vim
"source $VIMRUNTIME/defaults.vim
syntax enable

let mapleader=" "

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
set tabstop=4 "行頭以外のTab文字の表示幅(スペース幾つか分)
set shiftwidth=4 "行頭でのTab文字の表示幅
set ambiwidth=double "全角文字を正しく表示するための設定
set mouse=a " ターミナル内のvimでマウススクロールを有効にする

"見た目系
"ColorSchemeをvim-hybridに設定
"set background=dark
"colorscheme hybrid
set number "行番号を表示
set relativenumber "行番号を相対番号で表示
set ruler "カーソル位置表示
" set cursorline "現在の行を強調表示
" hi clear CursorLine "上と合わせることで行番号のみハイライト
"set cursorcolumn "現在の列を強調表示
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set autoindent "自動インデント
set smartindent "インデントはスマートインデント

"文字・カーソル系
"折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 行頭と行末をHLで移動できるようにする
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

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

" 231221
au BufRead,BufNewFile *.md set filetype=markdown

" 231222
" Ctrl+BでNERDTreeを開く
"nnoremap <C-b> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

"新しいウインドウを現在のウインドウの下に開く
set splitbelow
"新しいウインドウを現在のウインドウの右に開く
set splitright

" Status Line Settings
set statusline=%F " Show file name
set statusline+=%m " Show modification
set statusline+=%r " Show if readonly
set statusline+=%h " Show if help
set statusline+=%w " Show if preview
set statusline+=:%l " Show line number
set statusline+=%= " align right after this
set statusline+=\ %Y[%{&fileencoding}] " file encoding

" Colors
" 22: dark green
" 191: yellow
" StatusLine: bottom line
hi clear TabLine

hi MatchParen ctermbg=4
hi NonText term=NONE cterm=NONE ctermfg=22 ctermbg=NONE
"hi Pmenu ctermbg=191
"hi PmenuSel ctermbg=124
"hi Comment ctermfg=191 " コメントの色
hi Search cterm=NONE ctermfg=black ctermbg=191
"hi SpecialKey ctermfg=23 ctermbg=NONE
hi StatusLine cterm=NONE gui=NONE ctermfg=white ctermbg=22
hi TabLine ctermfg=230 ctermbg=22
hi TabLineFill ctermfg=22 ctermbg=22
hi TabLineSel ctermfg=230 ctermbg=166
hi VertSplit term=NONE cterm=NONE ctermfg=22 ctermbg=NONE
hi Visual cterm=NONE ctermfg=black ctermbg=191
"hi SpecialKey ctermfg=23
"hi SignColumn ctermbg=NONE
"
"gt, grでウィンドウを動けるようにしたい
nnoremap gt <c-w><c-w>
nnoremap gr <c-w>W

"新しい垂直分割ウインドウでファイルを開く
nnoremap <leader>e :vnew | :e

" ctrl+vで矩形ビジュアルモードに入りたいが、
" windows powerShellからvimに入っていると、ペーストされてしまうので
" とりあえずc-qで矩形ビジュアルモードに入るようにする。
nnoremap <c-q> <c-v>

"ctrl+sで保存
nnoremap <c-s> :w<CR>

"OSTypeを設定する
if has('win32') || has('win64')
    let g:osType = "win"
elseif has('macunix')
    let g:osType='mac'
else
    let g:osType="linux"
endif


"terminalをトグルする関数
function! ToggleTerminal()
    if exists('t:terminal_window_id')
        if bufwinnr(t:terminal_window_id) != -1
            exec bufwinnr(t:terminal_window_id) . 'wincmd c'
            unlet t:terminal_window_id
            return
        endif
    endif
    if g:osType=="win" 
        belowright split | terminal "C:\Program Files\PowerShell\7\pwsh.exe"
    elseif g:osType=="mac"
        belowright split | terminal
    elseif g:osType=="linux"
        belowright split | terminal
    endif
    let t:terminal_window_id = bufnr('')
endfunction

" ctrl+tでterminalをtoggleする
nnoremap <C-t> :call ToggleTerminal()<CR>

" vim-markdown用設定
" .mdを開いたときにunfoldedの状態で開く
let g:vim_markdown_folding_disabled = 1


" <leader> + h,j,k,lでウインドウ移動
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

"jしたいときに、shift+Jを誤爆することがよくあるのでJを無効
nnoremap J j


" osがwindowsだったら、yankしたものをwindowsのclipboardに送る
if g:osType=="win"
    set clipboard^=unnamed
    augroup Yank
        autocmd!
        autocmd TextYankPost * if v:event.operator == 'y' | call system('clip.exe', @@) | endif
    augroup END
endif

"vim-commentary用のキーバインディングを変更する
"Ctrl + / でworkするのに<C-_>と書かなければいけないのはなぜ？
"ターミナルの入力処理: 多くのターミナルエミュレータは、古いASCII制御コードの仕組みに基づいてキー入力を処理します。Ctrl + / は ASCII コードで 0x1F に対応しますが、これは同じコードを持つ Ctrl + _（アンダースコア）に等しいです。したがって、ターミナルはこれらのキー入力を区別せず、同じコードとして扱います。
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

set clipboard+=unnamedplus
