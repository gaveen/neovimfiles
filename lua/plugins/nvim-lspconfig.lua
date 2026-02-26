return {
    "neovim/nvim-lspconfig",

    config = function()
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
    end,
}
