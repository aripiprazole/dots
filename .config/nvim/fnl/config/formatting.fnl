(vim.cmd "
  augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType gn AutoFormatBuffer gn
    autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
    autocmd FileType rust AutoFormatBuffer rustfmt
    autocmd FileType vue AutoFormatBuffer prettier
  augroup END") ;; TODO: use eslint

;; Setup key bindings

(vim.api.nvim_set_keymap "n" "<leader>ft" "<cmd>:FormatCode<CR>" {:noremap true}) ;; Format file
(vim.api.nvim_set_keymap "n" "<leader>ftl" "<cmd>:FormatLines<CR>" {:noremap true}) ;; Format selected code
