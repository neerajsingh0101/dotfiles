#!/bin/sh
#
# Sets reasonable macOS defaults.
#
# Run ./set-defaults.sh and you'll be good to go.

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Save screenshots to the screenshots folder in dropbox
defaults write com.apple.screencapture location -string "${HOME}/Dropbox/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Finder: show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Show only open applications in the Dock
defaults write com.apple.dock static-only -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType none

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "neerajsingh0101"
sudo scutil --set HostName "neerajsingh0101"
sudo scutil --set LocalHostName "neerajsingh0101"

# Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Enable lid wakeup. Meaning when laptop should wake up automatically when
# lid is opened.
sudo pmset -a lidwake 1

# Disable the “power connected” chime (PowerChime)
# This is the little ding you hear when plugging in a charger.
# Safe to run multiple times.
if [ "$(uname -s)" = "Darwin" ]; then
  # Stop it if it's running (ignore error if not running)
  killall PowerChime 2>/dev/null || true

  # These defaults reliably suppress the chime
  defaults write com.apple.PowerChime ChimeOnNoHardware -bool true
  defaults write com.apple.PowerChime ChimeOnAllHardware -bool false

  # Apply immediately
  killall PowerChime 2>/dev/null || true
fi