return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = false,
    ensure_installed = {
      -- Go
      "gopls",
      -- rust
      "bacon_ls",
      "rust_analyzer",
      -- lua
      "lua_ls",
      -- python
      "pyright",
    }
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
