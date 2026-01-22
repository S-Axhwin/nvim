return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("leetcode").setup()

    local keymap = vim.keymap.set

    keymap("n", "<leader>ll", "<cmd>Leet list<cr>", { desc = "LeetCode: List problems" })
    keymap("n", "<leader>lt", "<cmd>Leet test<cr>", { desc = "LeetCode: Test solution" })
    keymap("n", "<leader>ls", "<cmd>Leet submit<cr>", { desc = "LeetCode: Submit solution" })
    keymap("n", "<leader>lr", "<cmd>Leet reset<cr>", { desc = "LeetCode: Reset code" })
    keymap("n", "<leader>li", "<cmd>Leet info<cr>", { desc = "LeetCode: Problem info" })
  end,
  opts = {
    -- configuration goes here
  },
}
