#!/usr/bin/env zsh

# Holds all autoloads for zsh configuration
# Author: Andrew Kuttor

autoload -U  zsh-mime-setup && zsh-mime-setup  # run everything as if it's an executable

# Bash hotkey, like ctrl+W
autoload -U select-word-style bash && select-word-style bash

autoload -Uz compinit && compiniti

# Load Colors
autoload colors && colors

# Better Bash integration
autoload bashcompinit && bashcompinit
