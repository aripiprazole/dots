local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig/util')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = {
  'rust_analyzer',
  'tsserver',
  'bashls',
  'jsonls',
  'kotlin_language_server',
  'hls',
  'graphql',
  'ocamllsp',
  'cssls',
  'stylelint_lsp',
  'vimls',
  'html',
  'vuels',
  'svelte',
  'clangd',
  'cmake',
  'flow',
  'clojure_lsp',
  'idris'
}

configs['idris'] = {
  default_config = {
    cmd = { 'idris2-lsp' },
    filetypes = { 'idris' },
    root_dir = util.find_git_ancestor
  }
}

local function on_attach(client, buf)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(buf, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(buf, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts =  {silent=true, expr=true}

  buf_set_keymap('i', '<C-Space>', 'compe#complete()', opts)
  buf_set_keymap('i', '<CR>', "compe#confirm('<CR>')", opts)
  buf_set_keymap('i', '<C-e>', "compe#close('C-e')", opts)

  opts = {noremap=true, silent=true}

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<C-n>', ' <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-p>', ' <cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'ca', ' <cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end
