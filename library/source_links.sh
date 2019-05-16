create_symlinks(){
  for file in $files; do
    ln -svf ${PWD}/conf/$file ${HOME}/.$file
  done
  add_source_link "zshrc.after" "zshrc"
}

add_source_link(){
  grep -q -F "source ~/.$1" ~/.$2 || echo "source ~/.$1" >> ~/.$2
}
