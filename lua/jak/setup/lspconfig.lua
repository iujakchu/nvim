local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
    sumneko_lua = {
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        "vim",
                        "s",
                        "sn",
                        "t",
                        "i",
                        "f",
                        "c",
                        "d",
                        "l",
                        "isn",
                        "dl",
                        "rep",
                        "rp",
                        "types",
                        "events",
                        "util",
                        "fmt",
                        "fmta",
                        "ls",
                        "ins_generate",
                        "m",
                        "n",
                        "parse",
                        "ai",
                    },
                },
            },
        },
    },
    -- rust_analyzer = {
    --    capabilities = capabilities,
    --    settings = {
    --       ["rust-analyzer"] = {
    --          -- cargo = { loadOutDirsFromCheck = true },
    --          -- procMacro = { enable = true },
    --          -- hoverActions = { references = true },
    --          -- checkOnSave = {
    --          --    command = "clippy",
    --          -- },
    --          -- inlayHints = {
    --          --    parameterHints = true,
    --          --    closureReturnTypes = true,
    --          -- },
    --       },
    --    },
    -- },
    pyright = { capabilities = capabilities },
    clangd = { capabilities = capabilities },
    denols = { capabilities = capabilities },
    slint_lsp = { capabilities = capabilities },
    bashls = { capabilities = capabilities },
    hls = { capabilities = capabilities },
    rnix = { capabilities = capabilities },
    cmake = { capabilities = capabilities },
}
for client, setup in pairs(servers) do
    require("lspconfig")[client].setup(setup)
end
