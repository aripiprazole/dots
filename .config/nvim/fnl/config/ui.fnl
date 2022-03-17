(local nvim (require :aniseed.nvim))

(local lsp-colors (require :lsp-colors))
(local lsp-trouble (require :trouble))
(local telescope (require :telescope))
(local themes (require :telescope/themes))
(local symbols-outline (require :symbols-outline))
(local lspkind (require :lspkind))
(local gitsigns (require :gitsigns))

(local g nvim.g)
(local o nvim.o)
(local wo nvim.wo)

;; Set theme TODO: move to config
(vim.cmd "set background=dark")
(vim.cmd "colorscheme tokyonight")

;; Enable syntax highlight
(vim.cmd "syntax enable")
(vim.cmd "syntax on")

(vim.cmd "set nuw=5")
(vim.cmd "set cursorline")
(vim.cmd "set signcolumn=yes")

(vim.cmd "set fillchars=fold:\\ ,vert:\\▕,eob:\\ ,msgsep:‾")
(vim.cmd "highlight clear SignColumn")
(vim.cmd "au ColorScheme * highlight clear SignColumn")

;; Leader key
(set g.mapleader " ") ; <Space> key

(set g.auto_save 0)

(set g.rainbow_active 1) ;; Enable rainbow brackets

;; Setup dashboard extension
(set g.dashboard_default_executive "telescope")
(set g.dashboard_custom_header [
  "    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠖⠚⢉⣩⣭⡭⠛⠓⠲⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀  "
  "    ⠀⠀⠀⠀⠀⠀⢀⡴⠋⠁⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢦⡀⠀⠀⠀⠀  "
  "    ⠀⠀⠀⠀⢀⡴⠃⢀⡴⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀  "
  "    ⠀⠀⠀⠀⡾⠁⣠⠋⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀  "
  "    ⠀⠀⠀⣸⠁⢰⠃⠀⠀⠀⠈⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀  "
  "    ⠀⠀⠀⡇⠀⡾⡀⠀⠀⠀⠀⣀⣹⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀  "
  "    ⠀⠀⢸⠃⢀⣇⡈⠀⠀⠀⠀⠀⠀⢀⡑⢄⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  "
  "    ⠀⠀⢸⠀⢻⡟⡻⢶⡆⠀⠀⠀⠀⡼⠟⡳⢿⣦⡑⢄⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  "
  "    ⠀⠀⣸⠀⢸⠃⡇⢀⠇⠀⠀⠀⠀⠀⡼⠀⠀⠈⣿⡗⠂⠀⠀⠀⠀⠀⠀⠀⢸⠁  "
  "    ⠀⠀⡏⠀⣼⠀⢳⠊⠀⠀⠀⠀⠀⠀⠱⣀⣀⠔⣸⠁⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀  "
  "    ⠀⠀⡇⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀  "
  "    ⠀⢸⠃⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⢀⠀⠀⠀⠀⠀⣾⠀⠀  "
  "    ⠀⣸⠀⠀⠹⡄⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠸⠀⠀⠀⠀⠀⡇⠀⠀  "
  "    ⠀⡏⠀⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⢀⣠⢶⡇⠀⠀⢰⡀⠀⠀⠀⠀⠀⡇⠀⠀  "
  "    ⢰⠇⡄⠀⠀⠀⡿⢣⣀⣀⣀⡤⠴⡞⠉⠀⢸⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⣧⠀⠀  "
  "    ⣸⠀⡇⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢹⠀⠀⢸⠀⠀⢀⣿⠇⠀⠀⠀⠁⠀⢸⠀⠀  "
  "    ⣿⠀⡇⠀⠀⠀⠀⠀⢀⡤⠤⠶⠶⠾⠤⠄⢸⠀⡀⠸⣿⣀⠀⠀⠀⠀⠀⠈⣇⠀  "
  "    ⡇⠀⡇⠀⠀⡀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠸⡌⣵⡀⢳⡇⠀⠀⠀⠀⠀⠀⢹⡀  "
  "    ⡇⠀⠇⠀⠀⡇⡸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠮⢧⣀⣻⢂⠀⠀⠀⠀⠀⠀⢧  "
  "    ⣇⠀⢠⠀⠀⢳⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡎⣆⠀⠀⠀⠀⠀⠘  "])

;; Setup Code Action Menu
(set g.code_action_menu_show_diff false)

;; Setup Symbols Outline
(symbols-outline.setup {
  :highlight_hovered_item true
  :show_guides true
})

;; Setup Git Signs
(gitsigns.setup {
  :signs {
    :add          {:hl "GitSignsAdd"    :text "█" :numhl "GitSignsAddNr"    :linehl "GitSignsAddLn"}
    :change       {:hl "GitSignsChange" :text "█" :numhl "GitSignsChangeNr" :linehl "GitSignsChangeLn"}
    :delete       {:hl "GitSignsDelete" :text "_" :numhl "GitSignsDeleteNr" :linehl "GitSignsDeleteLn"}
    :topdelete    {:hl "GitSignsDelete" :text "‾" :numhl "GitSignsDeleteNr" :linehl "GitSignsDeleteLn"}
    :changedelete {:hl "GitSignsChange" :text "~" :numhl "GitSignsChangeNr" :linehl "GitSignsChangeLn"}
  }
})

