-- Manually assign custom keymaps for plugins

local map = vim.keymap.set
local nr  = { noremap = true }
local nrs = { noremap = true, silent = true }

-- Plugin: ggandor/leap.nvim
map("n", "<leader>s", "<Plug>(leap)")                   -- leap
map("n", "<leader>S", "<Plug>(leap-from-window)")       -- leap from window
map({"x", "o"}, "<leader>s", "<Plug>(leap-forward)")    -- [xo] leap forward
map({"x", "o"}, "<leader>S", "<Plug>(leap-backward)")   -- [xo] leap back

-- Plugin: nvim-tree/nvim-tree.lua
map("n", "<leader>d", ":NvimTreeToggle<CR>", nrs)       -- toggle nvim-tree

-- Plugin: nvim-telescope/telescope.nvim
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})          -- find files
map('n', '<leader>fg', builtin.live_grep, {})           -- live grep
map('n', '<leader>fb', builtin.buffers, {})             -- buffers
map('n', '<leader>fh', builtin.help_tags, {})           -- help taps

-- Plugin: folke/twilight.nvim
map("n", "<F3>", ":Twilight<CR>", nr)                   -- toggle twilight
