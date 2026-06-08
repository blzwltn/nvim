-- Register all source repositories via Native Packages System
vim.pack.add({
  -- Core Ecosystem Tools
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- Required for lackluster logic

  -- Theme Repositories Catalog
  { src = "https://github.com/uhs-robert/oasis.nvim" },
  { src = "https://github.com/kungfusheep/mfd.nvim" },
  { src = "https://github.com/miikanissi/modus-themes.nvim" },
  { src = "https://github.com/silentium-theme/silentium.nvim" },
  { src = "https://github.com/mcauley-penney/techbase.nvim" },
  { src = "https://github.com/tinted-theming/tinted-vim" },
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/navarasu/onedark.nvim" },
  { src = "https://github.com/slugbyte/lackluster.nvim" },
  { src = "https://github.com/sainnhe/gruvbox-material" },

  -- Functionality Plugins
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/leath-dub/snipe.nvim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/johnpmitsch/vai.nvim" },
  { src = "https://github.com/NMAC427/guess-indent.nvim" },
})

-- Initialize Core Tooling Layouts
require("mason").setup()
require("mason-lspconfig").setup({
  -- Automatically install these languages if they aren't on the machine yet!
  ensure_installed = { "lua_ls", "gopls", "rust_analyzer", "clangd", "pyright" }
})
require("guess-indent").setup()
require("vai").setup()

-- Mini Suite Setup
require("mini.ai").setup({ n_lines = 500 })
require("mini.comment").setup()
require("mini.diff").setup({})
require("mini.git").setup({})
require("mini.icons").setup({ style = "ascii" })
require("mini.indentscope").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.snippets").setup()
require("mini.statusline").setup({
  use_icons = false,
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ strings = { __ = 'IDE' } })
      local git           = MiniStatusline.section_git({})
      local diff          = MiniStatusline.section_diff({})
      local diagnostics   = MiniStatusline.section_diagnostics({})
      local filename      = MiniStatusline.section_filename({})
      local location      = MiniStatusline.section_location({})

      -- Extract native LSP status string
      local lsp_status    = ""
      if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
        lsp_status = "[LSP Active]"
      end

      return MiniStatusline.combine_groups({
        { hl = mode_hl,                 strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, diff } },
        '%<', -- Truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- Right align split
        { hl = 'MiniStatuslineFileinfo', strings = { lsp_status, diagnostics } },
        { hl = mode_hl,                  strings = { location } },
      })
    end
  }
})
require("mini.surround").setup()
require("mini.trailspace").setup()

-- Oil Config
require("oil").setup({
  columns = { "permissions", "size", "mtime", "icon" },
  skip_confirm_for_simple_edits = false,
  view_options = { show_hidden = true },
})

-- Snipe Config
require("snipe").setup({ ui = { position = "center" } })

-- Which-Key Setup
require("which-key").setup({
  delay = 0,
  preset = "helix",
  icons = {
    mappings = vim.g.have_nerd_font,
    keys = vim.g.have_nerd_font and {} or { Up = "<Up> ", Down = "<Down> ", Left = "<Left> ", Right = "<Right> " },
  },
  spec = {
    { "<leader>e", group = "Explore" },
    { "<leader>f", group = "Files" },
    { "<leader>l", group = "Code" },
    { "<leader>o", group = "oil" },
    { "<leader>S", group = "Split" },
    { "<leader>t", group = "Terminal" },
    { "<leader>w", group = "Write" },
  },
})

-- ToggleTerm Config
require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]],
  direction = "float",
  float_opts = { border = "curved" },
})
