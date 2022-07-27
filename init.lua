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
        vim.highlight.on_yank { higroup = "WildMenu", timeout = 400 }
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
vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*",
    callback = function()
        local cursor_at = vim.fn.line '`"'
        if vim.fn.line "$" >= cursor_at and cursor_at > 1 then
            vim.api.nvim_command 'g`"'
        end
    end,
})
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "help",
--     callback = function()
--         vim.cmd "colorscheme torte"
--         vim.keymap.set("n", "<C-P>", "<C-]>")
--         vim.opt_local.conceallevel = 0
--         vim.api.nvim_command [[
--             hi link HelpBar Normal
--             hi link HelpStar Normal
--         ]]
--     end,
-- })
-- set shada path
--vim.schedule(function()
--    vim.opt.shadafile = vim.fn.stdpath "data" .. "/shada/main.shada"
--    vim.cmd [[ silent! rsh ]]
--end)
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=o",
})
