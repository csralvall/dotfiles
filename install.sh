#!/bin/bash

# Author: Tom Hudson

# Install keyring to avoid signature problems
sudo pacman -S manjaro-keyring

# Update and upgrade distro
sudo pacman -Syu
sudo pacman -Suu

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    pacman -S install $1
  else
    echo "Already installed: ${1}"
  fi
}

# Base Dev 
install vim
install tmux

# autoremove packages
