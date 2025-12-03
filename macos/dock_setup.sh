#!/bin/zsh
source 'zsh/functions.sh'

echo "Wipe all (default) app icons from the Dock"
defaults write com.apple.dock persistent-apps -array

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

echo "Speed up the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0.15

echo "Dim hidden apps"
defaults write com.apple.dock showhidden -bool false

echo "Dont automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "Minimize windows into their applications icon"
defaults write com.apple.dock minimize-to-application -bool true

echo "Dont show recent applications in Dock"
defaults write com.apple.dock show-recents -bool false

echo "Show notification badges on dock icons"
defaults write com.apple.dock show-process-indicators -bool true


killall Dock
