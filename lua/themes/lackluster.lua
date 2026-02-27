return {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    local lackluster = require("lackluster")
    require('nvim-web-devicons').setup({
      color_icons = false,
      overide = {
        ["default_icon"] = {
          color = lackluster.color.gray4,
          name = "Default",
        }
      }
    })
    -- vim.cmd.colorscheme("lackluster")
    vim.cmd.colorscheme("lackluster-hack")   -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
  end,
}
