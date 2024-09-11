-- Main configuration for editor options and custom commands

local set = vim.opt

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
    callback = function()
        vim.cmd("lcd %:p:h")
    end
})

-- Map Command: use w!! to write file with sudo
vim.cmd([[cnoremap w!! w !sudo tee % >/dev/null]])

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
