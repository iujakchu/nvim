local cmd = vim.cmd
local default_opts = { noremap = true, silent = true }
local map = function(mode, mapper, mapee)
   return vim.api.nvim_set_keymap(mode, mapper, mapee, default_opts)
end

map("n", " ", "<NOP>")
vim.g["mapleader"] = " "

map("n", "<ESC>", ":noh<CR>")

map("n", "Q", ":q<CR>")
map("n", "S", ":w<CR>")
map("n", "tt", ":TroubleToggle<CR>")
map("n", "td", ":TodoTelescope<CR>")
map("n", "<leader>,", ":so %<CR>")

map("", "J", "5j")
map("", "K", "5k")
map("", "H", "0")
map("", "L", "$")
map("n", "<leader>d", ":bdelete<CR>")

map("n", "<leader>e", ":NvimTreeToggle<CR>")

map("n", "<C-t>", ":tabe<CR>")
map("n", "<leader>-", ":-tabnext<CR>")
map("n", "<leader>=", ":+tabnext<CR>")

map("n", "<TAB>", ":BufferLineCycleNext<CR>")
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>")

map("i", "<A-h>", "<Left>")
map("i", "<A-j>", "<Down>")
map("i", "<A-l>", "<Right>")
map("i", "<A-k>", "<Up>")
map("i", "<A-a>", "<Esc>^i")
map("i", "<A-e>", "<End>")

map("n", "<leader>w", "<cmd>HopWord<CR>")
map("n", "<leader>l", "<cmd>HopLine<CR>")

map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-h>", "<C-w>h")
map("n", "<A-l>", "<C-w>l")

map("n", "<leader>fa", "zM")
map("n", "<leader>fo", "zR")
map(
   "n",
   "<leader>ff",
   ":lua require'telescope.builtin'.find_files({ require('telescope.themes').get_ivy({}),find_command = {'rg' ,'--hidden' ,'--glob' ,'!.git','--files'}})<cr>"
)
map(
   "n",
   "<leader>ft",
   ":lua require'telescope.builtin'.live_grep({ require('telescope.themes').get_ivy({}),find_command = {'rg' ,'--hidden' ,'--glob' ,'!.git','--files'} })<cr>"
)
map("n", "<leader><leader>", ":Telescope help_tags<CR>")
-- map("n", "<leader>p", ":Telescope projects<CR>")
map("n", "<leader>p", ":Glow<CR>")
map("n", "<leader>n", ":Telescope neoclip<CR>")
map("n", "<leader>j", ":Telescope emoji search<CR>")
map("n", "<leader>b", ":Telescope file_browser<CR>")

map("n", "<leader>a", ":CodeActionMenu<CR>")

map("n", "<leader>u", ":UndotreeToggle<CR>")
map("n", "<leader>m", ":MarkdownPreviewToggle<CR>")
map("", "s", ":TranslateW <CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>rr", ':lua require("rust-tools.runnables").runnables()<CR>')

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
