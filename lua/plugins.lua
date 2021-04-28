vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- auto close stuff
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'

  -- colorscheme and
  -- ricing stuff
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'
  use 'norcalli/nvim-base16.lua'
  use 'folke/lsp-colors.nvim'

  -- lsp stuff
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/vim-vsnip'

  -- code actions
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'

  -- misc
  use 'lukas-reineke/indent-blankline.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'karb94/neoscroll.nvim'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- statusline
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- finder
  use 'nvim-telescope/telescope-media-files.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- symbol map
  use 'simrat39/symbols-outline.nvim'

  -- tab organizer
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- diagnostic displayer
  use {
    'folke/lsp-trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end)