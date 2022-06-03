vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- * packer
  use 'wbthomason/packer.nvim'
  -- ? theme - onedark
  use 'navarasu/onedark.nvim'
  -- ? bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- ? lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- ? completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- ? syntax - treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- ? tree - nvim-tree.lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }
  
  -- ? lsp
  use 'neovim/nvim-lspconfig'
  
  -- * IDE
  -- ? snippets
  use 'L3MON4D3/LuaSnip'
  -- ? dashboard
  use 'glepnir/dashboard-nvim'
  -- ? blankline
  use 'lukas-reineke/indent-blankline.nvim'
  -- ? comment
  use 'terrortylor/nvim-comment'
  use 'jbgutierrez/vim-better-comments'
  -- ? autopairs
  use 'windwp/nvim-autopairs'
  -- ? git
  use 'airblade/vim-gitgutter'
  -- ? fugitive
  use 'tpope/vim-fugitive'
  -- ? easy motion
  use 'easymotion/vim-easymotion'
  -- ? telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/plenary.nvim' }}
  }
end)
