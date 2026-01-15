-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Add Ctrl+j for terminal toggle
vim.keymap.set("n", "<C-j>", function()
  Snacks.terminal()
end, { desc = "Toggle Terminal" })

vim.keymap.set("t", "<C-j>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
