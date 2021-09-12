local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.html.setup({
  on_attach = function(client)
    on_attach(client)
  end,
  capabilities = capabilities,
})
