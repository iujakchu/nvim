local cmd = vim.cmd
local default_opts = { noremap = true, silent = true }
local map = function(mode, mapper, mapee)
	return vim.api.nvim_set_keymap(mode, mapper, mapee, default_opts)
end

function Run()
	if vim.bo.filetype == "rust" then
		require("rust-tools.runnables").runnables()
	end
end
map("n", " ", "<NOP>")
vim.g["mapleader"] = " "

map("n", "<ESC>", ":noh<CR>")

map("n", "Q", ":q<CR>")
map("n", "S", ":w<CR>")

map("", "J", "5j")
map("", "K", "5k")
map("n", "H", "0")
map("n", "L", "$")
map("n", "B", ":bdelete<CR>")

map("n", "<leader>e", ":NvimTreeToggle<CR>")

map("n", "<C-t>", ":tabe<CR>")
map("n", "<leader>-", ":-tabnext<CR>")
map("n", "<leader>=", ":+tabnext<CR>")

map("n", "-", ":BufferLineCyclePrev<CR>")
map("n", "=", ":BufferLineCycleNext<CR>")
map("n", "<C-c>", ":BufferLinePickClose<CR>")

map("n", "<leader>w", "<cmd>HopWord<CR>")
map("n", "<leader>l", "<cmd>HopLine<CR>")
map("n", "<leader>p", "<cmd>HopPattern<CR>")

map(
	"n",
	"<leader>f",
	":lua require'telescope.builtin'.find_files({ require('telescope.themes').get_ivy({}),find_command = {'rg' ,'--hidden' ,'--glob' ,'!.git','--files'}})<cr>"
)
map(
	"n",
	"<leader>g",
	":lua require'telescope.builtin'.live_grep({ require('telescope.themes').get_ivy({}),find_command = {'rg' ,'--hidden' ,'--glob' ,'!.git','--files'} })<cr>"
)
map("n", "<leader>b", ":Telescope buffers<CR>")
map("n", "<leader>rp", ":Telescope projects<CR>")
map("n", "<leader>n", ":Telescope neoclip<CR>")

map("n", "<leader>a", ":CodeActionMenu<CR>")

map("n", "<leader>u", ":UndotreeToggle<CR>")
map("n", "<leader>m", ":MarkdownPreviewToggle<CR>")
map("", "s", ":TranslateW --engines=bing,youdao,haici<CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>r", ':lua require("rust-tools.runnables").runnables()<CR>')

cmd("silent! command PackerCompile lua require 'jak.plugins' require('packer').compile()")
cmd("silent! command PackerStatus lua require 'jak.plugins' require('packer').status()")
cmd("silent! command PackerSync lua require 'jak.plugins' require('packer').sync()")
