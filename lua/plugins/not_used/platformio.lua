return {
  'anurag3301/nvim-platformio.lua',
  config = function()
    local pok, platformio = pcall(require, 'platformio')
    if pok then
      platformio.setup({
        lsp = 'clangd',
        menu_key = '<leader>p',
      })
    end
  end
}
