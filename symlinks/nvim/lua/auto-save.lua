-- Automatically save normal file buffers, similar to VS Code autosave.
-- It saves after a short pause while editing and also when I leave insert mode,
-- switch away from a buffer, or move focus away from Neovim.
local autosave_group = vim.api.nvim_create_augroup("AutoSave", { clear = true })
local timers = {}

local function can_save(buffer)
  if not vim.api.nvim_buf_is_valid(buffer) then
    return false
  end

  local filename = vim.api.nvim_buf_get_name(buffer)
  if filename == "" then
    return false
  end

  return vim.bo[buffer].modified
    and vim.bo[buffer].modifiable
    and not vim.bo[buffer].readonly
    and vim.bo[buffer].buftype == ""
end

local function save_buffer(buffer)
  if not can_save(buffer) then
    return
  end

  vim.api.nvim_buf_call(buffer, function()
    vim.cmd("silent! write")
  end)
end

local function schedule_save(buffer)
  if timers[buffer] then
    timers[buffer]:stop()
    timers[buffer]:close()
  end

  local uv = vim.uv or vim.loop
  timers[buffer] = uv.new_timer()
  timers[buffer]:start(
    1000,
    0,
    vim.schedule_wrap(function()
      local timer = timers[buffer]
      timers[buffer] = nil

      if timer then
        timer:close()
      end

      save_buffer(buffer)
    end)
  )
end

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  group = autosave_group,
  pattern = "*",
  callback = function(event)
    schedule_save(event.buf)
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost", "BufLeave" }, {
  group = autosave_group,
  pattern = "*",
  callback = function(event)
    save_buffer(event.buf)
  end,
})

vim.api.nvim_create_autocmd("BufWipeout", {
  group = autosave_group,
  pattern = "*",
  callback = function(event)
    if timers[event.buf] then
      timers[event.buf]:stop()
      timers[event.buf]:close()
      timers[event.buf] = nil
    end
  end,
})
