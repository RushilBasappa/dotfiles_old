#!/bin/zsh

HOMEBREW_PACKAGES=(exa gnu-sed wget)
HOMEBREW_CASK_PACKAGES=(iterm2 spotify slack clipy)

brew_update(){
  echo "Brew update/upgrade"
  brew update && brew upgrade
}

brew_install(){
  echo "Brew install packages"
  for package in "${HOMEBREW_PACKAGES[@]}"; do
    brew info ${package} | grep --quiet 'Not installed' && brew install ${package}
  done

  echo "Brew install cask packages"
  for package in "${HOMEBREW_CASK_PACKAGES[@]}"; do
    brew cask info ${package} | grep --quiet 'Not installed' && brew cask install ${package}
  done
}

add_vscode_settings_link(){
  echo "Linking VSCode settings"
  ln -svf ${PWD}/conf/vs_settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json
}

update_iterm_theme_profile_and_settings(){
  echo "Download Dracula theme"
  git clone https://github.com/dracula/iterm.git iterm_theme 2>/dev/null || (cd iterm_theme; git pull)

  echo "Update iterm2 profile"
  # Specify the preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${PWD}/iterm2_profile"
  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
}

brew_update
brew_install
add_vscode_settings_link
update_iterm_theme_profile_and_settings

return 0
