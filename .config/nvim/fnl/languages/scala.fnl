(vim.cmd "
augroup lsp
  au!
  au FileType java,scala,sbt lua require('metals').initialize_or_attach({})
augroup end
")
