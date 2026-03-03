vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>lua require("notify")("Use h to move!!")<CR>')
vim.keymap.set("n", "<right>", '<cmd>lua require("notify")("Use l to move!!")<CR>')
vim.keymap.set("n", "<up>", '<cmd>lua require("notify")("Use k to move!!")<CR>')
vim.keymap.set("n", "<down>", '<cmd>lua require("notify")("Use j to move!!")<CR>')

-- Move between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = 'TODO' })

vim.keymap.set("n", "<leader>ww", "<CMD>w<CR>", { desc = "File" })
vim.keymap.set("n", "<leader>wa", "<CMD>wa<CR>", { desc = "All" })
vim.keymap.set("n", "<leader>wq", "<CMD>wqa<CR>", { desc = "All and quit" })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit all" })

vim.keymap.set("n", "<leader>S-", "<CMD>split<CR>", { desc = "Split Window Horizontaly" })
vim.keymap.set("n", "<leader>S\\", "<CMD>vsplit<CR>", { desc = "Split Window Vertically" })
