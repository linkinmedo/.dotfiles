local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" }
})
