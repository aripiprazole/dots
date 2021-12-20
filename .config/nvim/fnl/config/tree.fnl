(local nvim (require :aniseed.nvim))
(local nvim-tree (require :nvim-tree))

(local g nvim.g)

(set g.nvim_tree_icons {
  :default ""
  :symlink ""
  :git {
    :unstaged "✗"
    :staged "✓"
    :unmerged ""
    :renamed "➜"
    :untracked "★"
    :deleted ""
    :ignored "◌"
  }
  :folder {
    :default ""
    :open ""
    :empty ""
    :empty_open ""
    :symlink ""
    :symlink_open ""
  }
  :lsp {
    :hint ""
    :info ""
    :warning ""
    :error ""
  }
})

(set g.nvim_tree_side "left")
(set g.nvim_tree_width 40)
(set g.nvim_tree_indent_markers 1)
(set g.nvim_tree_width_allow_resize 1)
(set g.nvim_tree_special_files ["README.md" "Makefile"])
(set g.nvim_tree_highlight_opened_files 1)

;; Setup key bindings

(vim.api.nvim_set_keymap "n" "<leader>n" "<cmd>NvimTreeToggle<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>r" "<cmd>NvimTreeRefresh<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>nf" "<cmd>NvimTreeFindFile<CR>" {:noremap true})

;; Setup nvim-tree
(nvim-tree.setup {
  :diagnostics {
    :enable false
    :icons {
      :hint ""
      :info ""
      :warning ""
      :error ""
    }
  }
  :update_focused_file {:enable true}
})
