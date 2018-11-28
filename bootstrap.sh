#!/bin/zsh
autoload -Uz colors; colors
autoload -Uz is-at-least; is-at-least

source ./library/zplug.sh

machine=$(uname -s)

if [[ -z $ZSH_VERSION ]]; then
    printf "zplug requires zsh 4.1.9 or newer\n"
    exit 1
fi

if [[ -z $ZPLUG_HOME ]]; then
    export ZPLUG_HOME=~/.zplug
fi

install_zsh(){
  echo "TEST"
}

print_machine(){
  case $machine in
    Linux)
      echo "Linux"
      ;;
    Darwin)
      echo "Darwin"
      ;;
    *)
      echo "Not supported"
      ;;
  esac
}

main(){
  # print_machine
  execute --title "Checking if your zsh version is newer than 4.1.9" "sleep 1" "is-at-least 4.1.9"
  execute --title "Machine" --value "true" "sleep 1" "print_machine"
  # install_zsh
  # spin "Title" "SUCCEEDED"
}
main
