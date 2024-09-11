return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                themable = true,
                numbers = 'buffer_id',
                always_show_bufferline = false,
                show_buffer_icons = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = " [File Browser]",
                        text_align = "left",
                        separator = false,
                    }
                },
            },
            highlights = {
                buffer_selected = {
                    bold = false,
                    italic = false,
                },
                buffer_visible = {
                    bold = false,
                    italic = false,
                },
                numbers_selected = {
                    bold = false,
                    italic = false,
                },
                numbers_visible = {
                    bold = false,
                    italic = false,
                },
                fill = {
                    bg = '#24273a',
                },
            },
        })
    end,
}
