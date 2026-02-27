return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.icons").setup({})
      -- require("mini.statusline").setup({})
      -- require("mini.git").setup({})
      -- require("mini.diff").setup({})
      require("mini.surround").setup({
        add = 'sa',            -- Add surrounding in Normal and Visual modes
        deleute = 'sd',        -- Delete surrounding
        find = 'sf',           -- Find surrounding (to the right)
        find_left = 'sF',      -- Find surrounding (to the left)
        highlight = 'sh',      -- Highlight surrounding
        replace = 'sr',        -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`

        suffix_last = 'l',     -- Suffix to search with "prev" method
        suffix_next = 'n',     -- Suffix to search with "next" method
      })
    end,
  },
}
