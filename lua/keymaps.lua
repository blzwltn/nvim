-- Navigation Clear outs
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Focus Splits Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Write & Quit Mappings
vim.keymap.set("n", "<leader>ww", "<CMD>w<CR>", { desc = "File" })
vim.keymap.set("n", "<leader>wa", "<CMD>wa<CR>", { desc = "All" })
vim.keymap.set("n", "<leader>wq", "<CMD>wqa<CR>", { desc = "All and quit" })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit all" })

-- Split Generation
vim.keymap.set("n", "<leader>S-", "<CMD>split<CR>", { desc = "Split Window Horizontaly" })
vim.keymap.set("n", "<leader>S\\", "<CMD>vsplit<CR>", { desc = "Split Window Vertically" })

-- Custom Core Plugin Triggers
vim.keymap.set("n", "<leader>oo", "<CMD>Oil<CR>", { desc = "Parent Dir" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Parent Dir" })
vim.keymap.set("n", "<leader>of", "<CMD>Oil --float<CR>", { desc = "Floating Window" })
vim.keymap.set("n", "<leader>hh", function() require("snipe").open_buffer_menu() end, { desc = "Snipe Buffers" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>t-", "<cmd>ToggleTerm size=25 direction=horizontal<CR>")
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>")

-- Arrow Key Discipline Layer (Utilizes mini.notify popups)
local function warn_move(motion)
  return function() require("mini.notify").add("Use " .. motion .. " to move!!") end
end
vim.keymap.set("n", "<left>", warn_move("h"))
vim.keymap.set("n", "<right>", warn_move("l"))
vim.keymap.set("n", "<up>", warn_move("k"))
vim.keymap.set("n", "<down>", warn_move("j"))

-- IDE Buffer Management
vim.keymap.set("n", "<leader>bd", function() require("mini.bufremove").delete() end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", function() require("mini.bufremove").delete(0, true) end,
  { desc = "Force Delete Buffer" })

-- Quick cycle through open files (IDE style)
vim.keymap.set("n", "<Tab>", "<CMD>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<CMD>bprevious<CR>", { desc = "Previous Buffer" })

-- Global IDE Finder / Grep Search
vim.keymap.set("n", "<leader>/", function() require("mini.pick").builtin.grep_live() end,
  { desc = "Grep Project Workspace" })
vim.keymap.set("n", "<leader>ff", function() require("mini.pick").builtin.files() end, { desc = "Find Workspace Files" })

-- IDE Git Overlay Mappings
vim.keymap.set("n", "<leader>gd", function() require("mini.diff").toggle_overlay() end,
  { desc = "Toggle Git Diff Overlay" })
vim.keymap.set("n", "<leader>gs", "<CMD>Vertical Git status<CR>", { desc = "Git Status Pane" })

-- ========================================================================== --
-- CLASSIC COMPLETION MENU CONTROLS
-- ========================================================================== --
local function check_backspace()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- Map Tab to go down the old-school menu if it's visible
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  elseif not check_backspace() then
    -- If no menu is open but we are next to characters, manually trigger it
    return "<C-x><C-o>"
  else
    return "<Tab>"
  end
end, { expr = true, replace_keycodes = true })

-- Map Shift+Tab to go up the menu if visible
vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  else
    return "<S-Tab>"
  end
end, { expr = true, replace_keycodes = true })

-- Map Enter to accept the selection cleanly without adding a newline
vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  else
    return "<CR>"
  end
end, { expr = true, replace_keycodes = true })
