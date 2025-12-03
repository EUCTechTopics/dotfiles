#!/bin/zsh
source 'zsh/functions.sh'
log_header 'Installing Homebrew packages'

echo "Installing brew packages listed in homebrew/brewfile"
/opt/homebrew/bin/brew bundle --file=~/.dotfiles/homebrew/brewfile --verbose

echo "Finished installing brew packages"