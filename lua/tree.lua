local g = vim.g

g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  }
}

g.nvim_tree_side = 'left'
g.nvim_tree_width = 40
g.nvim_tree_ignore = {'.git', 'node_modules', '*.bs.js'}
g.nvim_tree_auto_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_tab_open = 1
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', {noremap=true})
