-- vim.g.proxy = "https://hub.fastgit.xyz/"
vim.g.proxy = "https://github.com/"
local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end
require "jak.opt"
require "jak.mappings"
--TODO,
