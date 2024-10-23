-- Depends on system package: Universal Ctags
return {
    "ludovicchabant/vim-gutentags",

    {
        "preservim/tagbar",
        cmd = "TagbarToggle",
        config = function()
        end,
    },

    {
        "liuchengxu/vista.vim",
        cmd = "Vista",
        config = function()
            vim.g.vista_default_executive = 'ctags'
        end,
    }
}
