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

# Update DOTFILESD based on where install.sh is being run from
./bin/update-dotfiles-env

source ./brew.sh

echo ""
echo "Next: apply macOS defaults by running:"
echo "  ./macos/set-defaults.sh"
echo ""