return {
    "neovim/nvim-lspconfig",
    config = function()
        -- for OpenTofu (Terraform)
        vim.lsp.config['tofu_ls'] = {
          cmd = { 'tofu-ls', 'serve' },
          -- Base filetypes
          filetypes = { 'terraform', 'terraform-vars' },
          root_markers = {'.terraform', '.git'},
        }
        vim.lsp.enable('tofu_ls')

        -- for Deno
        vim.lsp.config('denols', {
            on_attach = on_attach,
            root_markers = {"deno.json", "deno.jsonc"},
        })

        -- for TypeScript
        vim.lsp.config('ts_ls', {
            on_attach = on_attach,
            root_markers = {"package.json"},
            single_file_support = false,
        })

        -- for Rust: rust_analyzer config when not using rustaceanvim
        --vim.lsp.config('rust_analyzer', {
        --    on_attach = on_attach,
        --    settings = {
        --        ["rust-analyzer"] = {
        --            imports = {
        --                granularity = {
        --                    group = "module",
        --                },
        --                prefix = "self",
        --            },
        --            cargo = {
        --                buildScripts = {
        --                    enable = true,
        --                },
        --            },
        --            procMacro = {
        --                enable = true,
        --            },
        --        },
        --    },
        --})
    end,
    opts = {
        setup = {
          rust_analyzer = function()
            return true
          end,
        },
    },
}
