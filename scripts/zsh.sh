#!/bin/zsh

autoload -Uz is-at-least; is-at-least
ZSH_MIN_VERSION="4.1.9"

testing(){
  if is-at-least $ZSH_MIN_VERSION; then
    echo "zsh checks passed"
    return 0
  else
    return 1
  fi
}

_install_omzsh() {

  local ZSH="$HOME/.oh-my-zsh"

  if [ -d $ZSH ]; then
    # return 0
  fi

  umask g-w,o-w

  hash git 2>/dev/null || {
    echo "Install git... and retry"
    return 1
  }

  # git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH" -q

  # printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.old;
  fi

  # printf "${BLUE}Using the Oh My Zsh template file and adding it to ~/.zshrc${NORMAL}\n"
  cp "$ZSH"/templates/zshrc.zsh-template ~/.zshrc

  # Update ZSH directory in template
  gsed "/^export ZSH=/ c\\
  export ZSH=\"$ZSH\"
  " ~/.zshrc > ~/.zshrc-omztemp
  mv -f ~/.zshrc-omztemp ~/.zshrc
}

_modify_zshrc(){
  local TAB=$'\t'
  local PLUGINS="brew colored-man-pages docker git globalias history kubectl npm osx rails sudo vagrant vscode yarn z"

  sed "/^#/d;/^$/d;s/plugins.*/plugins=( ${PLUGINS} )/g" ~/.zshrc > ~/.zshrc-tmp
  mv ~/.zshrc-tmp ~/.zshrc
  ex +"norm gg=G" -cwq ~/.zshrc
}

$*
