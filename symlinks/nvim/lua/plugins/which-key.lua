return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 2000,
    triggers = {
      { "<leader>", mode = { "n", "v" } },
    },
  },
}
