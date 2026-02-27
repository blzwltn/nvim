return {
  {
    "leath-dub/snipe.nvim",
    keys = {
      { "<leader>hh", function() require("snipe").open_buffer_menu() end },
    },
    opts = {},
    config = function()
      require("snipe").setup({
        ui = {
          position = "center"
        },
      })
    end
  },
  {
    "kungfusheep/snipe-lsp.nvim",
    event = "VeryLazy",
    dependencies = "leath-dub/snipe.nvim",
    opts = {},
    config = function()
      require("snipe-lsp").setup({
        keymap = {
          open_symbols_menu = '<leader>hs'
        }
      })
    end
  }
}
