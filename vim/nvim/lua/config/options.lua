-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- ファイルエンコーディング設定
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- バックアップ・スワップファイル設定
opt.backup = false
opt.swapfile = false

-- ファイル編集設定
opt.autoread = true
opt.hidden = true

-- コマンドライン設定
opt.showcmd = true
opt.wildmode = "list:longest"

-- 括弧のマッチング表示
opt.showmatch = true
opt.matchtime = 1

-- ステータスライン
opt.laststatus = 2

-- タブ・インデント設定
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

-- 全角文字の表示
opt.ambiwidth = "double"

-- マウスサポート
opt.mouse = "a"

-- 見た目系
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.virtualedit = "onemore"

-- カーソル移動設定
opt.whichwrap = "b,s,h,l,<,>,[,],~"
opt.backspace = "indent,eol,start"

-- 検索設定
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = true
opt.hlsearch = true
opt.breakindent = true

-- ウィンドウ分割設定
opt.splitbelow = true
opt.splitright = true
