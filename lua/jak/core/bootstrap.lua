local M = {}

function M.bootstrap_impatient()
    local present, impatient = pcall(require, "impatient")
    if not present then
        local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/impatient.nvim"
        vim.notify "cloning impatient..."
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
            vim.fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/lewis6991/impatient.nvim",
                install_path,
            }
        end
        vim.cmd "packadd impatient.nvim"
        present, impatient = pcall(require, "impatient")
        if present then
            vim.notify "clone successfully!"
            impatient.enable_profile()
        else
            error "clone failed!"
        end
    else
        impatient.enable_profile()
    end
end
function M.bootstrap_packer()
    local present, packer = pcall(require, "packer")
    if not present then
        local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        vim.notify "cloning packer..."
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
            vim.fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            }
        end
        present, packer = pcall(require, "packer")
        if present then
            vim.notify "clone successfully!"
            vim.cmd "packadd packer.nvim"
        else
            error "clone failed!"
        end
    else
        vim.cmd "packadd packer.nvim"
    end
    packer.init {
        git = {
            default_url_format = "https://github.com/%s",
            depth = 1,
            clone_timeout = 300,
        },
        display = { open_fn = require("packer.util").float },
    }
    return packer
end

return M
