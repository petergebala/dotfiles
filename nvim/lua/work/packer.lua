---@diagnostic disable: param-type-mismatch
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Supermaven
  use {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x', -- or , branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' }
    }
  }

  -- Spectre
  use {
    'nvim-pack/nvim-spectre',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    }
  }

  -- Color scheme
  use { 'ellisonleao/gruvbox.nvim' }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- LSP zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'hrsh7th/cmp-path' },     -- Optional
      { 'hrsh7th/cmp-buffer' },   -- Optional
    }
  }

  -- Nvim tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- Nvim Surround
  use({
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
  })

  -- Trouble
  use({ 'folke/trouble.nvim' })

  -- Fugitive
  use('tpope/vim-fugitive')

  -- Vim Rails
  use('tpope/vim-rails')

  -- Lua Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Comment
  use { 'numToStr/Comment.nvim' }

  -- Bufferline
  use { 'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons' }

  -- Indent lines
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- AutoPairs
  use { 'windwp/nvim-autopairs' }

  -- GitSigns
  use { 'lewis6991/gitsigns.nvim' }
end)
