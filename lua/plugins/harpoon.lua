return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require("harpoon")
    local keys = {
      {
        "<leader>ha",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>hh",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Menu",
      },
      {
        "<C-n>",
        function()
          harpoon:list():next()
        end,
        desc = "Next Harpoon",
      },
      {
        "<leader>hD",
        function()
          require("harpoon"):list():clear()
          vim.notify("Harpoon list cleared")
        end,
        desc = "Clear all Harpoon files",
      },
      {
        "<C-p>",
        function()
          harpoon:list():prev()
        end,
        desc = "Prev Harpoon",
      },
      {
        "<leader>hd",
        function()
          local curr_file = vim.fn.expand("%:.") -- Relative path
          local list = harpoon:list()
          for _, item in ipairs(list.items) do
            if item.value == curr_file then
              list:remove(item)
              vim.notify("Removed from Harpoon: " .. curr_file)
              return
            end
          end
        end,
        desc = "Remove Current File",
      },
    }

    -- Use <leader>h1, <leader>h2 etc. to avoid conflicts with LazyVim UI switching
    for i = 1, 5 do
      table.insert(keys, {
        "<leader>h" .. i,
        function()
          harpoon:list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end

    return keys
  end,
  config = function(_, opts)
    require("harpoon").setup(opts)
  end,
}
