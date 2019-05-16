#!/bin/bash

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

brew_update
brew_install

return 0
