#!/usr/bin/env bash
#
# set -e tells bash: exit immediately if any command returns a
# non-zero status (i.e., “fails”).
# It does not always trigger in every context.
# * If the `if` condition fails then it won't exit.
# * might_fail || echo "handled"    # won’t exit because `||` handles it
set -e

# Load dotfiles.env
[ -f "$HOME/.dotfiles.env" ] && source "$HOME/.dotfiles.env"

ln -sfn "$DOTFILESD/zsh/zshrc" "$HOME/.zshrc"
ln -sfn "$DOTFILESD/zsh/dotfiles.env" "$HOME/.dotfiles.env"

ln -sfn "$DOTFILESD/symlinks/.gemrc" "$HOME/.gemrc"
ln -sfn "$DOTFILESD/symlinks/.irbrc" "$HOME/.irbrc"
ln -sfn "$DOTFILESD/symlinks/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$DOTFILESD/symlinks/.gitignore" "$HOME/.gitignore"
ln -sfn "$DOTFILESD/symlinks/.psqlrc" "$HOME/.psqlrc"

update-dotfiles-env() {
  local link="$HOME/.dotfiles.env"
  local file

  # If it's a symlink, edit the target; otherwise edit the file itself
  if [ -L "$link" ]; then
    file="$(readlink "$link")"
    # readlink may return a relative path; make it absolute relative to $HOME
    case "$file" in
      /*) : ;;
      *) file="$HOME/$file" ;;
    esac
  else
    file="$link"
  fi

  local p="$PWD"
  p="${p/#$HOME/\$HOME}"   # make it literal $HOME/...

  # Ensure target file exists
  mkdir -p "$(dirname "$file")"
  touch "$file"

  # Escape for sed replacement
  local esc_p="${p//\\/\\\\}"
  esc_p="${esc_p//&/\\&}"

  if grep -q '^export DOTFILESD=' "$file"; then
    sed -i '' "s@^export DOTFILESD=.*\$@export DOTFILESD=\"$esc_p\"@" "$file"
  else
    printf '\n# DOTFILESD is the directory where all the dotfiles repo is cloned\nexport DOTFILESD="%s"\n' "$p" >> "$file"
  fi

  echo "Updated DOTFILESD in $file → export DOTFILESD=\"$p\""
}

update-dotfiles-env

source ./brew.sh