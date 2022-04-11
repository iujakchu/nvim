for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
   config.install_info.url = config.install_info.url:gsub("https://github.com/", vim.g.proxy)
end

require("nvim-treesitter.configs").setup {
   ensure_installed = {
      "rust",
      "javascript",
      "typescript",
      "markdown",
      "c",
      "cpp",
      "dart",
      "lua",
      "python",
      "yaml",
      "cpp",
      "norg",
   }, --
   sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
   ignore_install = { "" }, -- List of parsers to ignore installing
   autopairs = {
      enable = true,
   },
   highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
   },
   indent = { enable = true },
   context_commentstring = {
      enable = true,
      enable_autocmd = false,
   }, --
}
