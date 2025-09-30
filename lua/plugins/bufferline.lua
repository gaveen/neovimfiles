return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    after = "catppuccin",   -- load after colorscheme
    config = function()
        local bufferline = require('bufferline')
        local macchiato = require("catppuccin.palettes").get_palette "macchiato"
        bufferline.setup({
            options = {
                themable = true,
                numbers = 'buffer_id',
                always_show_bufferline = false,
                show_buffer_icons = false,
                -- offset bufferline when nvim-tree is open
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = " [File Browser]",
                        text_align = "left",
                        separator = false,
                    }
                },
            },
            -- use highlights from colorscheme instead of manual config
            highlights = require("catppuccin.special.bufferline").get_theme() {
                styles = { "no_italic", "bold" },
            },
        })
    end,
}
