return {

  -- =========================
  -- DASHBOARD (ASHVIM)
  -- =========================
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        " ",
        "   █████╗ ███████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗",
        "  ██╔══██╗██╔════╝██║  ██║██║   ██║██║████╗ ████║",
        "  ███████║███████╗███████║██║   ██║██║██╔████╔██║",
        "  ██╔══██║╚════██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "  ██║  ██║███████║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "  ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        " ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "󰈔  New file", "<cmd>ene | startinsert<CR>"),
        dashboard.button("f", "󰱼  Find files", "<cmd>Telescope find_files<CR>"),
        dashboard.button("t", "󱔗  Todo", "<cmd>TodoTelescope<CR>"),
        dashboard.button("p", "󰉋  Projects", "<cmd>Telescope projects<CR>"),
        dashboard.button("g", "󰊢  Lazygit", "<cmd>LazyGit<CR>"),
        dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
      }

      dashboard.section.footer.val = {}

      dashboard.opts.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
      }

      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"

      alpha.setup(dashboard.opts)
    end,
  },

  -- =========================
  -- TELESCOPE
  -- =========================
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },

  -- =========================
  -- TODO COMMENTS
  -- =========================
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTelescope", "TodoQuickFix" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- =========================
  -- PROJECTS
  -- =========================
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({})
      require("telescope").load_extension("projects")
    end,
  },

  -- =========================
  -- LAZYGIT
  -- =========================
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