;; Setup LSP Trouble
(lsp-trouble.setup {})

;; Setup LSP Colors
(lsp-colors.setup {
  :Error "#db4b4b"
  :Warning "#e0af68"
  :Information "#0db9d7"
  :Hint "#10B981"
})

;; Disable builtin statusline
(vim.cmd "set noshowmode")

;; Setup LspKind symbols
(set vim.o.completeopt "menuone,noselect")

(lspkind.init {
  :with_text true
  :symbol_map {
    :Text ""
    :Method ""
    :Function "ƒ"
    :Constructor ""
    :Variable ""
    :Class "פּ "
    :Interface "蘒"
    :Module ""
    :Property ""
    :Field ""
    :Event ""
    :TypeParameter "<>"
    :Unit "塞"
    :Value ""
    :Enum "練"
    :Keyword ""
    :Snippet ""
    :Color ""
    :File ""
    :Folder ""
    :EnumMember ""
    :Constant ""
    :Struct ""
  }
})

;; Setup telescope
(telescope.setup {
  :defaults {
    :file_ignore_patterns ["node_modules" "target" "build" "dist" "out" "vendor" "_esy" ".yarn" ".gradle" ".idea" ".vscode"]
  }
  :pickers {
    :find_files {:theme :dropdown :prompt_prefix "🔍"}
    :buffers {:theme :dropdown}
    :colorscheme {:theme :dropdown}
    :help_tags {:theme :dropdown}
    :live_grep {:theme :dropdown}
  }
  :extensions {
    :fzf {
      :fuzzy true
      :override_generic_sorter true
      :override_file_sorter true
      :case_mode "smart_case"
    }
    :media_files {
      :filetypes ["png" "jpeg" "jpg" "mp4" "webm" "pdf" "webp"]
      :find_cmd "find"
    }
    :ui-select [(themes.get_dropdown)]
    :lsp_handlers {
      :code_action {
        :telescope (themes.get_dropdown)
      }
    }
  }
})

(telescope.load_extension "fzf")
(telescope.load_extension "lsp_handlers")
(telescope.load_extension "ui-select")
(telescope.load_extension "dap")

(set vim.ui.select (require :popui.ui-overrider))

;; Setup key bindings

(vim.api.nvim_set_keymap "n" "<leader>ltt"  "<cmd>Trouble<CR>"                         {:noremap true}) ;; Open diagnostic menu
(vim.api.nvim_set_keymap "n" "<leader>ltd"  "<cmd>TroubleToggle<CR>"                   {:noremap true}) ;; Open TODO menu
(vim.api.nvim_set_keymap "n" "<leader>so"   "<cmd>SymbolsOutline<CR>"                  {:noremap true}) ;; Open symbol map

(vim.api.nvim_set_keymap "n" "<leader>ff"     "<cmd>Telescope find_files<CR>"            {:noremap true}) ;; Open find files
(vim.api.nvim_set_keymap "n" "<leader>fd"     "<cmd>Telescope dap commands<CR>"          {:noremap true}) ;; Open dap commands
(vim.api.nvim_set_keymap "n" "<leader>fdb"    "<cmd>Telescope dap list_breakpoints<CR>"  {:noremap true}) ;; Open dap breakpoints
(vim.api.nvim_set_keymap "n" "<leader>fdf"    "<cmd>Telescope dap frames<CR>"            {:noremap true}) ;; Open dap frames
(vim.api.nvim_set_keymap "n" "<leader>fdv"    "<cmd>Telescope dap variables<CR>"         {:noremap true}) ;; Open dap variables
(vim.api.nvim_set_keymap "n" "<leader>fg"     "<cmd>Telescope live_grep<CR>"             {:noremap true}) ;; Open live grep
(vim.api.nvim_set_keymap "n" "<leader>fb"     "<cmd>Telescope buffers<CR>"               {:noremap true}) ;; Open openned buffers
(vim.api.nvim_set_keymap "n" "<leader>fh"     "<cmd>Telescope help_tags<CR>"             {:noremap true}) ;; Open help
(vim.api.nvim_set_keymap "n" "<leader>fc"     "<cmd>Telescope colorscheme<CR>"           {:noremap true}) ;; Open colorscheme change
(vim.api.nvim_set_keymap "n" "<leader>fgit"   "<cmd>Telescope git_commits<CR>"           {:noremap true}) ;; Open telescope commits
(vim.api.nvim_set_keymap "n" "<C-P>"          "<cmd>Telescope commands<CR>"              {:noremap true}) ;; Open telescope commands
