vim.g.mapleader = " "

-- It means the local leader key is backslash, used for filetype-specific or plugin-specific mappings.
vim.g.maplocalleader = "\\"

-- Replace selected text with the last yanked text without overwriting the yank register.
-- Demo at https://youtu.be/XQuNoprFW38?t=475
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

-- Delete text without saving it to any register
-- Demo at https://youtu.be/XQuNoprFW38?t=500
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete without yanking" })

-- IN the normal mode Ctrl c will remove all the highlights created by search term
-- https://youtu.be/XQuNoprFW38?t=538
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

-- https://youtu.be/XQuNoprFW38?t=551
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
