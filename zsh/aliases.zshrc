alias reload!='. ~/.zshrc'

# prefer eza
alias ls="eza --icons=always"
alias ll='eza --classify=auto --color -l --icons=always'
alias la='eza --classify=auto --color -a -l --icons=always'

# Easy way to copy publick key to the clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# GRC colorizes logfiles and command output
# https://stackoverflow.com/questions/25183624/grc-bashrc-no-such-file-or-directory
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source `brew --prefix`/etc/grc.bashrc
fi

# Easier navigation: .., ..., ~ and -
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# open VSCode from the present directory
alias c="code ."

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'
alias h='history'

alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 x.com

alias dotfiles="code $DOTFILESD" # open dotfiles

# take me to the dotfiles directory
alias dotfilesd="cd $DOTFILESD" # open dotfiles

# Away From Keyboard (AFK) - Start screen saver
alias afk="open /System/Library/CoreServices/ScreenSaverEngine.app"