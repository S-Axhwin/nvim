vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.mouse = ""
vim.opt.showtabline = 0

-- Use spaces instead of tabs
vim.o.expandtab = true
-- Optional: make auto-indent follow the shiftwidth
vim.o.smartindent = true
vim.opt.list = false

vim.opt.list = false
vim.g.which_key_enabled = false
vim.diagnostic.config({
  virtual_text = false,
})

vim.keymap.set("n", "<leader>dm", function()
  local line = vim.fn.line(".")
  local deleted = {}

  -- 1️⃣ Local (buffer) marks a–z
  for _, m in ipairs(vim.fn.getmarklist("%")) do
    local mark = m.mark and m.mark:sub(2, 2)
    if mark and mark:match("[a-z]") and m.pos[2] == line then
      vim.cmd("delmarks " .. mark)
      table.insert(deleted, mark)
    end
  end

  -- 2️⃣ Global marks A–Z
  for _, m in ipairs(vim.fn.getmarklist()) do
    local mark = m.mark and m.mark:sub(2, 2)
    if mark and mark:match("[A-Z]") and m.pos[2] == line then
      vim.cmd("delmarks " .. mark)
      table.insert(deleted, mark)
    end
  end

  if #deleted > 0 then
    vim.notify("Deleted marks: " .. table.concat(deleted, ", "))
  else
    vim.notify("No marks on this line", vim.log.levels.WARN)
  end
end, { desc = "Delete ALL marks on current line (local + global)" })
