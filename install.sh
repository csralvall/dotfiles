#!/bin/bash

# Author: Tom Hudson

# Update and upgrade distro

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    apt-get install $1
  else
    echo "Already installed: ${1}"
  fi
}

# dev stuff
install vim
install tmux

# autoremove packages
