" Neovim から既存の vimrc を読む
if filereadable(expand("~/.vimrc"))
  source ~/.vimrc
endif

" 念のため Neovim 側でも有効化
syntax on
filetype plugin indent on

colorscheme desert
" 必要なら
set termguicolors
set background=dark

" カレントディレクトリのエクスプローラを開く（netrw）
nnoremap <leader>e :Ex<CR>

