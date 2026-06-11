-- Automatically reload Neovim config files when they are changed outside Neovim.
-- This is useful when another tool edits files under ~/.config/nvim while Neovim is open.
local config_group = vim.api.nvim_create_augroup("AutoReloadConfig", { clear = true })
local uv = vim.uv or vim.loop
local config_path = vim.fs.normalize(vim.fn.stdpath("config"))
local config_realpath = vim.fs.normalize(uv.fs_realpath(config_path) or config_path)

local function is_config_lua_file(path)
  if path == "" then
    return false
  end

  path = vim.fs.normalize(path)
  local realpath = vim.fs.normalize(uv.fs_realpath(path) or path)
  local in_config = vim.startswith(path, config_path .. "/") or vim.startswith(realpath, config_realpath .. "/")

  return in_config and vim.endswith(path, ".lua")
end

local function check_changed_config_buffers()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and not vim.bo[bufnr].modified then
      local path = vim.api.nvim_buf_get_name(bufnr)

      if is_config_lua_file(path) then
        vim.cmd("checktime " .. bufnr)
      end
    end
  end
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = config_group,
  pattern = "*",
  callback = check_changed_config_buffers,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = config_group,
  pattern = vim.fn.stdpath("config") .. "/**/*.lua",
  callback = function()
    vim.cmd("source " .. vim.fn.fnameescape(vim.fn.stdpath("config") .. "/init.lua"))
    vim.notify("Reloaded Neovim config", vim.log.levels.INFO)
  end,
})
