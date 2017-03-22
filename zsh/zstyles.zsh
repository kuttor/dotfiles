#!/usr/bin/env zsh

#--------------------------------------------------------------------#
# File: Complete.zsh                                                     #
#                                                                    #
# Usage: Source file for Zsh Completions                             #
#                                                                    #
# Author: Andrew Kuttor                                              #
#--------------------------------------------------------------------#

zstyle ':completion:*' cache-path ~/.cache/zsh


# AWS CLI
aws_completer="$HOME/.local/bin/aws_zsh_completer.sh"
[ -f "${aws_completer}"  ] && source $aws_completer;



