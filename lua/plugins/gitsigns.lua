return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      delete = { text = "󰍵" },
      changedelete = { text = "󱕖" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function opts(desc)
        return { buffer = bufnr, desc = desc }
      end

      local map = vim.keymap.set

      -- Key mappings for gitsigns
      map("n", "<leader>hr", gs.reset_hunk, opts "Reset Hunk")
      map("n", "<leader>hp", gs.preview_hunk, opts "Preview Hunk")
      map("n", "<leader>hb", gs.blame_line, opts "Blame Line")
    end,
  },
}
