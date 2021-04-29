local cmd = vim.cmd
local g = vim.g
local o = vim.o
local wo = vim.wo

-- set leader key to <Space>
-- leader key is used to many commands in
-- this configuration
g.mapleader = ' '
g.auto_save = 0

cmd 'syntax enable'
cmd 'syntax on'

cmd 'autocmd BufWritePost plugins.lua PackerCompile'

cmd 'set mouse=a'
cmd 'set shiftwidth=2'
cmd 'set backspace=indent,eol,start'
cmd 'set encoding=UTF-8'
cmd 'set noshowmode'
cmd 'set foldcolumn=0'
cmd 'set showtabline=1'

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

wo.number = true
wo.relativenumber = true
wo.wrap = false

o.smarttab = true
o.expandtab = true

o.foldcolumn = '0'
o.termguicolors = true

o.tabstop=2

g.indentLine_enabled = 1
g.indentLine_char = '▏'
g.indent_blankline_char = "▏"
g.indent_blankline_indent_level = 15

require 'plugins.plugins'
require 'plugins.completion'
require 'plugins.theme'
require 'plugins.code-actions'
require 'plugins.languages'
require 'plugins.tree'
require 'plugins.keymaps'
require 'plugins.tabs'
require 'plugins.statusline'
require 'plugins.git'

require('neoscroll').setup()
require('telescope').load_extension('media_files')
require('nvim-web-devicons').setup {}
require('symbols-outline').setup {
  highlight_hovered_item = true,
  show_guides = true,
}

cmd 'hi NonText guifg=bg'

-- decrease buffer border width
cmd 'set fillchars+=vert:\\▕'
cmd 'hi vertsplit guifg=fg guibg=bg'