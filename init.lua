require "jak"
--TODO: tmp workaround for MatchParen highlight group
vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*",
   callback = function()
      vim.cmd [[
            hi MatchParen ctermbg=black guibg=purple
            TransparentEnable
            ]]
   end,
})
