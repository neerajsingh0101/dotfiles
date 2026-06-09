-- Highlight the text I just yanked so I get visual feedback after copying.
-- This runs after commands like yy, yw, or selecting text in visual mode and pressing y.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.hl.on_yank()
  end,
})
