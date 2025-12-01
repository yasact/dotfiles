-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Leader key の設定（LazyVimはデフォルトでspaceだけど明示的に設定）
vim.g.mapleader = " "

-- 折り返し時に表示行単位で移動
map("n", "j", "gj", { noremap = true, silent = true })
map("n", "k", "gk", { noremap = true, silent = true })

-- 行頭・行末への移動（H と L）
map("n", "H", "0", { noremap = true, silent = true })
map("n", "L", "$", { noremap = true, silent = true })
map("v", "H", "0", { noremap = true, silent = true })
map("v", "L", "$", { noremap = true, silent = true })

-- 検索ハイライトを Esc 2連打で消す
map("n", "<Esc><Esc>", ":nohlsearch<CR><Esc>", { noremap = true, silent = true })

-- ウィンドウ間の移動（gt と gr）
map("n", "gt", "<C-w><C-w>", { noremap = true, silent = true })
map("n", "gr", "<C-w>W", { noremap = true, silent = true })

-- Ctrl+S で保存
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- J の誤爆防止（J → j に）
map("n", "J", "j", { noremap = true, silent = true })
map("v", "J", "j", { noremap = true, silent = true })
