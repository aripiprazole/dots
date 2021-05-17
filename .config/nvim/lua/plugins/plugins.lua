vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- let packer install packer
  use 'wbthomason/packer.nvim'

  -- auto close stuff
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'

  -- colorscheme and
  -- ricing stuff
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'
  use 'norcalli/nvim-base16.lua'
  use 'folke/lsp-colors.nvim'
  
  -- rich presence
  use 'vimsence/vimsence'

  -- language stuff
  use 'neovimhaskell/haskell-vim'
  use 'idris-hackers/idris-vim'
  use 'derekelkins/agda-vim'
  use 'rescript-lang/vim-rescript'

  -- completion stuff
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/vim-vsnip'
  use {
    'tzachar/compe-tabnine',
    run='./install.sh',
    requires='hrsh7th/nvim-compe'
  }
  use 'fleischie/vim-styled-components'

  -- code runner
  use {
    'michaelb/sniprun',
    run='./install.sh'
  }
  use 'puremourning/vimspector'

  -- code actions
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'

  -- format
  use 'google/vim-maktaba'
  use 'google/vim-codefmt'
  use 'google/vim-glaive'

  -- misc
  use 'lukas-reineke/indent-blankline.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'karb94/neoscroll.nvim'
  use 'wakatime/vim-wakatime'
  use 'preservim/nerdcommenter'
  use 'chaoren/vim-wordmotion'
  use 'abdalrahman-ali/vim-remembers'

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
