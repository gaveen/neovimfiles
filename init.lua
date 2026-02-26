local set = vim.opt
local let = vim.g
local map = vim.keymap.set
local nr  = { noremap = true }
local nrs = { noremap = true, silent = true }

-- Set basic instructions
set.modelines = 0                           -- avoid using modelines

-- Set up non-printable info for UI purposes
set.title = true                            -- update window title
set.scrolloff = 1                           -- show more lines around cursor
set.list = true                             -- show non-print characters
set.listchars = "tab:<->,trail:_,nbsp:+"    -- set characters used for 'list'
set.number = true                           -- show line numbers
set.relativenumber = true                   -- use relative line numbers
set.cursorline = true                       -- highlight the cursor line
set.wildmode = "longest:full"               -- set command-line completion mode
-- set.colorcolumn = "81"                      -- highlight a column

-- Set search pattern case sensitivity
set.ignorecase = true                       -- lower case: case insensitive
set.smartcase = true                        -- mixed case: case sensitive

-- Set how tab character behaves
set.tabstop = 4                             -- spaces to use as tab (file)
set.softtabstop = 4                         -- spaces to use as tab (editing)
set.shiftwidth = 4                          -- spaces to use for autoindent
set.expandtab = true                        -- expand tabs into spaces

-- Set different tab settings for different file types
local function set_tab_settings(tabstop, shiftwidth, expandtab)
    vim.bo.tabstop = tabstop
    vim.bo.softtabstop = tabstop
    vim.bo.shiftwidth = shiftwidth
    vim.bo.expandtab = expandtab
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "ruby", "javascript", "typescript" },
    callback = function()
        set_tab_settings(2, 2, true)  -- Ruby, JS, and TS prefer 2 spaces
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    callback = function()
        set_tab_settings(4, 4, false)  -- Go prefers tabs (noexpandtab)
    end
})

-- Jump to the last cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local last_pos = vim.fn.line([['"]])
        if last_pos > 0 and last_pos <= vim.fn.line("$") then
            vim.cmd("normal! g'\"")
        end
    end
})

-- Switch to the working directory of the open file
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.buftype ~= "terminal" then
            vim.cmd("lcd %:p:h")
        end
    end
})

-- Custom Command: see unsaved changes (in current buffer) as a diff
vim.api.nvim_create_user_command('DiffOrig', function()
    -- get current filetype
    local filetype = vim.bo.filetype
    -- start diff mode on current buffer
    vim.cmd('diffthis')
    -- open new vertical split, read last saved file, and remove first empty line
    vim.cmd('vnew | r # | normal! 1Gdd')
    -- start diff mode on new buffer
    vim.cmd('diffthis')
    -- set local buffer options
    vim.opt_local.buftype = "nofile"
    vim.opt_local.bufhidden = "wipe"
    vim.opt_local.buflisted = false
    vim.opt_local.swapfile = false
    vim.opt_local.readonly = true
    vim.opt_local.filetype = filetype
    -- move to the next change
    vim.cmd('normal! ]c')
end, {})

-- Map Leader and Local Leader keys
map("n", " ", "", { noremap = true, })
let.mapleader = " "
let.maplocalleader = ","

-- Shortcut to invoke DiffOrig
map("n", "<leader>,", ":DiffOrig<CR>", nrs)

-- Buffer operations: goto, list, next, previous, and close
map("n", "<leader>bg", ":b ", nr)
map("n", "<leader>bl", ":ls<CR>", nrs)
map("n", "<leader>bn", ":bn<CR>", nrs)
map("n", "<leader>bp", ":bp<CR>", nrs)
map("n", "<leader>bd", ":bp <BAR> bd #<CR>", nrs)

-- Use tab key to match pairs
map("n", "<tab>", "%", nr)
map("v", "<tab>", "%", nr)

-- Use <leader>y, x and p as shortcuts for external copy, cut and paste
map("n", "<leader>y", '"+y', nr)
map("v", "<leader>y", '"+y', nr)
map("n", "<leader>x", '"+x', nr)
map("v", "<leader>x", '"+x', nr)
map("n", "<leader>p", '"+p', nr)
map("v", "<leader>p", '"+p', nr)

-- Soft (only in view) text manipulations
-- -- select the last pasted text
map("n", "<leader>v", "`[v`]", nr)
-- -- clear the current highlighted search pattern
map("n", "<leader>/", ":noh<CR>", nrs)
-- -- toggle soft-wrap (fit text into window)
map("n", "<leader>j=", ":set wrap! wrap?<CR>", nrs)
-- -- toggle highlighting misspelled words
map("n", "<F4>", ":setlocal spell! spelllang=en_us<CR>", nrs)

-- Hard text manipulations
-- -- remove all trailing whitespace characters in current file
map("n", "<leader>W", ":%s/\\s\\+$//<CR>:let @/=''<CR>", nrs)
-- -- hard-wrap current paragraph at value set for 'textwidth'
map("n", "<leader>gq", "gwap", nr)
-- -- hard un-wrap current paragraph
map("n", "<leader>J", "vipJ", nr)


-- Import plugin manager & plugins
require("config.lazy")


-- Manually assign custom keymaps for plugins
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
map("n", "<F5>", ":Twilight<CR>", nr)                   -- toggle twilight

-- Plugin: nvim-treesitter/nvim-treesitter
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },                                  -- syntax highlighting
    callback = function() pcall(vim.treesitter.start) end,
})
