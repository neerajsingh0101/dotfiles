local opt = vim.opt

opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.softtabstop = 2 -- when I press tab then indent to two spaces

opt.number = true -- turn on line number
opt.relativenumber = true -- make line number relative
opt.wrap = false -- if the line is longer than screen width then don't wrap

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if I include mixed case in my search, assume I want case-sensitive

opt.cursorline = true -- as I move up and down show the cursor line

opt.backspace = "indent,eol,start" -- controls what the Backspace key is allowed to delete in the insert mode

-- Use the system clipboard by default. Without it when I yank (y) then NeoVim will use
-- its internal copy/paste registers
opt.clipboard:append("unnamedplus")

-- It means Neovim tries to automatically indent the next line based on the current line.
-- if user.admin? (in Ruby) Here if I press enter Neovim will indent and will put cursor
-- in the next line with a bit of indentation
opt.smartindent = true

-- shows a live preview of substitution commands in a split window.
-- It mainly affects commands like:
opt.inccommand = "split"


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
