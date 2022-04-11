vim.api.nvim_set_keymap("n", "fs", ":FlutterOutlineToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "frr", ":FlutterRun<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "fg", ":FlutterPubGet<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "fe", ":FlutterEmulators<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "frl", ":FlutterReload<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "frs", ":FlutterRestart<CR>", { noremap = true, silent = true })

require("flutter-tools").setup {}
