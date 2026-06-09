local opt = vim.opt

opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.softtabstop = 2

opt.relativenumber = true
opt.number = true
opt.wrap = false

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if I include mixed case in my search, assume I want case-sensitive

opt.cursorline = true

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
