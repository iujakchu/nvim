local lsp_installer = require "nvim-lsp-installer"
local extra = {}
extra.sumneko_lua = {
   settings = {

      Lua = {
         diagnostics = {
            globals = { "vim" },
         },
      },
   },
}

local servers = {
   "bashls",
   "pyright",
   "vuels",
   "rust_analyzer",
   "slint_lsp",
   "denols",
   "clangd",
   "cssls",
   "sumneko_lua",
}

for _, name in pairs(servers) do
   local server_is_found, server = lsp_installer.get_server(name)
   if server_is_found and not server:is_installed() then
      print("Installing " .. name)
      server:install()
   end
end
local function on_attach(client, bufnr)
   local opts = { noremap = true, silent = true }
   -- highlight
   if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec(
         [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
         false
      )
   end
end
lsp_installer.on_server_ready(function(server)
   local opts = {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
   }

   if extra[server.name] then
      opts = vim.tbl_deep_extend("force", extra[server.name], opts)
   end
   server:setup(opts)
end)
