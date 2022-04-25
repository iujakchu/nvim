local lsp = require "lspconfig"

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp.sumneko_lua.setup {
   capabilities = capabilities,
   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim" },
         },
      },
   },
}

lsp.rust_analyzer.setup {
   capabilities = capabilities,
   settings = {
      ["rust-analyzer"] = {
         -- cargo = { loadOutDirsFromCheck = true },
         -- procMacro = { enable = true },
         -- hoverActions = { references = true },
         -- checkOnSave = {
         --    command = "clippy",
         -- },
         -- inlayHints = {
         --    parameterHints = true,
         --    closureReturnTypes = true,
         -- },
      },
   },
}
require("lspconfig").pyright.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").denols.setup {}
require("lspconfig").slint_lsp.setup {}
require("lspconfig").bashls.setup {}
