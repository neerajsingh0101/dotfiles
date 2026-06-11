return {
  "folke/todo-comments.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
      comments_only = false,
    },
  },
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo comment",
    },
    {
      "<leader>st",
      "<cmd>TodoTelescope<CR>",
      desc = "Search todo comments",
    },
    {
      "<leader>sT",
      "<cmd>TodoQuickFix<CR>",
      desc = "Todo comments quickfix",
    },
  },
}
