#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

brew install zoxide    # for jumping around
brew install fzf
brew install atuin     # better history
brew install eza       # this is replacement for ls
brew install git-delta # Usee for pager
brew install httpd     # ab(apache bench) comes with this
brew install k6        # see bin/simulate-traffice-k6
brew install gh        # GitHub CLI

# try install; if it fails due to an existing app, adopt; if adopt fails, force.
cask_install() {
  local cask="$1"
  if brew list --cask "$cask" >/dev/null 2>&1; then
    echo "Already installed: $cask"
    return 0
  fi

  brew install --cask "$cask" && return 0

  echo "Install failed for $cask; trying --adopt..."
  brew install --cask "$cask" --adopt && return 0

  echo "Adopt failed for $cask; trying --force..."
  brew install --cask "$cask" --force
}

cask_install handbrake-app
cask_install notion-calendar
cask_install qlvideo
cask_install raycast
cask_install whatsapp
cask_install visual-studio-code
cask_install zoom
cask_install iterm2
cask_install wezterm
cask_install meetingbar