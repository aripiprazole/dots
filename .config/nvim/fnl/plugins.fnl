(local nvim (require :aniseed.nvim))
(local core (require :aniseed.core))
(local packer (require :packer))

(fn use [...]
  "Iterate the arguments as pairs and call packer's use function for each pair."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (core.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (use (core.assoc opts 1 name)))))))
  nil)

(use
  :wbthomason/packer.nvim {}

  ;; APIs and Utils
  :RishabhRD/popfix {}
  :nvim-lua/plenary.nvim {}
  :nvim-lua/popup.nvim {}
  :google/vim-maktaba {}
  :google/vim-glaive {}

  ;; UI, icons, colors, ricing stuf
  :glepnir/dashboard-nvim {}
  :kyazdani42/nvim-web-devicons {}
  :simrat39/symbols-outline.nvim {}
  :folke/lsp-colors.nvim {}
  :folke/lsp-trouble.nvim {}
  :folke/which-key.nvim {}
  :ray-x/lsp_signature.nvim {}
  :nvim-telescope/telescope.nvim {}
  :nvim-telescope/telescope-fzf-native.nvim {}
  :nvim-telescope/telescope-media-files.nvim {}
  :nvim-telescope/telescope-ui-select.nvim {}
  :nvim-telescope/telescope-dap.nvim {}
  :gbrlsnchs/telescope-lsp-handlers.nvim {}
  :hood/popui.nvim {}
  :andymass/vim-matchup {}
  :norcalli/nvim-colorizer.lua {}
  :famiu/feline.nvim {}
  :glepnir/lspsaga.nvim {}
  
  ;; Rust
  :saecki/crates.nvim {}
  :simrat39/rust-tools.nvim {}

  ;; Auto complete
  :nvim-treesitter/nvim-treesitter {}

  ;; Editor
  :luochen1990/rainbow {}
  :lukas-reineke/indent-blankline.nvim {}
  :numToStr/Comment.nvim {}
  :jiangmiao/auto-pairs {}
  :tpope/vim-surround {}

  ;; Themes
  :hachy/eva01.vim {}
  :arzg/vim-colors-xcode {}
  :eemed/sitruuna.vim {}
  :marko-cerovac/material.nvim {}
  :joshdick/onedark.vim {}
  :ghifarit53/tokyonight-vim {}
  :lifepillar/vim-gruvbox8 {}
  :haishanh/night-owl.vim {}
  :doums/darcula {}
  :liuchengxu/space-vim-dark {}
  :ackyshake/spacegray.vim {}
  :embark-theme/vim {}
  :creaturephil/vim-handmade-hero {}
  :lifepillar/vim-solarized8 {}
  :gugsrs/vim-moonlight2 {}
  :sainnhe/sonokai {}
  :sainnhe/gruvbox-material {}
  :tomasiser/vim-code-dark {}

  ;; Language and framework support
  :neovimhaskell/haskell-vim {}
  :idris-hackers/idris-vim {}
  :derekelkins/agda-vim {}
  :rescript-lang/vim-rescript {}
  :jordwalke/vim-reasonml {}
  :rhysd/vim-llvm {}
  :Nymphium/vim-koka {}
  :jaawerth/fennel-nvim {}
  :Olical/conjure {}
  :Olical/aniseed {}
  :fleischie/vim-styled-components {}

  ;; LSP stuff
  :neovim/nvim-lspconfig {}
  :hrsh7th/nvim-compe {}
  :onsails/lspkind-nvim {}
  :hrsh7th/vim-vsnip {}
  :hrsh7th/vim-vsnip-integ {}

  ;; Code runner
  :michaelb/sniprun {}
  :mfussenegger/nvim-dap {}
  :rcarriga/nvim-dap-ui {}
  :theHamsta/nvim-dap-virtual-text {}

  ;; Code actions and formatting
  :RishabhRD/nvim-lsputils {}
  :google/vim-codefmt {}

  ;; GIT
  :lewis6991/gitsigns.nvim {}

  ;; Misc
  :kyazdani42/nvim-tree.lua {}
  :karb94/neoscroll.nvim {}
  :wakatime/vim-wakatime {}
  :chaoren/vim-wordmotion {}
  :akinsho/nvim-toggleterm.lua {}

  ;; Statusline 
  :vim-airline/vim-airline {}
  :vim-airline/vim-airline-themes {}
  :akinsho/nvim-bufferline.lua {})
