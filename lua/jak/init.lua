require("jak.core.bootstrap").bootstrap_impatient()
--FIX: should get rid of nvchad settings
require "jak.opt"
require "jak.mappings"

--HACK: tmp workaround for MatchParen highlight group
vim.schedule(function()
   vim.cmd "TransparentEnable"
   vim.cmd "hi clear MatchWord"
   vim.cmd "hi clear MatchParen"
   vim.cmd "hi MatchParen guibg=LightRed"
end)
