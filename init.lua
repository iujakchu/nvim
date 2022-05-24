local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end

require "jak"
--TODO: tmp workaround for MatchParen higrp
vim.api.nvim_create_autocmd("BufEnter",{
    pattern = "*",
    callback = function ()
        vim.cmd[[
            hi MatchParen ctermbg=black guibg=purple
            ]]
            end
})
