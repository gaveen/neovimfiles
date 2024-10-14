return {
    "neovim/nvim-lspconfig",
    config = function()

        local lspconfig = require'lspconfig'

        -- for Deno
        lspconfig.denols.setup {
          on_attach = on_attach,
          root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        }

        -- for TypeScript
        lspconfig.ts_ls.setup {
          on_attach = on_attach,
          root_dir = lspconfig.util.root_pattern("package.json"),
          single_file_support = false
        }

        -- for Rust: rust_analyzer config when not using rustaceanvim
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
