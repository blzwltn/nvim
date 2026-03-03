return {
  "rebelot/kanagawa.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('kanagawa').setup()
    -- vim.cmd.colorscheme('kanagawa-wave')
    vim.cmd.colorscheme('kanagawa-dragon')
    -- vim.cmd.colorscheme('kanagawa-lotus')
  end
}
