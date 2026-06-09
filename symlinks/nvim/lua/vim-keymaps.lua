vim.g.mapleader = " "

-- It means the local leader key is backslash, used for filetype-specific or plugin-specific mappings.
vim.g.maplocalleader = "\\"

-- Replace selected text with the last yanked text without overwriting the yank register.
-- Demo at https://youtu.be/XQuNoprFW38?t=475
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

-- Delete text without saving it to any register
-- Demo at https://youtu.be/XQuNoprFW38?t=500
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete without yanking" })

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

