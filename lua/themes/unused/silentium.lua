return {
  "silentium-theme/silentium.nvim",
  config = function()
    local silentium = require("silentium")
    silentium.setup({ accent = "#008080" })
    vim.cmd.colorscheme("silentium")
  end
}
