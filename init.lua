--     ┏┓┏━┓╻┏ ╻┏━┓   ╻ ╻┏━┓┏┳┓┏━╸
--      ┃┣━┫┣┻┓ ┗━┓   ┣━┫┃ ┃┃┃┃┣╸
--    ┗━┛╹ ╹╹ ╹ ┗━┛   ╹ ╹┗━┛╹ ╹┗━╸

require "jak"
--TODO: try null-ls
vim.keymap.set("n", "-", ":lua vim.pretty_print()<LEFT>")
vim.keymap.set("n", "=", ":lua vim.pretty_print(vim.o.)<LEFT>")
vim.g.material_style = "Palenight"
vim.cmd "colorscheme material"

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "LightRed", timeout = 400 }
    end,
})
-- Highlight Yanked Text
--[[ vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank { higroup = "CursorLineFold", timeout = 400 }
    end,
}) ]]
vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        vim.opt.laststatus = 0
    end,
})
vim.api.nvim_create_autocmd("BufUnload", {
    buffer = 0,
    callback = function()
        vim.opt.laststatus = 3
    end,
})
