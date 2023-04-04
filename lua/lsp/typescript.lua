local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


lsp_config.typescript.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    on_attach(client)
  end,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  -- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
})
