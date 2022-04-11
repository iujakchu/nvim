local opt = {
   clipboard = "unnamedplus",
   ruler = false,
   mouse = "n",
   wildignorecase = true,
   swapfile = false,
   completeopt = "menuone,noselect",
   writebackup = false,
   ignorecase = true,
   smartcase = true,
   number = true,
   numberwidth = 4,
   relativenumber = true,
   scrolloff = 5,
   expandtab = true,
   shiftwidth = 2,
   smartindent = true,
   title = true,
   signcolumn = "yes",
   splitbelow = true,
   splitright = true,
   termguicolors = true,
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
