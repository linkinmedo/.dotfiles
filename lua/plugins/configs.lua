local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  -- Keep it since it's required by many things
  use 'nvim-lua/plenary.nvim'

  use 'jose-elias-alvarez/null-ls.nvim'

  use 'williamboman/nvim-lsp-installer'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'norcalli/nvim-colorizer.lua'

  use {'dracula/vim', as = 'dracula'}

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
      require('gitsigns').setup()
    end
  }

  use {'akinsho/flutter-tools.nvim'}

  use 'hrsh7th/nvim-compe'

  use 'sindrets/diffview.nvim'

end)
