return {
  "neovim/nvim-lspconfig",
  -- Go
  vim.lsp.enable("gopls"),
  -- rust
  vim.lsp.enable("bacon_ls"),
  vim.lsp.enable("rust_analyzer"),
  -- lua
  vim.lsp.enable("lua_ls"),
  -- python
  vim.lsp.enable("pyright"),

  vim.diagnostic.config({
    virtual_text = {
      prefix = '●',
      spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false, -- Don't update diagnostics while typing
    severity_sort = true,     -- Sort diagnostics by severity (Errors first)
  }),


  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" }),
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Goto Code Action" }),
}
