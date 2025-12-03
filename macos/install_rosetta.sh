#!/bin/zsh

source 'zsh/functions.sh'
log_header 'Installing Rosetta 2'

# check if Rosetta is already installed
if /usr/bin/pgrep oahd >/dev/null 2>&1; then
    echo 'Rosetta 2 is already installed'
    exit 0
fi

# install Rosetta 2
softwareupdate --install-rosetta --agree-to-license >/dev/null 2>&1

# check if installation was successful
if [[ $? -ne 0 ]]; then
    echo 'Failed to install Rosetta 2'
    exit 1
fi

echo 'Successfully installed Rosetta 2'