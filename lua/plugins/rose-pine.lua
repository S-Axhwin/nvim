-- lua/plugins/rose-pine.lua
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 300,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },
}
