-- local base16 = require 'base16'
-- base16(base16.themes['twilight'], true)

vim.cmd [[colorscheme xcodedarkhc]]

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = true
  }
}
