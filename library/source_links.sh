create_symlinks(){
  for file in $files; do
    ln -svf ${PWD}/conf/$file ${HOME}/.$file
  done
  add_source_link "zshrc.after" "zshrc"
  add_vscode_settings_link "settings" "zshrc"
}

add_source_link(){
  grep -q -F "source ~/.$1" ~/.$2 || echo "source ~/.$1" >> ~/.$2
}

add_vscode_settings_link(){
  ln -svf ${PWD}/conf/settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json
}
