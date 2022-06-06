local packer = require("core.bootstrap").bootstrap_packer()
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
                        example_gtd = "/tmp/example_workspaces/gtd",
                     },
                  },
               },
               ["core.gtd.base"] = { config = { workspace = "example_gtd" } },
               ["core.norg.concealer"] = {},
               ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
            },
         }
      end,
      requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
   },
   { "xiyaowong/nvim-transparent" },
   {
      "kyazdani42/nvim-tree.lua",
      requires = {
         "kyazdani42/nvim-web-devicons", -- optional, for file icon
      },
      config = function()
         require("nvim-tree").setup {}
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
         vim.keymap.set("n", "<F2>", ":RunCode<CR>", { noremap = true, silent = false })
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
      config = [[require('jak.setup.cmp')]],
   },

   -- TODO
   { "simrat39/rust-tools.nvim", config = [[require('rust-tools').setup({})]] },

   { "windwp/nvim-autopairs", config = [[require('nvim-autopairs').setup({ map_cr = true })]] },

   { "mbbill/undotree" },
   {
      "mhartington/formatter.nvim",
      config = [[require('jak.setup.formatter')]],
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
      end,
   },
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
   -- { "ThePrimeagen/harpoon" },
   {
      "simrat39/symbols-outline.nvim",
      config = [[require('jak.setup.symbols-outline')]],
   },

   {
      "p00f/nvim-ts-rainbow",
      config = [[require('jak.setup.nvim-ts-rainbow')]],
      requires = { "nvim-treesitter/nvim-treesitter" },
   },
   {
      "lukas-reineke/indent-blankline.nvim",
      config = [[require("jak.setup.indent")]],
   },
   {
      "terrortylor/nvim-comment",
      config = [[require("nvim_comment").setup({line_mapping = "<leader>c", operator_mapping = "<leader>c"})]],
   },
   {
      "norcalli/nvim-colorizer.lua",
      config = [[require('colorizer').setup()]],
   },
   {
      "goolord/alpha-nvim",
      config = function()
         require "jak.setup.alpha"
      end,
   },
   {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      config = [[require("jak.setup.markdown-preview")]],
      ft = "markdown",
   },
   { "nkrkv/nvim-treesitter-rescript" },
   {
      "nvim-treesitter/nvim-treesitter",
      before = "neorg",
      run = ":TSUpdate",
      config = [[require("jak.setup.treesitter")]],
   },
   {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
         require("gitsigns").setup {
            signs = {
               add = { hl = "DiffAdd", text = "+", numhl = "GitSignsAddNr" },
               change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
               delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
               topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
               changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
            },
         }
      end,
   },
   { "phaazon/hop.nvim", config = [[require("hop").setup()]] },
   -- { "karb94/neoscroll.nvim", config = [[require('neoscroll').setup()]] },
   { "akinsho/toggleterm.nvim", config = [[require("jak.setup.toggleterm")]] },
   { "rcarriga/nvim-notify" },
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
      config = [[require("bufferline").setup()]],
   },
   -- TODO
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
   },
   {
      "voldikss/vim-translator",
      config = function()
         require "jak.setup.translator"
      end,
   },
   { "gcmt/wildfire.vim" },
   { "stevearc/dressing.nvim" },
   {
      "klen/nvim-test",
      config = function()
         require("nvim-test").setup()
      end,
   },
   {
      "ray-x/lsp_signature.nvim",
      config = function() end,
   },
   { "NvChad/extensions" },
   { "ellisonleao/glow.nvim" },
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
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
         }
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
      "anuvyklack/pretty-fold.nvim",
      requires = "anuvyklack/nvim-keymap-amend",
      config = function()
         require("pretty-fold").setup()
         require("pretty-fold.preview").setup()
      end,
   },
}
return packer.startup(function(use)
   for _, v in ipairs(plugins) do
      use(v)
   end
end)
