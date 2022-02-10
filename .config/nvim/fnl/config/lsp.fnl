(local nvim (require :aniseed.nvim))
(local lsp-signature (require :lsp_signature))

(local lspconfig (require :lspconfig))

(local configs (require :lspconfig.configs))
(local util (require :lspconfig.util))
(local code-action (require :lsputil.codeAction))
(local locations (require :lsputil.locations))
(local symbols (require :lsputil.symbols))

(local capabilities (vim.lsp.protocol.make_client_capabilities) )
(local servers [
  "rust_analyzer"
  "tsserver"
  "bashls"
  "jsonls"
  "kotlin_language_server"
  "hls"
  "graphql"
  "ocamllsp"
  "cssls"
  "stylelint_lsp"
  "vimls"
  "html"
  "vuels"
  "svelte"
  "clangd"
  "cmake"
  "flow"
  "clojure_lsp"
  "idris"
])

(set configs.idris {
  :default_config {
    :cmd ["idris2-lsp"]
    :filetypes ["idris"]
    :root_dir util.find_git_ancestor
  }})

(local buf-set-keymap vim.api.nvim_buf_set_keymap)
(local buf-set-option vim.api.nvim_buf_set_option)

(fn on-atach [client buf]
  ;; Setup lsp signature plugin
  (lsp-signature.on_attach {
    :bind true ; This is mandatory, otherwise border config won't get registered.
    :handler_opts {:border :rounded}
  } buf)

  (buf-set-option buf :omnifunc "v:lua.vim.lsp.omnifunc")

  (buf-set-keymap buf "i" "<C-Space>" "compe#complete()"      { :silent true :expr true })
  (buf-set-keymap buf "i" "<CR>"      "compe#confirm('<CR>')" { :silent true :expr true })

  (if client.resolved_capabilities.document_formatting
      (buf-set-keymap buf "n" "<leader>lf"   "<cmd>lua vim.lsp.buf.formatting()<CR>"       {:noremap true :silent true})
    (client.resolved_capabilities.document_range_formatting)
      (buf-set-keymap buf "n" "<leader>lf"   "<cmd>lua vim.lsp.buf.range_formatting()<CR>" {:noremap true :silent true})
      nil)
  
  (when client.resolved_capabilities.document_highlight
    (vim.cmd "
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ")
    nil)
  nil)

(set capabilities.textDocument.completion.completionItem.snippetSupport true)
(set capabilities.textDocument.completion.completionItem.resolveSupport {
  :properties ["documentation" "detail" "additionalTextEdits"]
})

(each [_ value (ipairs servers)]
  (let [config (. lspconfig value)]
    (config.setup {
        :capabilities capabilities
        :on_attach on-atach
      })))

(set vim.lsp.handlers.textDocument/codeAction  code-action.code_action_handler)
(set vim.lsp.handlers.textDocument/references  locations.references_handler)
(set vim.lsp.handlers.textDocument/definition  locations.definition_handler)
(set vim.lsp.handlers.textDocument/declaration  locations.declaration_handler)
(set vim.lsp.handlers.textDocument/typeDefinition  locations.typeDefinition_handler)
(set vim.lsp.handlers.textDocument/implementation  locations.implementation_handler)
(set vim.lsp.handlers.textDocument/documentSymbol  symbols.document_handler)
(set vim.lsp.handlers.workspace/symbol  symbols.workspace_handler)

(vim.api.nvim_set_keymap "n" "ca"            "<cmd>lua vim.lsp.buf.code_action()<CR>"        {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "gd"            "<cmd>lua vim.lsp.buf.definition()<CR>"         {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "gD"            "<cmd>lua vim.lsp.buf.declaration()<CR>"        {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "gr"            "<cmd>lua vim.lsp.buf.references()<CR>"         {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "gi"            "<cmd>lua vim.lsp.buf.implementation()<CR>"     {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "K"             "<cmd>lua vim.lsp.buf.hover()<CR>"              {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "<C-k>"         "<cmd>lua vim.lsp.buf.signature_help()<CR>"     {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "<C-n>"         "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"   {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "<C-p>"         "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"   {:noremap true :silent true})
(vim.api.nvim_set_keymap "n" "rn"            "<cmd>Lspsaga rename<CR>"                       {:noremap true :silent true})