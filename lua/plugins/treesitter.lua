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
  end
}
