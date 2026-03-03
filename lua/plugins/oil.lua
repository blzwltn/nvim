return {
  "stevearc/oil.nvim",
  opts = {
    columns = { "permissions", "size", "mtime", "icon" },
    skip_confirm_for_simple_edits = false,
    view_options = { show_hidden = true }
  },
  dependencies = { "nvim-mini/mini.icons", opts = { style = 'ascii' } },
  lazy = false,

  vim.keymap.set("n", "<leader>oo", "<CMD>Oil<CR>", { desc = "Parent Dir" }),
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Parent Dir" }),
  vim.keymap.set("n", "<leader>of", "<CMD>Oil --float<CR>", { desc = "Floating Window" })
}
