return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  -- this helps in inside array give a try colase you can say ash
  keys = {
    {
      "<leader>Rs",
      function()
        require("kulala").run()
      end,
      desc = "Send request",
    },
    {
      "<leader>Ra",
      function()
        require("kulala").run_all()
      end,
      desc = "Send all requests",
    },
    {
      "<leader>Rb",
      function()
        require("kulala").open()
      end,
      desc = "Open kulala scratchpad",
    },
  },

  opts = {
    global_keymaps = false,
  },
}
