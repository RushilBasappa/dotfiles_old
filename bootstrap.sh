#!/bin/zsh
autoload -Uz colors; colors
autoload -Uz is-at-least; is-at-least

for file in ./{library,helpers}/*; do
  source $file
done

machine=$(uname -s)

# if [[ -z $ZSH_VERSION ]]; then
#     printf "zplug requires zsh 4.1.9 or newer\n"
#     exit 1
# fi

if [[ -z $ZPLUG_HOME ]]; then
    export ZPLUG_HOME=~/.zplug
fi

check_machine(){
  case $machine in
    Linux | Darwin)
      ;;
    *)
      return 1
      ;;
  esac
}

modify_zshrc(){
  local TAB=$'\t'
  local PLUGINS="git docker kubectl globalias"

  sed "/^#/d;/^$/d;/plugins/{n;s/.*/${TAB}${PLUGINS}/;}" ~/.zshrc > ~/.zshrc-tmp
  mv ~/.zshrc-tmp ~/.zshrc
}


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
}

main
