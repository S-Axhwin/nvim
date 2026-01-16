vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.showtabline = 0

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Set tab width to 4 spaces
vim.o.tabstop = 4 -- a tab character counts as 4 spaces
vim.o.shiftwidth = 4 -- indentation amount for auto-indent
vim.o.softtabstop = 4 -- how many spaces a <Tab> counts for in insert mode

-- Optional: make auto-indent follow the shiftwidth
vim.o.smartindent = true
vim.opt.list = false

vim.opt.list = false
vim.g.which_key_enabled = false
vim.diagnostic.config({
  virtual_text = false,
})
