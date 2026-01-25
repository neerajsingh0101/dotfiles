# Introduction

Over the years my shell started loading slower and slower. The objective of starting
with scratch for new dotilfes was to have a shell that is fast and looks decent.

In the proess of creating the dotfiles and choosing the terminal emulator and window management
tool I learned a lot. This dotfile, I hope, is a good default for people to get started with.

# Installation

* `cd ~/code/laptop` or wherever you want to clone this repo.
* `git clone git@github.com:neerajsingh0101/dotfiles.git`
* `cd dotfiles`
* Your existing `~/.zshrc` file will be backed up as `.zshrc-bkp-YYYYMMDDSSSS`. So
  if you don't want to using the dotfiles at anytime then you can go back to the
  backedup `.zshrc` file.
* Execute `./install.sh`.
* You can run `install.sh` any number of times.
* Optionally execute `./macos/set-defaults.sh`.

# Wezterm as the terminal emultor
* Open [wezterm](https://wezterm.org/) instead of opening terminal or iterm application. Some of you might be using [ghostyy](https://ghostty.org/) or [warp](https://www.warp.dev/). Still I'll say that you should give wezterm a try for a few days.
* Ctrl + Option gonverns wezterm configuration.
* Ctrl + Option + i -> split in two left hand side and right hand side
* Ctrl + Option + u -> split in two top side and bottom side
* Ctrl + Option + h -> navigatge to left pane
* Ctrl + Option + l -> navigatge to right pane
* Ctrl + Option + j -> navigatge to the bottom pane
* Ctrl + Option + k -> navigatge to the top pane
* Ctrl + Option + w -> Quit the pane
* Ctrl + Option + up arrow -> resize the pane and move up
* Ctrl + Option + down arrow -> resize the pane and move down
* Ctrl + Option + left arrow -> resize the pane and move left
* Ctrl + Option + right arrow -> resize the pane and move right


### z command
`z` is a smarter `cd` command. It comes from [zoxide](https://github.com/ajeetdsouza/zoxide).
https://neerajsingh0909.neetorecord.com/watch/c75ffff803ac46963f7d

### Atuin
https://neerajsingh0909.neetorecord.com/watch/446ad749cd466d5db54b

### Listing things
`ls`,`ll`, `la` https://neerajsingh0909.neetorecord.com/watch/dd8d9bba322b10a3e9b4

### fkill
https://neerajsingh0909.neetorecord.com/watch/d958a719c843d692e732

### Git usage
`gs`, `gap`, `gp`, `gpl`, `gcm`, `gr`

### sysinfo
* `sysinfo` lists info about your laptop.

### Override with dotfiles.local
This `zshrc` file loads `~/.dotfiles.local` if it exists. Use this file for private information like environment variables that shouldn't be committed to the repo.

# Overrides for Neeraj

Have a `wezterm_local.lua` file next to `.wezterm.lua` with the following content.

```
return {
  pane_resize_keys = {
    left = "9",  -- your special keyboard emits this for left
    right = "0", -- your special keyboard emits this for right
  },
}
```