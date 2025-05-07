--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move to window using the <C-hjkl> keys
--vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
--vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to lower window" })
--vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to upper window" })
--vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })

-- Quickfix list
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix item" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix item" })

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
