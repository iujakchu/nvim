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
   "cssls",
   "sumneko_lua",
}

for _, name in pairs(servers) do
   local server_is_found, server = lsp_installer.get_server(name)
   if server_is_found and not server:is_installed() then
      print("Installing " .. name)
      server:install()
      print("Installed " .. name)
   end
end
local function on_attach(client, bufnr)
   local opts = { noremap = true, silent = true }
   vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "r", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-r>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
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
