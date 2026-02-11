# Introduction

A simple dotfile that gives sensible defaults, is fast and looks beautiful out of the box.

# Installation

* `cd ~/code/laptop` or wherever you want to clone this repo.
* `git clone git@github.com:neerajsingh0101/dotfiles.git`
* `cd dotfiles`
* Your existing `~/.zshrc` file will be backed up as `.zshrc-bkp-YYYYMMDDSSSS`. So
  if you don't want to use the dotfiles at anytime then you can go back to the
  backed up `.zshrc` file.
* Execute `./install.sh`.
* You can run `install.sh` any number of times.
* Optionally execute `./macos/set-defaults.sh`.


# Wezterm as the terminal emulator
* Open [wezterm](https://wezterm.org/) instead of opening terminal or iterm application. Some of you might be using [ghostyy](https://ghostty.org/) or [warp](https://www.warp.dev/). Still I'll say that you should give wezterm a try for a few days.
* Shift + Ctrl governs wezterm configuration.
* Shift + Ctrl + i -> split in two left hand side and right hand side
* Shift + Ctrl + u -> split in two top side and bottom side
* Shift + Ctrl + h -> navigate to left pane
* Shift + Ctrl + l -> navigate to right pane
* Shift + Ctrl + j -> navigate to the bottom pane
* Shift + Ctrl + k -> navigate to the top pane
* Shift + Ctrl + w -> Quit the pane
* Shift + Ctrl + up arrow -> resize the pane and move up
* Shift + Ctrl + down arrow -> resize the pane and move down
* Shift + Ctrl + left arrow -> resize the pane and move left
* Shift + Ctrl + right arrow -> resize the pane and move right
* By default the tab name is the name of the running process. Press Shift + Ctrl + r to rename the tab.

# z command
`z` is a smarter `cd` command. It comes from [zoxide](https://github.com/ajeetdsouza/zoxide).
https://neerajsingh0909.neetorecord.com/watch/c75ffff803ac46963f7d

# Atuin for better shell history
https://neerajsingh0909.neetorecord.com/watch/446ad749cd466d5db54b

# Listing things
`ls`,`ll`, `la` https://neerajsingh0909.neetorecord.com/watch/dd8d9bba322b10a3e9b4

# fkill
https://neerajsingh0909.neetorecord.com/watch/d958a719c843d692e732

# Git usage
`gs`, `gap`, `gp`, `gpl`, `gcm`, `gr`

# sysinfo
* `sysinfo` lists info about your laptop.

# Override with dotfiles.local
This `zshrc` file loads `~/.dotfiles.local` if it exists. Use this file for private information like environment variables that shouldn't be committed to the repo.

# Mac defaults

Have a look at `macos/set-defaults.sh`. I don't like every time Mac boots it makes a sound. So I've disabled it.
Similarly I don't like warning when I'm emptying trash.
