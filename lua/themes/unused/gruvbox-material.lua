return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_background = 'soft'
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_cursor = 'auto'
    vim.g.gruvbox_material_transparent_background = 0
    vim.g.gruvbox_material_visual = 'reverse'
    vim.cmd.colorscheme('gruvbox-material')
  end
}
