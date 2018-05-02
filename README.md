#!/bin/bash

## dotfiles
Repo for my personal dotfiles

## Setup 

#### Add following lines to ~/.bashrc

##### wsl.conf
[ -f /etc/wsl.conf ]
  && echo "wsl.conf file exists"
  || cp wsl.conf /etc/wsl.conf

##### bashrc
[ -f $HOME/code/dotfiles/bashrc ]
  && source $HOME/code/dotfiles/bashrc
  || echo "target source file 'bashrc' not found"
