return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.config", -- Sets main module to use for opts
  lazy = false,
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "bash",
        "diff",
        "go",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "rust",
        "vim",
        "vimdoc",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
  vim.keymap.set("n", "<leader>lR", require("telescope.builtin").lsp_references, { desc = "Goto References" }),
  vim.keymap.set("n", "<leader>li", require("telescope.builtin").lsp_implementations, { desc = "Goto Implementation" }),
  vim.keymap.set("n", "<leader>ld", require("telescope.builtin").lsp_definitions, { desc = "Goto Definition" }),
  vim.keymap.set("n", "<leader>ls", require("telescope.builtin").lsp_document_symbols, { desc = "Open Document Symbols" }),
  vim.keymap.set("n", "<leader>lW", require("telescope.builtin").lsp_dynamic_workspace_symbols,
    { desc = "Open Workspace Symbols" }),
  vim.keymap.set("n", "<leader>lt", require("telescope.builtin").lsp_type_definitions, { desc = "Goto Type Definition" }),
}
