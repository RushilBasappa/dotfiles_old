#!/bin/zsh
autoload -Uz colors; colors
autoload -Uz is-at-least; is-at-least

files=( "vimrc" "vimrc.after" "zshrc.after" "gitconfig")
machine=$(uname -s)

source variables.sh

for file in ./{library,helpers}/*; do
  source $file
done

if [[ -z $ZSH_VERSION ]]; then
  printf "zplug requires zsh 4.1.9 or newer\n"
  exit 1
fi

main(){
  execute \
    --title "Check if Machine is supported" \
    --error "Not supported $machine" \
    "sleep 1" "check_machine"
  execute \
    --title "Checking if your zsh version is newer than 4.1.9" \
    "sleep 1" "is-at-least 4.1.9"
  execute \
    --title "Oh My Zsh Installation" \
    --error "Is Git Installed?" \
    --error "Check if git clone is failing" \
    "sleep 1" "oh_my_zsh_install"
  execute \
    --title "Modify zshrc" \
    "sleep 1" "modify_zshrc"
  execute \
    --title "Installing zplug to $ZPLUG_HOME" \
    --error "Is git installed?" \
    --error "Does '$ZPLUG_HOME' already exist?" \
    "sleep 1" "install_zplug"
  execute \
    --title "Create symlinks" \
    "sleep 1" "create_symlinks"
}

main
