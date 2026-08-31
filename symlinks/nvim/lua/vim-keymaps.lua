vim.g.mapleader = " "

-- It means the local leader key is backslash, used for filetype-specific or plugin-specific mappings.
vim.g.maplocalleader = "\\"

-- Replace selected text with the last yanked text without overwriting the yank register.
-- Demo at https://youtu.be/XQuNoprFW38?t=475
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

-- Delete text without saving it to any register
-- Demo at https://youtu.be/XQuNoprFW38?t=500
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete without yanking" })

-- Copy the visual selection with Command-C, the way every other Mac app works.
-- "y" is untouched and still the primary way to yank; this is only an extra key.
--
-- A terminal normally eats Command-C itself, so Neovim never sees it. WezTerm is
-- configured to forward it as <D-c> when Neovim is running and nothing is selected
-- with the mouse. That forwarding lives in symlinks/wezterm/keys.lua in the
-- laptonite repo, so this mapping does nothing on its own.
vim.keymap.set("x", "<D-c>", [["+y]], { desc = "Copy selection to system clipboard" })

-- In the normal mode Ctrl c will remove all the highlights created by search term
-- https://youtu.be/XQuNoprFW38?t=538
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

-- In the visual mode use J/K to move selected text
-- https://youtu.be/XQuNoprFW38?t=551
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })

-- https://youtu.be/XQuNoprFW38?t=574
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

-- https://youtu.be/XQuNoprFW38?t=585
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- Keep cursor at the center of the page
-- https://youtu.be/XQuNoprFW38?t=614
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- https://youtu.be/XQuNoprFW38?t=630
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- Make zt and zb land exactly on the top and bottom line.
--
-- scrolloff (set to 8 in vim-options.lua) is a hard rule about how close the cursor
-- is allowed to get to a window edge, and zt/zb are not exempt from it. So plain zt
-- parks the line 8 rows below the top and plain zb parks it 8 rows above the bottom.
-- zz looks correct only because the middle of the screen never breaks the rule.
--
-- Turning scrolloff off for the jump and switching it straight back does not work:
-- the very next redraw re-applies the rule and yanks the view back where it was.
-- So instead it is left off and restored later, by the autocmd below, once the cursor
-- has drifted far enough from the edge that restoring it changes nothing on screen.
-- That way the landing is exact and the view never visibly jumps.
local pending = nil

-- The saved value is read at "local" scope on purpose. When only the global scrolloff
-- is set, this reads back as -1, and restoring -1 means "go back to following the
-- global value" rather than freezing today's 8 into this window forever.
local function scroll_to_edge(cmd)
  if pending == nil then
    pending = {
      win = vim.api.nvim_get_current_win(),
      saved = vim.api.nvim_get_option_value("scrolloff", { scope = "local", win = 0 }),
      padding = vim.wo.scrolloff,
    }
  end
  vim.api.nvim_set_option_value("scrolloff", 0, { scope = "local", win = 0 })
  local count = vim.v.count > 0 and tostring(vim.v.count) or ""
  vim.cmd("normal! " .. count .. cmd)
end

local function restore_scrolloff()
  if pending == nil then
    return
  end
  if vim.api.nvim_win_is_valid(pending.win) then
    vim.api.nvim_set_option_value("scrolloff", pending.saved, { scope = "local", win = pending.win })
  end
  pending = nil
end

vim.keymap.set("n", "zt", function()
  scroll_to_edge("zt")
end, { desc = "Put current line at the very top" })

vim.keymap.set("n", "zb", function()
  scroll_to_edge("zb")
end, { desc = "Put current line at the very bottom" })

local scroll_group = vim.api.nvim_create_augroup("ExactScrollEdges", { clear = true })

-- Put scrolloff back as soon as the cursor sits at least "padding" rows clear of both
-- edges, because at that point the rule is already satisfied and re-applying it cannot
-- move the screen.
vim.api.nvim_create_autocmd("CursorMoved", {
  group = scroll_group,
  callback = function()
    if pending == nil or vim.api.nvim_get_current_win() ~= pending.win then
      return
    end
    local row = vim.fn.winline()
    local height = vim.fn.winheight(0)
    if row > pending.padding and (height - row) >= pending.padding then
      restore_scrolloff()
    end
  end,
})

-- A window created while scrolloff is still switched off copies the zero from the window
-- it was split out of, and nothing above would ever put it right, so that split would sit
-- there with no padding forever. This hands the new window the real value instead.
vim.api.nvim_create_autocmd("WinNew", {
  group = scroll_group,
  callback = function()
    if pending ~= nil then
      vim.api.nvim_set_option_value("scrolloff", pending.saved, { scope = "local", win = 0 })
    end
  end,
})

-- Leaving the window ends the special case, and any correction it causes happens somewhere
-- I am no longer looking. It is deferred because WinLeave fires just before WinNew, and the
-- handler above still needs to see what the saved value was.
vim.api.nvim_create_autocmd("WinLeave", {
  group = scroll_group,
  callback = function()
    vim.schedule(restore_scrolloff)
  end,
})

vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix" })
vim.keymap.set("n", "<leader>lg", "<cmd>terminal lazygit<CR>", { desc = "Open LazyGit" })
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Open file explorer" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
