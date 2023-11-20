vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manege itself
    use 'wbthomason/packer.nvim'
    --
    -- この下にインストールするプラグインを記載する
    use 'folke/tokyonight.nvim' -- tokyonight

    -- hop.nvim
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require'hop'.setup()
    end
  }

  -- nvim-treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)
