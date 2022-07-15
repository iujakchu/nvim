--     ┏┓┏━┓╻┏ ╻┏━┓   ╻ ╻┏━┓┏┳┓┏━╸
--      ┃┣━┫┣┻┓ ┗━┓   ┣━┫┃ ┃┃┃┃┣╸
--    ┗━┛╹ ╹╹ ╹ ┗━┛   ╹ ╹┗━┛╹ ╹┗━╸

require "jak"
--TODO: try null-ls
vim.keymap.set("n", "-", ":lua vim.pretty_print()<LEFT>")
vim.keymap.set("n", "=", ":lua vim.pretty_print(vim.o.)<LEFT>")
