local cmd = vim.cmd
local Map = {}
vim.g["mapleader"] = " "
Map.general = {
    n = {
        ["<ESC>"] = ":noh<CR>",
        ["Q"] = ":q<CR>",
        ["S"] = ":w<CR>",
        ["<leader>."] = ":so %<CR>",
        ["n"] = "nzz",
        ["N"] = "Nzz",
        ["<leader>d"] = ":bdelete<CR>",
        ["<C-t>"] = ":tabe<CR>",
        ["<leader>-"] = ":-tabnext<CR>",
        ["<leader>="] = ":+tabnext<CR>",
        ["<C-j>"] = "<C-w>j",
        ["<C-k>"] = "<C-w>k",
        ["<C-h>"] = "<C-w>h",
        ["<C-l>"] = "<C-w>l",
    },
    v = {
        ["J"] = "5j",
        ["K"] = "5k",
        ["<"] = "<gv",
        [">"] = ">gv",
    },
    i = {
        ["<A-a>"] = "<Esc>^i",
        ["<A-e>"] = "<End>",
    },
}

-- NOTE:try another key to lead key
-- map("n", ";j", "<C-w>-")
-- map("n", ";k", "<C-w>+")
-- map("n", ";h", "<C-w><")
-- map("n", ";l", "<C-w>>")

--map("n", "<leader>fa", "zM")
--map("n", "<leader>fo", "zR")

-- TODO:lspconfig
Map.lspconfig = {
    n = {
        ["gD"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
        ["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
        ["r"] = "<cmd>lua vim.lsp.buf.hover()<CR>",
        ["gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>",
        ["<C-r>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        ["<leader>rn"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
        ["gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
        ["<rightmouse>"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
        ["<leader>ca"] = "<cmd>lua vim.lsp.buf.code_action()<CR>",
        ["[d"] = '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
        ["gl"] = "<cmd>lua vim.diagnostic.open_float()<CR>",
        ["]d"] = '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
        ["<leader>q"] = "<cmd>lua vim.diagnostic.setloclist()<CR>",
    },
}
cmd "silent! command LuaSnipEdit lua require('luasnip.loaders.from_lua').edit_snippet_files()"
local wk = require "which-key"
local default_options = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}
for _, v in pairs(Map) do
    for ik, iv in pairs(v) do
        local options = vim.tbl_deep_extend("force", default_options, { mode = ik })
        -- wk.register(iv, options)
        for iik, iiv in pairs(iv) do
            vim.keymap.set(ik, iik, iiv)
        end
    end
end
