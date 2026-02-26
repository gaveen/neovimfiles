return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
        local bufferline = require('bufferline')
        bufferline.setup {
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
        }
    end,
}
