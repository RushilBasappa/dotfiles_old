#!/bin/bash

HOMEBREW_PACKAGES=( vim exa fzf gnu-sed gnupg kubectl mysql@5.7 node python the_silver_searcher wget yarn zplug postgresql )
HOMEBREW_CASK_PACKAGES=( clipy evernote github google-chrome google-cloud-sdk iterm2 pritunl slack spotify teamviewer docker vlc visual-studio-code )

# python 3.6.5
# brew install --ignore-dependencies https://raw.githubusercontent.com/Homebrew/homebrew-core/f2a764ef944b1080be64bd88dca9a1d80130c558/Formula/python.rb

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

  return 0
}

brew_link(){
  brew link --force mysql@5.7
}

brew_update
brew_install
