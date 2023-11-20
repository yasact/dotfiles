
vim.g.mapleader = ' ' -- leaderをspaceにする
vim.api.nvim_set_keymap('n','j','gj',{noremap= true,silent=true})
vim.api.nvim_set_keymap('v','j','gj',{noremap= true,silent=true})
vim.api.nvim_set_keymap('n','k','gk',{noremap= true,silent=true})
vim.api.nvim_set_keymap('v','k','gk',{noremap= true,silent=true})

vim.api.nvim_set_keymap('n','L','$',{noremap= true,silent=true})
vim.api.nvim_set_keymap('v','L','$',{noremap= true,silent=true})
vim.api.nvim_set_keymap('n','H','0',{noremap= true,silent=true})
vim.api.nvim_set_keymap('v','H','0',{noremap= true,silent=true})

vim.api.nvim_set_keymap('n','J','gj',{noremap= true,silent=true})
vim.api.nvim_set_keymap('v','J','gj',{noremap= true,silent=true})

vim.api.nvim_set_keymap('n','K','gk',{noremap= true,silent=true})
vim.api.nvim_set_keymap('v','K','gK',{noremap= true,silent=true})


-- hop(easymotion alternative)
require'hop'.setup()

-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})

-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})


