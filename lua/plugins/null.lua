local null_ls = require('null-ls')

-- setup lspconfing to use null-ls
null_ls.setup({
  sources = { null_ls.builtins.formatting.prettier.with({
    prefer_local = "node_modules/.bin",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "json", "yaml" },
  }) }
})
