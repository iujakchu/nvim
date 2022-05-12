local current_path = vim.fn.stdpath "config" .. "/lua/integrations"
local file_iter = require("plenary.scandir").scan_dir(current_path, {})

local integration_highlight = {}

for _, value in ipairs(file_iter) do
   local filename_root = vim.fn.fnamemodify(value, ":t:r")
   if filename_root ~= "init" then
      integration_highlight = vim.tbl_extend("force", integration_highlight, require("integrations/" .. filename_root))
   end
end

for hl, col in pairs(integration_highlight) do
   vim.api.nvim_set_hl(0, hl, col)
end
