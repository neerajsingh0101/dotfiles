-- Auto-reload files changed outside Neovim
vim.opt.autoread = true

local auto_reload_group = vim.api.nvim_create_augroup("AutoReloadChangedFiles", { clear = true })

vim.api.nvim_create_autocmd({
  "FocusGained",
  "BufEnter",
  "CursorHold",
  "CursorHoldI",
}, {
  group = auto_reload_group,
  pattern = "*",
  command = "silent! checktime",
})

if vim.g.auto_reload_timer then
  vim.fn.timer_stop(vim.g.auto_reload_timer)
end

vim.g.auto_reload_timer = vim.fn.timer_start(1000, function()
  vim.cmd("silent! checktime")
end, { ["repeat"] = -1 })
