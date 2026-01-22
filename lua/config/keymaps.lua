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
vim.keymap.set("n", "<leader>t", "<cmd>TodoTelescope<CR>", {})

-- Register a
vim.keymap.set({ "n", "v" }, "<leader>ya", '"ay')
vim.keymap.set("n", "<leader>pa", '"ap')

-- Register b
vim.keymap.set({ "n", "v" }, "<leader>yb", '"by')
vim.keymap.set("n", "<leader>pb", '"bp')

-- Register c
vim.keymap.set({ "n", "v" }, "<leader>yc", '"cy')
vim.keymap.set("n", "<leader>pc", '"cp')
local opts = { noremap = true, silent = true }

-- Normal mode
vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<Down>", "<Nop>", opts)
vim.keymap.set("n", "<Left>", "<Nop>", opts)
vim.keymap.set("n", "<Right>", "<Nop>", opts)

-- Insert mode
vim.keymap.set("i", "<Up>", "<Nop>", opts)
vim.keymap.set("i", "<Down>", "<Nop>", opts)
vim.keymap.set("i", "<Left>", "<Nop>", opts)
vim.keymap.set("i", "<Right>", "<Nop>", opts)

-- Visual mode
vim.keymap.set("v", "<Up>", "<Nop>", opts)
vim.keymap.set("v", "<Down>", "<Nop>", opts)
vim.keymap.set("v", "<Left>", "<Nop>", opts)
vim.keymap.set("v", "<Right>", "<Nop>", opts)

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.cpp", "*.go", "*.py" },
  callback = function()
    require("overseer").run_template({ name = "Run On Save" })
  end,
})
vim.lsp.inlay_hint.enable(false)

local Terminal = require("toggleterm.terminal").Terminal

local cpp_term = Terminal:new({
  direction = "float",
  close_on_exit = false,
  hidden = true,
})

vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%:p")
  local exe = vim.fn.expand("%:t:r")

  local run_cmd
  if vim.fn.filereadable("input.txt") == 1 then
    run_cmd = string.format("./%s < input.txt", exe)
  else
    run_cmd = string.format("./%s", exe)
  end

  local cmd = string.format("g++ -std=c++17 -O2 %s -o %s && %s; rm -f %s", file, exe, run_cmd, exe)

  cpp_term.cmd = cmd
  cpp_term:toggle()

  -- always enter insert mode so output is visible
  vim.schedule(function()
    vim.cmd("startinsert")
  end)
end, { desc = "Run C++ (DSA) stable" })
