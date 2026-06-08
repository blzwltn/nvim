-- ========================================================================== --
-- GLOBAL SETTINGS & UI OPTIONS
-- ========================================================================== --

-- Detect if running inside Termux on Android
vim.g.is_termux = vim.fn.getenv("TERMUX_VERSION") ~= vim.NIL

-- Use the flag to adapt settings
if vim.g.is_termux then
  vim.o.mouse = "a"            -- Crucial: allows tapping to position cursor & scrolling
  vim.o.updatetime = 500       -- Save battery: check for changes less frequently
  vim.o.timeoutlen = 500       -- Give yourself a bit more time to type keys on virtual boards
  vim.g.have_nerd_font = false -- Most mobile terminal fonts are standard monospace
else
  vim.o.mouse = "a"
  vim.o.updatetime = 250
  vim.o.timeoutlen = 300
  vim.g.have_nerd_font = true
end

if vim.g.is_termux then
  vim.o.signcolumn = "auto" -- Only show the column if git/errors actively exist
  vim.o.colorcolumn = ""    -- Hide the 120-character line limit guide

  vim.g.clipboard = {
    name = "termux-clipboard",
    copy = {
      ["+"] = "termux-clipboard-set",
      ["*"] = "termux-clipboard-set",
    },
    cache = {
      ["+"] = "termux-clipboard-get",
      ["*"] = "termux-clipboard-get",
    },
  }
else
  vim.o.clipboard = "unnamedplus"
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Disable netrw for oil.nvim compatibility
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI & Appearance
vim.o.termguicolors = true
vim.g.tinted_colorspace = 256
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "120"
vim.o.winborder = "bold"
vim.o.laststatus = 3  -- Global statusline
vim.opt.cmdheight = 0 -- Hide command line when not in use
vim.o.showmode = true

-- Whitespace & Indentation
vim.o.list = true
vim.opt.listchars = { tab = "| ", trail = "·", nbsp = "␣" }
vim.o.breakindent = true
vim.o.wrap = false

-- Editing Behavior
vim.o.clipboard = "unnamedplus" -- Sync with system clipboard
vim.o.undofile = true           -- Persistent undo
vim.o.mouse = "a"               -- Enable mouse support
vim.o.confirm = true            -- Confirm to save changes before exiting

-- Tabs & Spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 0 -- Follows tabstop if 0
vim.o.expandtab = true

-- Search & Completion
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split" -- Live preview of substitutions
vim.o.completeopt = "menu,menuone,noselect,noinsert"

-- Timings & Performance
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.scrolloff = 10 -- Keep 10 lines above/below cursor

-- Windows
vim.o.splitbelow = true
vim.o.splitright = true

-- ========================================================================== --
-- LOAD CORE SUBSYSTEMS
-- ========================================================================== --
require("plugins")  -- 1. Register dependencies and plugins first
require("themes")   -- 2. Immediately execute colorscheme to avoid screen flashes
require("keymaps")  -- 3. Bind navigation shortcuts
require("autocmds") -- 4. Bind event hooks
require("lsp")      -- 5. Attach native structural languages
