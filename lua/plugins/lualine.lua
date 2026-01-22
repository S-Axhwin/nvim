return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "wal --theme ash", -- make sure tokyonight is installed

        component_separators = "",
        section_separators = { left = "", right = "" },
        globalstatus = true, -- single bottom statusline
        always_show_tabline = false, -- 🚫 NO TOP BAR
        disabled_filetypes = {
          statusline = {
            "snacks_picker",
            "snacks_explorer",
            "NvimTree",
          },
          winbar = {
            "snacks_picker",
            "snacks_explorer",
          },
        },
      },

      sections = {

        lualine_a = { { "mode", icon = "" } },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_z = {
          function()
            return " " .. os.date("%H:%M")
          end,
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {}, -- 🚫 disabled
      winbar = {}, -- 🚫 disabled
      inactive_winbar = {}, -- 🚫 disabled
      extensions = {},
    })
  end,
}
