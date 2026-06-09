-- Automatically reload Neovim config files when they are changed outside Neovim.
-- This is useful when another tool edits files under ~/.config/nvim while Neovim is open.
local config_group = vim.api.nvim_create_augroup("AutoReloadConfig", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = config_group,
  pattern = "*",
  command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = config_group,
  pattern = vim.fn.stdpath("config") .. "/**/*.lua",
  callback = function()
    vim.cmd("source " .. vim.fn.fnameescape(vim.fn.stdpath("config") .. "/init.lua"))
    vim.notify("Reloaded Neovim config", vim.log.levels.INFO)
  end,
})
