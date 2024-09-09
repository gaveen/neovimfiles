local let = vim.g
local map = vim.keymap.set
local nr  = { noremap = true }
local nrs = { noremap = true, silent = true }

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
