return {
    "catppuccin/nvim", name = "catppuccin", priority = 1000,
    opts = function()
        require("catppuccin").setup({
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                leap = true,
                markdown = true,
                mason = false,
                dap = true,
                dap_ui = true,
                which_key = false,
                telescope = {
                    enabled = true,
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            }
        })
    end,
}
