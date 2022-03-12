(local nvim (require :aniseed.nvim))
(local bufferline (require :bufferline))

(local o nvim.o)
(local g nvim.g)

(set g.spaceline_seperate_style "space")

;; Setup Bufferline
(set o.termguicolors true)
(bufferline.setup {
  :options {
    :offsets [
      {:filetype "NvimTree" :text "" :padding 1}
      {:filetype "packer" :text "" :padding 1}
    ]
    :view "multiwindow"
    :diagnostics "nvim_lsp"
    :separator_style :thin
  }})

;; Setup key bindings

(vim.api.nvim_set_keymap "n" "[b" "<cmd>BufferLineCycleNext<CR>"               {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "b]" "<cmd>BufferLineCyclePrev<CR>"               {:noremap true})

(vim.api.nvim_set_keymap "n" "<C-x>"  "<cmd>bdelete<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>be" "<cmd>BufferLineSortByExtension<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>bd" "<cmd>BufferLineSortByDirectory<CR>" {:noremap true})
