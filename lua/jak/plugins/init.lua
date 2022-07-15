local packer = require("jak.core.bootstrap").bootstrap_packer()
local plugins = {
    { "wbthomason/packer.nvim" },
    { "nathom/filetype.nvim" },
    { "tpope/vim-surround" },
    { "tpope/vim-eunuch" },
    { "lewis6991/impatient.nvim" },
    -- TODO:
    {
        "nvim-neorg/neorg",
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.norg.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                    ["core.gtd.base"] = { config = { workspace = "notes" } },
                    ["core.norg.concealer"] = {},
                    ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
                    ["core.norg.journal"] = { config = { workspace = "notes" } },
                    ["core.norg.qol.toc"] = {},
                    ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
                    ["core.export.markdown"] = {},
                    ["core.export"] = {},
                    ["external.kanban"] = {},
                },
            }
            vim.keymap.set("n", "\\", ":NeorgStart<CR>")
        end,
        requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    },
    { "max397574/neorg-kanban" },
    { "xiyaowong/nvim-transparent" },
    {
        "ms-jpq/chadtree",
        branch = "chad",
        run = "python3 -m chadtree deps",
        config = function()
            vim.keymap.set("n", "<leader>e", ":CHADopen<CR>")
        end,
    },
    {
        "feline-nvim/feline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require "jak.setup.statusline"
        end,
    },
    {
        "CRAG666/code_runner.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("code_runner").setup {
                filetype = {
                    python = "python3 -u",
                    typescript = "deno run",
                    rust = "cargo run",
                },
            }
            vim.keymap.set("n", "<F1>", ":RunCode<CR>", { silent = false })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "jak.setup.lspconfig"
        end,
    },

    -- {
    --    "williamboman/nvim-lsp-installer",
    --    requires = {
    --       "neovim/nvim-lspconfig",
    --    },
    --    config = function()
    --       require "jak.setup.nvim-lsp-installer"
    --    end,
    -- },

    {
        "hrsh7th/nvim-cmp",
        requires = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-cmdline",
            "Saecki/crates.nvim",
            "f3fora/cmp-spell",
            "L3MON4D3/LuaSnip",
            -- "zbirenbaum/copilot-cmp",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require "jak.setup.cmp"
        end,
    },

    -- TODO:
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust-tools").setup {}
            vim.keymap.set("n", "<leader>rr", require("rust-tools.runnables").runnables)
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup { map_cr = true }
        end,
    },

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
        end,
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            require "jak.setup.formatter"
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "benfowler/telescope-luasnip.nvim",
            "xiyaowong/telescope-emoji.nvim",
            "AckslD/nvim-neoclip.lua",
            "ahmedkhalf/project.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "cljoly/telescope-repo.nvim",
            "LinArcX/telescope-env.nvim",
            "olacin/telescope-gitmoji.nvim",
            "LinArcX/telescope-ports.nvim",
        },
        config = function()
            require "jak.setup.telescope"
            vim.keymap.set("n", "<leader>ff", function()
                require("telescope.builtin").find_files {
                    require("telescope.themes").get_ivy {},
                    find_command = { "rg", "--hidden", "--glob", "!.git", "--files" },
                }
            end)
            vim.keymap.set("n", "<leader>fs", function()
                require("telescope.builtin").live_grep {
                    require("telescope.themes").get_ivy {},
                    find_command = { "rg", "--hidden", "--glob", "!.git", "--files" },
                }
            end)
            vim.keymap.set("n", "<leader><leader>", ":Telescope help_tags<CR>")
            vim.keymap.set("n", "<leader>p", ":Telescope projects<CR>")
            vim.keymap.set("n", "<leader>n", ":Telescope neoclip<CR>")
            vim.keymap.set("n", "<leader>j", ":Telescope emoji<CR>")
            vim.keymap.set("n", "<leader>,", ":Telescope file_browser<CR>")
        end,
    },
    -- TODO: try this
    {
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("octo").setup()
        end,
    },
    {
        "ThePrimeagen/harpoon",
        requires = "nvim-telescope/telescope.nvim",
        config = function()
            vim.keymap.set("n", "ma", require("harpoon.mark").add_file)
            vim.keymap.set("n", "ms", ":Telescope harpoon marks<CR>")
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require "jak.setup.symbols-outline"
        end,
    },

    {
        "p00f/nvim-ts-rainbow",
        config = function()
            require "jak.setup.nvim-ts-rainbow"
        end,
        requires = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "jak.setup.indent"
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup {
                toggler = {
                    line = "<leader>cc",
                    block = "<leader>cc",
                },
                opleader = {
                    line = "<leader>c",
                    block = "<leader>c",
                },
                extra = {
                    above = "<leader>cO",
                    below = "<leader>co",
                    eol = "<leader>cA",
                },
            }
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require "jak.setup.alpha"
        end,
    },
    { "nkrkv/nvim-treesitter-rescript" },
    {
        "nvim-treesitter/nvim-treesitter",
        before = "neorg",
        run = ":TSUpdate",
        config = function()
            require "jak.setup.treesitter"
        end,
    },
    --TODO: git scm
    {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup {
                signs = {
                    add = { hl = "DiffAdd", text = "🍰", numhl = "GitSignsAddNr" },
                    change = { hl = "DiffChange", text = "🌸", numhl = "GitSignsChangeNr" },
                    delete = { hl = "DiffDelete", text = "📛", numhl = "GitSignsDeleteNr" },
                    topdelete = { hl = "DiffDelete", text = "💥", numhl = "GitSignsDeleteNr" },
                    changedelete = { hl = "DiffChangeDelete", text = "🎈", numhl = "GitSignsChangeNr" },
                },
            }
        end,
    },
    --TODO: how about leap
    {
        "phaazon/hop.nvim",
        config = function()
            vim.keymap.set("n", "<leader>w", "<cmd>HopWord<CR>")
            vim.keymap.set("n", "<leader>l", "<cmd>HopLine<CR>")
            require("hop").setup()
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require "jak.setup.toggleterm"
        end,
    },
    --TODO: how about working with neorg?
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup {
                background_colour = "#000000",
            }
        end,
    },
    { "antoinemadec/FixCursorHold.nvim" },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
    },
    {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>")
            vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>")
            require("bufferline").setup()
        end,
    },
    -- TODO:
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require "jak.setup.crates"
        end,
    },
    {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
        config = function()
            vim.keymap.set("n", "<leader>a", ":CodeActionMenu<CR>")
        end,
    },
    {
        "voldikss/vim-translator",
        config = function()
            vim.keymap.set("", "s", ":TranslateW <CR>")
            require "jak.setup.translator"
        end,
    },
    { "gcmt/wildfire.vim" },
    -- { "stevearc/dressing.nvim" },
    {
        "klen/nvim-test",
        config = function()
            require("nvim-test").setup()
            vim.keymap.set("n", "ts", ":TestSuite<CR>")
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function() end,
    },
    {
        "ellisonleao/glow.nvim",
        ft = "markdown",
        config = function()
            vim.keymap.set("n", "<leader>p", ":Glow<CR>", { silent = true })
        end,
    },
    -- {
    --    "zbirenbaum/copilot.lua",
    --    event = "InsertEnter",
    --    config = function()
    --       vim.schedule(function()
    --          require("copilot").setup()
    --       end)
    --    end,
    -- },
    {
        "folke/trouble.nvim",
        requires = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
        config = function()
            require("trouble").setup {}
            vim.keymap.set("n", "tt", ":TroubleToggle<CR>")
            vim.keymap.set("n", "td", ":TodoTelescope<CR>")
        end,
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require "jak.setup.todo-comments"
        end,
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end,
    },
    {
        "anuvyklack/pretty-fold.nvim",
        requires = "anuvyklack/nvim-keymap-amend",
        config = function()
            require("pretty-fold").setup()
            require("pretty-fold.preview").setup()
        end,
    },
    -- WARNING: no ready to use
    {
        "mfussenegger/nvim-dap",
        config = function()
            require "jak.setup.dap"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup()
        end,
    },
    { "michaelb/sniprun", run = "bash ./install.sh" },
    {
        "nvim-orgmode/orgmode",
        config = function()
            require("orgmode").setup_ts_grammar()
            require("orgmode").setup()
        end,
    },
    { "elkowar/yuck.vim" },
    {
        "RRethy/vim-illuminate",
        config = function()
            vim.api.nvim_set_keymap(
                "n",
                "<a-n>",
                '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<a-p>",
                '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
                { noremap = true }
            )
        end,
    },
}
packer.startup(function(use)
    for _, v in ipairs(plugins) do
        use(v)
    end
end)
--[[ require "jak.plugins.mappings" ]]
