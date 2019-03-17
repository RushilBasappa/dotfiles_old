check_machine(){
  case $machine in
    Linux | Darwin)
      ;;
    *)
      return 1
      ;;
  esac
}

