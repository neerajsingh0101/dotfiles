vim.g.mapleader = " "

-- It means the local leader key is backslash, used for filetype-specific or plugin-specific mappings.
vim.g.maplocalleader = "\\"

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

-- It keeps the cursor thick in normal/visual/command mode, but uses a thinner
-- vertical cursor in insert mode so insert mode is easier to notice.
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"

-- It keeps 8 lines visible above and below the cursor when possible.
-- This gives me context while scrolling instead of letting the cursor sit at the screen edge.
opt.scrolloff = 8

-- It disables the vertical color column guide.
-- For example, "80" would show a line at column 80, but "0" shows no guide.
opt.colorcolumn = "0"

-- It always shows the sign column on the left side of the buffer.
-- This keeps text from shifting when Git markers, diagnostics, or breakpoints appear.
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start" -- controls what the Backspace key is allowed to delete in the insert mode

-- Use the system clipboard by default. Without it when I yank (y) then NeoVim will use
-- its internal copy/paste registers
opt.clipboard:append("unnamedplus")

-- It means Neovim tries to automatically indent the next line based on the current line.
-- if user.admin? (in Ruby) Here if I press enter Neovim will indent and will put cursor
-- in the next line with a bit of indentation
opt.smartindent = true

-- It means Neovim shows a live preview of substitute commands in a split window.
-- For example, when I type :%s/old/new/g Neovim previews the changes before I press enter.
opt.inccommand = "split"

-- It means horizontal splits open below the current window instead of above it.
-- It means vertical splits open to the right of the current window instead of left of it.
opt.splitbelow = true
opt.splitright = true

-- It means Neovim uses one global statusline at the bottom of the editor.
-- Without this, each split window can have its own statusline.
-- The value 3 means always show one statusline for the whole Neovim screen.
opt.laststatus = 3

-- It means Neovim will not create swap files while I edit a file.
-- Swap files are used for crash recovery, but they can also create extra .swp files.
opt.swapfile = false

-- It means Neovim will not keep a backup copy when writing a file.
-- Without this, Neovim can create backup files like filename~ depending on the backup settings.
opt.backup = false

-- It means Neovim saves undo history to disk.
-- This lets me close a file, open it later, and still undo changes from the previous session.
-- I am not setting undodir, so Neovim uses its default place for storing undo files.
opt.undofile = true

-- It controls how Neovim's completion menu behaves.
-- menuone shows the menu even when there is only one match.
-- noselect means Neovim does not automatically select the first item.
-- fuzzy allows partial typed letters to match longer completion items.
-- nosort keeps completion results in the order provided by the completion source.
opt.completeopt = "menuone,noselect,fuzzy,nosort"

-- It makes completion quieter by hiding extra completion-menu messages.
-- append("c") adds this behavior without replacing Neovim's other shortmess settings.
opt.shortmess:append("c")
