require("jak.core.bootstrap").bootstrap()
--FIX: should get rid of nvchad settings
require "jak.neovide"
require "jak.opt"
require "jak.plugins"
require "jak.mappings"
require "jak.autocmd"

--HACK: tmp workaround for MatchParen highlight group
vim.schedule(function()
    vim.cmd "hi clear MatchWord"
    vim.cmd "hi clear MatchParen"
    vim.cmd "hi MatchParen guibg=LightRed"
end)
