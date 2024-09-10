-- Main neovim configuration file

require("config.options")                   -- import main config
require("keymaps.main")                     -- import main keymaps
require("config.lazy")                      -- import plugin manager & plugins
require("keymaps.plugins")                  -- import custom keymaps for plugins
require("config.colorschemes.catppuccin")   -- set colorscheme and import config
