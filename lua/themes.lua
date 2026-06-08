-- ========================================================================== --
-- QUICK CHANGE: CHANGE ACTIVE THEME HERE
-- ========================================================================== --
local active_theme = "oasis" 
-- Options: "oasis", "mfd", "modus", "silentium", "techbase", 
--          "tinted", "kanagawa", "onedark", "lackluster", "gruvbox"

local themes = {
  oasis = function()
    require("oasis").setup({ use_legacy_comments = true, transparent = true })
    vim.cmd.colorscheme("oasis-cactus")
  end,

  mfd = function()
    require("mfd").setup({ bright_comments = true })
    vim.cmd.colorscheme("mfd-mono")
  end,

  modus = function()
    require("modus-themes").setup({ transparent = true })
    vim.cmd.colorscheme("modus")
  end,

  silentium = function()
    require("silentium").setup({ accent = "#008080" })
    vim.cmd.colorscheme("silentium")
  end,

  techbase = function()
    vim.cmd.colorscheme("techbase")
  end,

  tinted = function()
    vim.cmd.colorscheme("base24-builtin-dark")
  end,

  kanagawa = function()
    require("kanagawa").setup()
    vim.cmd.colorscheme("kanagawa-dragon")
  end,

  onedark = function()
    require("onedark").setup({ style = "darker" })
    require("onedark").load()
  end,

  lackluster = function()
    local lackluster = require("lackluster")
    require("nvim-web-devicons").setup({
      color_icons = false,
      overide = {
        ["default_icon"] = { color = lackluster.color.gray4, name = "Default" }
      }
    })
    vim.cmd.colorscheme("lackluster-hack")
  end,

  gruvbox = function()
    vim.g.gruvbox_material_background = "soft"
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_cursor = "auto"
    vim.g.gruvbox_material_transparent_background = 0
    vim.g.gruvbox_material_visual = "reverse"
    vim.cmd.colorscheme("gruvbox-material")
  end
}

-- Safe-guard execution layer
if themes[active_theme] then
  pcall(themes[active_theme])
else
  vim.notify("Theme '" .. active_theme .. "' not configured in themes.lua", vim.log.levels.WARN)
end
