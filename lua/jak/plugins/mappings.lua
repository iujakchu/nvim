local utils = require "jak.core.utils"
local map = utils.map
local plugins = {
    {
        "CRAG666/code_runner.nvim",
        mapping = function()
            map("n", "<F1>", ":RunCode<CR>")
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        mapping = function()
            map("n", "<leader>rr", require("rust-tools.runnables").runnables)
        end,
    },
    {
        "mbbill/undotree",
        mapping = function()
            map("n", "<leader>u", ":UndotreeToggle<CR>")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        mapping = function()
            require "jak.setup.telescope"
            map("n", "<leader>ff", function()
                require("telescope.builtin").find_files {
                    require("telescope.themes").get_ivy {},
                    find_command = { "rg", "--hidden", "--glob", "!.git", "--files" },
                }
            end)
            map("n", "<leader>fs", function()
                require("telescope.builtin").live_grep {
                    require("telescope.themes").get_ivy {},
                    find_command = { "rg", "--hidden", "--glob", "!.git", "--files" },
                }
            end)
            map("n", "<leader><leader>", ":Telescope help_tags<CR>")
            map("n", "<leader>p", ":Telescope projects<CR>")
            map("n", "<leader>n", ":Telescope neoclip<CR>")
            map("n", "<leader>j", ":Telescope emoji <CR>")
            map("n", "<leader>,", ":Telescope file_browser<CR>")
        end,
    },
    {
        "ThePrimeagen/harpoon",
        mapping = function()
            map("n", "ma", require("harpoon.mark").add_file)
            map("n", "ms", ":Telescope harpoon marks<CR>")
        end,
    },
    {
        "phaazon/hop.nvim",
        mapping = function()
            map("n", "<leader>w", "<cmd>HopWord<CR>")
            map("n", "<leader>l", "<cmd>HopLine<CR>")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        mapping = function()
            map("n", "<TAB>", ":BufferLineCycleNext<CR>")
            map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>")
        end,
    },
    {
        "weilbith/nvim-code-action-menu",
        mapping = function()
            map("n", "<leader>a", ":CodeActionMenu<CR>")
        end,
    },
    {
        "voldikss/vim-translator",
        mapping = function()
            map("", "s", ":TranslateW <CR>")
        end,
    },
    {
        "klen/nvim-test",
        mapping = function()
            map("n", "ts", ":TestSuite<CR>")
        end,
    },
    {
        "ellisonleao/glow.nvim",
        mapping = function()
            map("n", "<leader>p", ":Glow<CR>")
        end,
    },
    {
        "folke/trouble.nvim",
        mapping = function()
            map("n", "tt", ":TroubleToggle<CR>")
            map("n", "td", ":TodoTelescope<CR>")
        end,
    },
}
for _, item in ipairs(plugins) do
    for name, func in pairs(item) do
        if name == "mapping" then
            func()
        end
    end
end
