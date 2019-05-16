oh_my_zsh_install() {

  local ZSH="$HOME/.oh-my-zsh"

  if [ -d $ZSH ]; then
    return 0
  fi

  umask g-w,o-w

  hash git 2>/dev/null || {
    return 1
  }

  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH"

  # printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.old;
  fi

  # printf "${BLUE}Using the Oh My Zsh template file and adding it to ~/.zshrc${NORMAL}\n"
  cp "$ZSH"/templates/zshrc.zsh-template ~/.zshrc
  sed "/^export ZSH=/ c\\
  export ZSH=\"$ZSH\"
  " ~/.zshrc > ~/.zshrc-omztemp
  mv -f ~/.zshrc-omztemp ~/.zshrc
}
