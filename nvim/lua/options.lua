-- ファイル

vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.helplang = "ja"
vim.opt.hidden = true


--　カーソルと表示
vim.opt.cursorline = true --カーソルがある行を強調
vim.wo.relativenumber = true --相対表示
vim.opt.virtualedit="onemore"

-- vim.opt.cursorcolumn = true --カーソルがある列を強調

-- クリップボード教諭
vim.opt.clipboard:append({"unnamedplus"})


-- メニューとコマンド
vim.opt.wildmenu = true -- コマンドラインで補完
vim.opt.cmdheight = 1 --コマンドラインの表示行数
vim.opt.laststatus = 2 --下部にステータスラインを表示
vim.opt.showcmd = true --コマンドラインに入力されたコマンドを表示

-- 検索・置換
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.matchtime =1
vim.opt.wrapscan = true
vim.opt.ignorecase =true --検索文字列が小文字の場合はignorecaseする

-- カラースキーム
vim.opt.termguicolors = true
vim.opt.background = "dark"


-- インデント
vim.opt.shiftwidth = 4 --シフト幅を4にする
vim.opt.tabstop = 4 -- タブ幅を4にする
vim.opt.expandtab = true -- タブ文字をスペースに置き換える
vim.opt.autoindent = true -- 自動インデントを有効にする
vim.opt.smartindent = true 

-- 表示
vim.opt.number = true --行番号を表示
vim.opt.ruler = true -- カーソル位置表示
vim.opt.wrap = false --テキストの自動折返しを無効にする
vim.opt.showtabline= 1 -- タブラインを表示
vim.opt.visualbell = true
vim.opt.showmatch = true --対応する括弧をハイライト表示
vim.opt.ambiwidth= "double" --全角文字を正しく表示する

--インターフェース
vim.opt.winblend = 20 --ウィンドウの不透明度
vim.opt.pumblend = 10 --ポップアップメニューの不透明度
vim.opt.showtabline = 2 -- タブラインを表示する設定
vim.opt.signcolumn = "yes" --サインカラムを表示

