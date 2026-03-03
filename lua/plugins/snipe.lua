return {
  "leath-dub/snipe.nvim",
  keys = {
    { "<leader>hh", function() require("snipe").open_buffer_menu() end },
  },
  opts = { ui = { position = "center" } },
  config = function()
    require("snipe").setup({})
  end
}
