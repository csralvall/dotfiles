#!/bin/bash

# Author: Tom Hudson

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    pacman -S $1
  else
    echo "Already installed: ${1}"
  fi
}

# Update and upgrade distro
sudo pacman -Syu
sudo pacman -Suu

# Install keyring to avoid signature problems
install manjaro-keyring

# Base Dev 
install vim
install tmux
install mupdf
install git

# autoremove packages
