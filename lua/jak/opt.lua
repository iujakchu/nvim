local opt = {
   clipboard = "unnamedplus",
   ruler = false,
   mouse = "a",
   wildignorecase = true,
   swapfile = false,
   completeopt = "menu,menuone,noselect",
   laststatus = 3,
   writebackup = false,
   ignorecase = true,
   smartcase = true,
   number = true,
   numberwidth = 4,
   relativenumber = true,
   scrolloff = 5,
   expandtab = true,
   shiftwidth = 4,
   smartindent = true,
   confirm = true,
   title = true,
   signcolumn = "yes:2",
   splitbelow = true,
   splitright = true,
   termguicolors = true,
   cul = true,
   -- whichwrap = "h,l",
}
for key, value in pairs(opt) do
   vim.o[key] = value
end
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end
vim.opt.linebreak = true
vim.opt.showbreak = "  ﬌"
vim.opt.guicursor = "n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20"
vim.opt.list = true --show some hidden characters
vim.opt.listchars = {
   tab = "> ",
   nbsp = "␣",
   trail = "•",
}
vim.opt.fillchars = {
   eob = " ",
   vert = "║",
   horiz = "═",
   horizup = "╩",
   horizdown = "╦",
   vertleft = "╣",
   vertright = "╠",
   verthoriz = "╬",
}
vim.opt.timeoutlen = 300
vim.opt.foldlevel = 100
vim.opt.foldmethod = "expr" -- use treesitter for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
