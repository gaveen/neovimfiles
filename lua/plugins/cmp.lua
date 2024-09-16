return {
    -- Plugin definitions for nvim-cmp and related plugins
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "petertriho/cmp-git",

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require'cmp'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users
                    end,
                },
                window = {
                    -- bordered windows
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                })
            })

            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' },
                }, {
                    { name = 'buffer' },
                })
            })

            -- for cmp-git
            require("cmp_git").setup()

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- set up rust_analyzer when not using rustaceanvim
            -- require('lspconfig')['rust_analyzer'].setup {
            --     capabilities = capabilities,
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
            -- }
        end,
    }
}
