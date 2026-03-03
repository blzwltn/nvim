vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.breakindent = true

vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "120"
vim.o.confirm = true
vim.o.cursorline = true
vim.o.completeopt = 'menuone,noinsert,noselect,fuzzy,nosort'

vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.inccommand = "split"

vim.o.laststatus = 3
vim.o.list = true

vim.o.mouse = "a"

vim.o.number = true

vim.o.relativenumber = true

vim.o.scrolloff = 10
vim.o.shiftwidth = 0
vim.o.showmode = true
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.smartcase = true

vim.o.tabstop = 2
vim.o.timeoutlen = 300

vim.o.undofile = true
vim.o.updatetime = 250

vim.o.wrap = false
vim.o.winborder = 'bold'

vim.opt.cmdheight = 0
vim.opt.listchars = { tab = "| ", trail = "·", nbsp = "␣" }

vim.o.termguicolors = true
vim.g.tinted_colorspace = 256

require("keymaps")
require("lazy_bootstrap")
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  { import = "themes" },
})
