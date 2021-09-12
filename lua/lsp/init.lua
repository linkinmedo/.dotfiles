-- local lsp_config = require("lspconfig")
local lsp_install = require("lspinstall")
local lsp = vim.lsp
-- local fn = vim.fn

-- Install missing servers
local required_servers = { "bash", "css", "html", "json", "lua", "typescript", "vim", "yaml", "efm" }
local installed_servers = lsp_install.installed_servers()
for _, server in pairs(required_servers) do
  if not vim.tbl_contains(installed_servers, server) then
    lsp_install.install_server(server)
  end
end

lsp_install.setup()

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = "●",
      spacing = 4,
    }
  }
)

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require("lsp." .. server)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- fn.sign_define("LspDiagnosticsSignError", { text = "🞮", numhl = "LspDiagnosticsDefaultError" })
-- fn.sign_define("LspDiagnosticsSignWarning", { text = "▲", numhl = "LspDiagnosticsDefaultWarning" })
-- fn.sign_define("LspDiagnosticsSignInformation", { text = "⁈", numhl = "LspDiagnosticsDefaultInformation" })
-- fn.sign_define("LspDiagnosticsSignHint", { text = "⯁", numhl = "LspDiagnosticsDefaultHint" })

-- require('lsp.bash')
-- require('lsp.css')
-- require('lsp.efm')
-- require('lsp.html')
-- require('lsp.json')
-- require('lsp.lua')
-- require('lsp.rust')
-- require('lsp.sql')
-- require('lsp.ts')
-- require('lsp.vim')
require('lsp.flutter')
