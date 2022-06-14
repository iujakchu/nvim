-- ┏┓┏━┓╻┏ ╻┏━┓   ╻ ╻┏━┓┏┳┓┏━╸
--  ┃┣━┫┣┻┓ ┗━┓   ┣━┫┃ ┃┃┃┃┣╸
--┗━┛╹ ╹╹ ╹ ┗━┛   ╹ ╹┗━┛╹ ╹┗━╸
--

require "jak"
--HACK: tmp workaround for MatchParen highlight group
--WARNING:
vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*",
   callback = function()
      vim.cmd [[
            hi MatchParen ctermbg=black guibg=purple
            TransparentEnable
            ]]
   end,
})
--TODO: try null-ls
--WARNING: nvim-tree should not be setup  inside config
require("nvim-tree").setup {}
