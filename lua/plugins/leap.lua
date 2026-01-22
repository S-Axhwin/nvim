return {
  "https://codeberg.org/andyg/leap.nvim.git",
  config = function()
    local leap = require("leap")
    vim.keymap.set({ "n", "o" }, "gs", function()
      require("leap.remote").action()
    end)
  end,
}
