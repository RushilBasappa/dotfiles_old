#!/bin/bash

download_iterm_theme(){
  echo "Download Dracula theme"
  git clone https://github.com/dracula/iterm.git iterm_theme 2>/dev/null || (cd iterm_theme; git pull)
}

update_iterm_profile(){
  echo "Update iterm2 profile"
  # Specify the preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${PWD}/iterm2_profile"
  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
}

download_iterm_theme
update_iterm_profile
