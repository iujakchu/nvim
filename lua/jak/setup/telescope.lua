local telescope = require "telescope"
telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules" },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
        },
    },
}
require("neoclip").setup()
require("project_nvim").setup {
    manual_mode = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
}
telescope.load_extension "emoji"
telescope.load_extension "neoclip"
telescope.load_extension "projects"
telescope.load_extension "file_browser"
telescope.load_extension "ui-select"
telescope.load_extension "luasnip"
telescope.load_extension "repo"
telescope.load_extension "env"
telescope.load_extension "gitmoji"
telescope.load_extension "ports"
telescope.load_extension "harpoon"
