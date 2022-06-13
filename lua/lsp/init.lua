local null_ls = require('null-ls')
-- local lsp_config = require("lspconfig")
local lsp_install = require('nvim-lsp-installer')
local lsp_install_servers = require('nvim-lsp-installer.servers')
local on_attach = require('lsp.on_attach');
local lsp = vim.lsp
-- local fn = vim.fn

-- setup lspconfing to use null-ls
null_ls.setup({
  sources = { null_ls.builtins.formatting.prettier.with({
    prefer_local = "node_modules/.bin",
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "json" },
    }) }
})
-- lsp_config['null-ls'].setup({})

-- Install missing servers
local required_servers = { "bashls", "cssls", "html", "jsonls", "sumneko_lua", "tsserver", "vimls", "yamlls", "eslint" }
for _, server in pairs(required_servers) do
  local server_available, requested_server = lsp_install_servers.get_server(server);
  if server_available then
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        -- requested_server:install()
        lsp_install.install(server)
    end
  end
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require'lspinstall'.post_install_hook = function ()
--   setup_servers() -- reload installed servers
--   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

lsp_install.on_server_ready(function(server)
    local opts = {
      on_attach = on_attach,
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == "eslint" then
      opts.on_attach = function (client, bufnr)
        -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
        -- the resolved capabilities of the eslint server ourselves!
        client.resolved_capabilities.document_formatting = true
        on_attach(client)
      end
      opts.settings = {
        format = { enable = true }, -- this will enable formatting
      }
    end

    if server.name == "cssls" then
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      opts.capabilities = capabilities
      opts.filetypes = { "css", "scss", "less" }
    end

    if server.name == "html" then
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      opts.capabilities = capabilities
    end

    if server.name == "jsonls" then
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      opts.capabilities = capabilities
      -- opts.on_attach = function (client, bufnr)
      --   -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
      --   -- the resolved capabilities of the eslint server ourselves!
      --   client.resolved_capabilities.document_formatting = false
      --   on_attach(client)
      -- end
    end

    if server.name == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = {
            enable = true,
            globals = {
              "vim",
              "use",
              "describe",
              "it",
              "before_each",
              "after_each",
              "awesome",
              "theme",
              "client"
            }
          }
        }
      }
    end


    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
