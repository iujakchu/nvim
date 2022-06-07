local map = function(a, b)
   vim.keymap.set("n", a, b, { silent = true })
end
map("gta", ":Neorg gtd capture<CR>")
map("gtv", ":Neorg gtd views<CR>")
map("gte", ":Neorg gtd edit<CR>")
