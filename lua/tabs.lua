require('bufferline').setup {
  options = {
    view = 'multiwindow',
    diagnostics = 'nvim_lsp'
  }
}

vim.api.nvim_set_keymap('n', '[b', '<cmd>BufferLineCycleNext<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'b]', '<cmd>BufferLineCyclePrev<CR>', {noremap=true})

vim.api.nvim_set_keymap('n', '<leader>be', '<cmd>BufferLineSortByExtension<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>bd', '<cmd>BufferLineSortByDirectory<CR>', {noremap=true})

