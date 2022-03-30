vim.g.proxy = "https://hub.fastgit.xyz/"
local present, impatient = pcall(require, "impatient")

if present then
	impatient.enable_profile()
end
require("jak.opt")
require("jak.mappings")
