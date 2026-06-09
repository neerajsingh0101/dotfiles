return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        filesystem = {
          -- Watch the filesystem so neo-tree refreshes when files are added,
          -- deleted, or renamed outside of Neovim.
          use_libuv_file_watcher = true,
          filtered_items = {
            visible = true, -- show hidden files by default
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
      vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
    end,
  },
}
