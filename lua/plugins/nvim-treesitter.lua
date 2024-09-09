local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = {
            "bash",
            "c",
            "css",
            "dockerfile",
            "gitignore",
            "html",
            "javascript",
            "json",
            "latex",
            "lua",
            "luadoc",
            "markdown",
            "python",
            "ruby",
            "rust",
            "sql",
            "svelte",
            "toml",
            "tsx",
            "typescript",
            "vala",
            "vim",
            "vimdoc",
            "yaml",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
      })
    end,
}

return { M }
