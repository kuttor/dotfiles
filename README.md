#!/bin/bash

## dotfiles
Repo for my personal dotfiles

## Setup 

# Add following lines to ~/.bashrc
[ -f /etc/hosts ]
  && echo "wsl.conf file exists"
  || cp wsl.conf /etc/wsl.conf


