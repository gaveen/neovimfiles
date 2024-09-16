return {
    "neovim/nvim-lspconfig",
    config = function()

        local lspconfig = require'lspconfig'

        local on_attach = function(client)
            require'completion'.on_attach(client)
        end
        -- rust_analyzer config when not using rustaceanvim
        -- lspconfig.rust_analyzer.setup({
        --     on_attach = on_attach,
        --     settings = {
        --         ["rust-analyzer"] = {
        --             imports = {
        --                 granularity = {
        --                     group = "module",
        --                 },
        --                 prefix = "self",
        --             },
        --             cargo = {
        --                 buildScripts = {
        --                     enable = true,
        --                 },
        --             },
        --             procMacro = {
        --                 enable = true,
        --             },
        --         },
        --     },
        -- })
    end,
    opts = {
        setup = {
          rust_analyzer = function()
            return true
          end,
        },
    },
}
