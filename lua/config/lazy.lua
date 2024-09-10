-- Configure Plugin Manager: lazy.nvim
-- Reference: https://lazy.folke.io/installation

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Note: leader keys should be mapped before lazy.nvim is loaded.
--       They are defined in 'options' and imported in 'init.lua' before 'lazy'.
require("lazy").setup({
    spec = {
        -- import plugin specs from the directory: nvim/lua/plugins
        { import = "plugins" },
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
