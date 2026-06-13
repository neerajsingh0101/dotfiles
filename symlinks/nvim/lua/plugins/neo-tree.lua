return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      local fs_watch = require("neo-tree.sources.filesystem.lib.fs_watch")
      fs_watch.dotfiles_ignored_names = {
        ["neo-tree.lua"] = true,
      }

      if not fs_watch.dotfiles_ignore_wrapped then
        fs_watch.dotfiles_ignore_wrapped = true
        local watch_folder = fs_watch.watch_folder

        fs_watch.watch_folder = function(path, callback)
          return watch_folder(path, function(err, fname)
            local name = fname and vim.fn.fnamemodify(fname, ":t")
            if name and fs_watch.dotfiles_ignored_names[name] then
              return
            end

            callback(err, fname)
          end)
        end
      end

      require("neo-tree").setup({
        window = {
          width = 33,
        },
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
      vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {desc = "Reveal NeoTree"})
      vim.keymap.set("n", "<leader>N", ":Neotree close<CR>", {desc = "Hide NeoTree"})
    end,
  },
}
