local M = {}
local function fetch(author, repo)
    local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/" .. repo
    local url = author .. "/" .. repo
    vim.notify("cloning " .. url)
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/" .. url,
            install_path,
        }
    end
end

function M.bootstrap_impatient()
    local present, impatient = pcall(require, "impatient")
    if present then
        impatient.enable_profile()
    end
end
function M.bootstrap_packer()
    local present, packer = pcall(require, "packer")
    if not present then
        fetch("wbthomason", "packer.nvim")
        packer = require "packer"
    end
    packer.init {
        git = {
            default_url_format = "https://github.com/%s",
            depth = 1,
            clone_timeout = 300,
        },
        display = { open_fn = require("packer.util").float },
    }
end

function M.bootstrap_whichkey()
    local present, _ = pcall(require, "which-key")
    if not present then
        fetch("max397574", "which-key.nvim")
    end
    require("jak.mappings").map "general"
end

function M.bootstrap()
    M.bootstrap_whichkey()
    M.bootstrap_packer()
    M.bootstrap_impatient()
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
end
return M
