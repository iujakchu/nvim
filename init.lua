--     ┏┓┏━┓╻┏ ╻┏━┓   ╻ ╻┏━┓┏┳┓┏━╸
--      ┃┣━┫┣┻┓ ┗━┓   ┣━┫┃ ┃┃┃┃┣╸
--    ┗━┛╹ ╹╹ ╹ ┗━┛   ╹ ╹┗━┛╹ ╹┗━╸

require "jak"
--TODO: try null-ls
vim.keymap.set("n", "-", ":lua vim.pretty_print()<LEFT>")
vim.keymap.set("n", "=", ":lua vim.pretty_print(vim.o.)<LEFT>")
-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", timeout = 400 }
    end,
})
