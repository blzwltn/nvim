return {
  "nvim-mini/mini.nvim",
  config = function()
    require("mini.ai").setup({ n_lines = 500 })
    -- require("mini.animate").setup()
    require("mini.comment").setup()
    -- require("mini.completion").setup({
    --   lsp_completion = {
    --     source_func = 'omnifunc'
    --   }
    -- })
    require("mini.diff").setup({})
    require("mini.git").setup({})
    require("mini.icons").setup({ style = 'ascii' })
    require("mini.indentscope").setup()
    require("mini.notify").setup()
    require("mini.pairs").setup()
    require("mini.snippets").setup()
    require("mini.statusline").setup({ use_icons = false })
    require("mini.surround").setup()
    require("mini.trailspace").setup()
  end,
}
