return {
    "navarasu/onedark.nvim",
    lazy = false,
    -- make sure to load this before all the other start plugins
    priority = 1000,

    config = function()
        require('onedark').setup {
            style = 'deep'
        }
        require('onedark').load()
    end
}
