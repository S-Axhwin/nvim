return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "tokyonight", -- make sure tokyonight is installed
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- single bottom statusline
        always_show_tabline = false, -- 🚫 NO TOP BAR
        disabled_filetypes = {
          statusline = {
            "neo-tree",
            "snacks_picker",
            "snacks_explorer",
            "NvimTree",
          },
          winbar = {
            "neo-tree",
            "snacks_picker",
            "snacks_explorer",
          },
        },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
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
