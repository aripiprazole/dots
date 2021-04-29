-- Maps open diagnostic menu
vim.api.nvim_set_keymap('n', '<leader>ltt', '<cmd>LspTroubleToggle<CR>', {noremap=true})

-- Maps open symbol map
vim.api.nvim_set_keymap('n', '<leader>so', '<cmd>SymbolsOutline<CR>', {noremap=true})

-- Maps telescope commands
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files theme=get_dropdown<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {noremap=true})

-- Format all the buffer
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>:FormatCode<CR>', {noremap=true})

-- Format selected lines
vim.api.nvim_set_keymap('n', '<leader>ftl', '<cmd>:FormatLines<CR>', {noremap=true})
