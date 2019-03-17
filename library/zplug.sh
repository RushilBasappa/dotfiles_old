install_zplug(){
  if [ -d $ZPLUG_HOME ]; then
    return 0
  else
    git clone https://github.com/zplug/zplug.git $ZPLUG_HOME
  fi
}

uninstall_zplug(){
  rm -rf $ZPLUG_HOME
}
