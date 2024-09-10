return {
    "neovim/nvim-lspconfig",
    config = function()

        -- use mason-lspconfig handlers to prevent rust_analyzer from being set up
        -- rust_analyzer is currently handled by: rustaceanvim
        -- require('mason-lspconfig').setup_handlers {
          -- ['rust_analyzer'] = function() end,  -- disable rust_analyzer setup
        -- }

        local lspconfig = require'lspconfig'

        local on_attach = function(client)
            require'completion'.on_attach(client)
        end

        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    procMacro = {
                        enable = true,
                    },
                },
            },
        })
    end,
}
