#!/bin/zsh
source 'zsh/functions.sh'
source 'macos/helpers/set_macos_default_if_different.sh'
source 'macos/helpers/set_plist_value_if_different.sh'

sudo -v
echo 'Setting macOS defaults'

echo 'Close any open System Preferences panes'
osascript -e 'tell application "System Preferences" to quit'

set_macos_default_if_different \
	'Disable the crash reporter' \
    'com.apple.CrashReporter' \
    'DialogType' \
    '-string' \
    'none'

set_macos_default_if_different \
	'Improve Bluetooth audio quality' \
    'com.apple.BluetoothAudioAgent' \
    'Apple Bitpool Min (editable)' \
    '-int' \
    40

set_macos_default_if_different \
	'Disable automatic audio device switching' \
    'com.apple.audio.AudioMIDISetup' \
    'Automatic Device Switching' \
    '-bool' \
    false

set_macos_default_if_different \
	'Disable the "Are you sure you want to open this application?" dialog' \
    'com.apple.LaunchServices' \
    'LSQuarantine' \
    '-bool' \
    false

set_macos_default_if_different \
	'Set highlight color to green' \
    'NSGlobalDomain' \
    'AppleHighlightColor' \
    '-string' \
    '0.764700 0.976500 0.568600'

#Mission Control
set_macos_default_if_different \
	'Group apps in mission control' \
    'com.apple.dock' \
    'expose-group-apps' \
    '-bool' \
    true
    
#Finder
set_macos_default_if_different \
	'Disable the warning before emptying the trash' \
    'com.apple.finder' \
    'WarnOnEmptyTrash' \
    '-bool' \
    false

set_macos_default_if_different \
	'Search the current folder by default' \
    'com.apple.finder' \
    'FXDefaultSearchScope' \
    '-string' \
    'SCcf'

set_macos_default_if_different \
	'No .DS_Store files on network volumes' \
    'com.apple.desktopservices' \
    'DSDontWriteNetworkStores' \
    '-bool' \
    true

set_macos_default_if_different \
	'No .DS_Store files on usb drives' \
    'com.apple.desktopservices' \
    'DSDontWriteUSBStores' \
    '-bool' \
    true

set_macos_default_if_different \
    "Remove the delay when hovering the toolbar title" \
    'com.apple.finder' \
    NSToolbarTitleViewRolloverDelay \
    '-float' \
    0

set_macos_default_if_different \
    "Keep folders on top when sorting by name" \
    'com.apple.finder' \
    _FXSortFoldersFirst \
    '-bool' \
    true

set_macos_default_if_different \
	"Use list view in all Finder windows by default" \
    'com.apple.finder' \
    'FXPreferredViewStyle' \
    '-string' \
    'Nlsv'

echo 'Expand default file info sections'
defaults write com.apple.finder \
    FXInfoPanesExpanded \
    -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

killall Finder

# Keyboard
echo 'Optimize keyboard response'
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 20

set_macos_default_if_different \
	'Disable automatic text corrections' \
    'NSGlobalDomain' \
    'NSAutomaticSpellingCorrectionEnabled' \
    '-bool' \
    false

set_macos_default_if_different \
	'Disable automatic capitalization' \
    'NSGlobalDomain' \
    'NSAutomaticCapitalizationEnabled' \
    '-bool' \
    false


set_macos_default_if_different \
	'Disable automatic quote substitution' \
    'NSGlobalDomain' \
    'NSAutomaticQuoteSubstitutionEnabled' \
    '-bool' \
    false

set_macos_default_if_different \
	'Disable automatic dash substitution' \
    'NSGlobalDomain' \
    'NSAutomaticDashSubstitutionEnabled' \
    '-bool' \
    false


