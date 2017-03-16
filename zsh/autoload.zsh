#!/usr/bin/env zsh

# Holds all autoloads for zsh configuration
# Author: Andrew Kuttor

autoload -U colors zsh-mime-setup select-word-style
colors          # colors
zsh-mime-setup  # run everything as if it's an executable
select-word-style bash # ctrl+w on words

autoload -Uz compinit && compiniti

# Load Colors
autoload colors && colors


