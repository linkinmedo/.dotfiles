local on_attach = require('lsp.on_attach')

require("flutter-tools").setup{
  lsp = {
    on_attach = on_attach
  }
}
