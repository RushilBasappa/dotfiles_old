oh_my_zsh_install() {

  ZSH=~/.oh-my-zsh

  if [ -d $ZSH ]; then
    return 0
  fi

  umask g-w,o-w

  command -v git >/dev/null 2>&1 || {
    return 1
  }

  env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH" || {
    return 1
  }

  # printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
  fi

  # printf "${BLUE}Using the Oh My Zsh template file and adding it to ~/.zshrc${NORMAL}\n"
  cp "$ZSH"/templates/zshrc.zsh-template ~/.zshrc
  sed "/^export ZSH=/ c\\
  export ZSH=\"$ZSH\"
  " ~/.zshrc > ~/.zshrc-omztemp
  mv -f ~/.zshrc-omztemp ~/.zshrc

  TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    if hash chsh >/dev/null 2>&1; then
      chsh -s $(grep /zsh$ /etc/shells | tail -1)
    fi
  fi

  env zsh -l
}
