modify_zshrc(){
  local TAB=$'\t'
  local PLUGINS="brew colored-man-pages docker git globalias history kubectl npm osx rails sudo vagrant vscode yarn z"

  sed "/^#/d;/^$/d;/plugins/{n;s/.*/${TAB}${PLUGINS}/;}" ~/.zshrc > ~/.zshrc-tmp
  mv ~/.zshrc-tmp ~/.zshrc
}
