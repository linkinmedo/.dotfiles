local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- use 'neovim/nvim-lspconfig'
  use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}

  -- Keep it since it's required by many things
  use 'nvim-lua/plenary.nvim'

  use 'jose-elias-alvarez/null-ls.nvim'

  -- use 'williamboman/nvim-lsp-installer'

  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  -- use 'hrsh7th/nvim-cmp'

  -- use 'L3MON4D3/LuaSnip'
  -- use 'saadparwaiz1/cmp_luasnip'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'norcalli/nvim-colorizer.lua'

  use { 'dracula/vim', as = 'dracula' }

  use 'kyazdani42/nvim-web-devicons'

  use 'hoob3rt/lualine.nvim'

  use 'kyazdani42/nvim-tree.lua'

  use 'lukas-reineke/indent-blankline.nvim'

  use 'windwp/nvim-ts-autotag'

  use 'windwp/nvim-autopairs'

  use 'wakatime/vim-wakatime'

  use 'b3nj5m1n/kommentary'

  use 'tpope/vim-surround'

  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/popup.nvim'
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true
      })
    end
  }

  use { 'akinsho/flutter-tools.nvim' }

  use 'sindrets/diffview.nvim'

end)
