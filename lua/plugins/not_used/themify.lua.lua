return {
  'lmantw/themify.nvim',
  lazy = false,
  priority = 999,
  dependencies = "rktjmp/lush.nvim",
  config = function()
    require('themify').setup({
      "default",
      "sderev/alabaster.vim",
      "RRethy/base16-nvim",
      'funnyVariable/blank.nvim',
      'projekt0n/github-nvim-theme',
      "ellisonleao/gruvbox.nvim",
      "sainnhe/gruvbox-material",
      "rebelot/kanagawa.nvim",
      'sho-87/kanagawa-paper.nvim',
      "slugbyte/lackluster.nvim",
      "miikanissi/modus-themes.nvim",
      "navarasu/onedark.nvim",
      "fxn/vim-monochrome",
      "Mofiqul/vscode.nvim",
      "zenbones-theme/zenbones.nvim",
    })
  end
}
