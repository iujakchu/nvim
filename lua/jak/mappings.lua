local cmd = vim.cmd
local map = require("jak.core.utils").map
map("n", " ", "<NOP>")
vim.g["mapleader"] = " "

map("n", "<ESC>", ":noh<CR>")

map("n", "Q", ":q<CR>")
map("n", "S", ":w<CR>")
map("n", "<leader>.", ":so %<CR>")

map("", "J", "5j")
map("", "K", "5k")
map("", "H", "0")
map("", "L", "$")
map("n", "<leader>d", ":bdelete<CR>")

map("n", "<C-t>", ":tabe<CR>")
map("n", "<leader>-", ":-tabnext<CR>")
map("n", "<leader>=", ":+tabnext<CR>")

map("n", "<rightmouse>", "<cmd>lua vim.lsp.buf.definition()<CR>")
--[[ map("i", "<A-h>", "<Left>")
map("i", "<A-j>", "<Down>")
map("i", "<A-l>", "<Right>")
map("i", "<A-k>", "<Up>") ]]
map("i", "<A-a>", "<Esc>^i")
map("i", "<A-e>", "<End>")

map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- NOTE:try another key to lead key
map("n", ";j", "<C-w>-")
map("n", ";k", "<C-w>+")
map("n", ";h", "<C-w><")
map("n", ";l", "<C-w>>")

map("n", "<leader>fa", "zM")
map("n", "<leader>fo", "zR")

map("v", "<", "<gv")
map("v", ">", ">gv")

-- TODO:lspconfig
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "r", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<C-r>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
-- map("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
cmd "silent! command PackerCompile lua require 'jak.plugins' require('packer').compile()"
cmd "silent! command PackerStatus lua require 'jak.plugins' require('packer').status()"
cmd "silent! command PackerSync lua require 'jak.plugins' require('packer').sync()"
cmd "silent! command LuaSnipEdit lua require('luasnip.loaders.from_lua').edit_snippet_files()"
