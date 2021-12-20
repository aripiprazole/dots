vim.cmd "autocmd BufWritePre * bzl AutoFormatBuffer buildifier"
vim.cmd "autocmd BufWritePre * c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format"
vim.cmd "autocmd BufWritePre * dart AutoFormatBuffer dartfmt"
vim.cmd "autocmd BufWritePre * go AutoFormatBuffer gofmt"
vim.cmd "autocmd BufWritePre * gn AutoFormatBuffer gn"
vim.cmd "autocmd BufWritePre * html,css,sass,scss,less,json AutoFormatBuffer js-beautify"
vim.cmd "autocmd BufWritePre * java AutoFormatBuffer google-java-format"
vim.cmd "autocmd BufWritePre * python AutoFormatBuffer yapf"
vim.cmd "autocmd BufWritePre * rust AutoFormatBuffer rustfmt"
vim.cmd "autocmd BufWritePre * vue AutoFormatBuffer prettier" ;; TODO: use eslint

;; Setup key bindings

(vim.api.nvim_set_keymap "n" "<leader>ft" "<cmd>:FormatCode<CR>" {:noremap true}) ;; Format file
(vim.api.nvim_set_keymap "n" "<leader>ftl" "<cmd>:FormatLines<CR>" {:noremap true}) ;; Format selected code
