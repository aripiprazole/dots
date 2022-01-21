(local nvim (require :aniseed.nvim))

(local Comment (require :Comment))
(local colorizer (require :colorizer))
(local indent-blankline (require :indent_blankline))

(local g nvim.g)
(local o nvim.o)
(local wo nvim.wo)

(vim.cmd "set clipboard=unnamedplus") ;; Use system clipboard

(vim.cmd "set mouse=a") ;; Enable mouse

(vim.cmd "set shiftwidth=2") ;; Set tab width to 2
(vim.cmd "set encoding=UTF-8") ;; Set file encoding to UTF-8
(vim.cmd "set backspace=indent,eol,start") ;; Make backspace delete to the left

;; Make tab use spaces
(set o.expandtab true)
(set o.smarttab true) 

;; Enable relativenumbers in vim
(set wo.relativenumber true)
(set wo.number true)
(set o.numberwidth 5)

(set wo.wrap false) ;; Disable wrap text option

;; Setup IndentLine
(set g.indentLine_fileTypeExclude ["dashboard" "terminal" "nofile"])
(set g.indent_blankline_char "▏")

;; Setup Comment
(Comment.setup {
  :toggler {
    :line "gcc"
    :block "gcb"
  }
})

(indent-blankline.setup {
  :space_char_blankline " "
  :show_end_of_line true
})

;; Setup Colorizer
(colorizer.setup {})
