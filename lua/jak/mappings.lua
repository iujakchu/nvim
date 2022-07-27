local Map = {}
vim.g["mapleader"] = " "
Map.general = {
    n = {
        ["<ESC>"] = { ":noh<CR>", "remove hl" },
        ["Q"] = { ":q<CR>", "quit" },
        ["S"] = { ":w<CR>", "sive file" },
        ["<leader>."] = { ":so %<CR>", "source current file" },
        ["n"] = { "nzz", "next item with focus" },
        ["N"] = { "Nzz", "previous item with focus" },
        ["<leader>d"] = { ":bdelete<CR>", "delete current buffer" },
        ["<C-t>"] = { ":tabe<CR>", "open a new tab" },
        ["<leader>-"] = { ":-tabnext<CR>", "jump to previous tab" },
        ["<leader>="] = { ":+tabnext<CR>", "jump to next tab" },
        ["<C-j>"] = { "<C-w>j", "jump to the window below" },
        ["<C-k>"] = { "<C-w>k", "jump to the window up" },
        ["<C-h>"] = { "<C-w>h", "jump to the left window" },
        ["<C-l>"] = { "<C-w>l", "jump to the right window" },
    },
    v = {
        ["J"] = { "5j", "fast move j in visual mode" },
        ["K"] = { "5k", "fast move k in visual mode" },
        ["<"] = { "<gv", "un indent lines" },
        [">"] = { ">gv", "indent lindes" },
    },
    i = {
        ["<A-a>"] = { "<Esc>^i", "move to the first char" },
        ["<A-e>"] = { "<End>", "move the the end char" },
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
        ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "go to decl" },
        ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "go to def" },
        ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "buf hover" },
        ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "go to impl" },
        ["<C-r>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature_help" },
        ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename variable" },
        ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "go to ref" },
        ["<rightmouse>"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "rightmouse click " },
        ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
        ["[d"] = { '<cmd>lua vim.diagnostic.goto_prev({ border =  "rounded"  })<CR>', "goto previous diag" },
        ["]d"] = { '<cmd>lua vim.diagnostic.goto_next({ border =  "rounded"  })<CR>', "goto next diag" },
        ["gl"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "open float diag" },
        ["<leader>q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "loc diag" },
    },
}
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
        for iik, iiv in pairs(iv) do
            wk.register({ [iik] = iiv }, options)
        end
    end
end
