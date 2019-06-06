#!/bin/bash

machine=$(uname -s)

check_machine(){
  case $machine in
    Darwin)
      ;;
    *)
      echo "Machine not supported"
      return 1
      ;;
  esac
}

check_machine
