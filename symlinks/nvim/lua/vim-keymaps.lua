vim.g.mapleader = " "

-- It means the local leader key is backslash, used for filetype-specific or plugin-specific mappings.
vim.g.maplocalleader = "\\"

-- Replace selected text with the last yanked text without overwriting the yank register.
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })
