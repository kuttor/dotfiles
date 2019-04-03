#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# file: .zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com

export ZDOTDIR="${${(%):-%N}:A:h}"
limit coredumpsize 0
skip_global_compinit=1
stty -ixon -ixoff # Reclaim ctrl-s and ctrl-q
_comp_options+=(globdots)

# OS describing logic
[[ "$(uname -s)" == "Darwin" ]] && echo "You're using OSX"
  msys*)    echo "WINDOWS"          ;;
   OS=$(cat /etc/*release | grep ^NAME | tr -d 'NAME="')'"')

# Sources
source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/paths.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/colors.zsh"
source "$ZDOTDIR/completes.zsh"
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/zkbd.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/zplug.zsh"
source "$HOME/.iterm2_shell_integration.zsh"
dedupe_path # Remove any duplicate paths

# PyEnv
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"

# Ubuntu's Command-Not-Found functionality
[ brew command command-not-found-init >/dev/null 2>&1 ] &&\
    eval "$(brew command-not-found-init)"

# Zompdump recompile: Added zcompile command to hasten startup time.
{
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]] &&\
      zcompile "$zcompdump"
} &!

# Quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Use ZMV
autoload -U zmv
alias zmv="noglob zmv -W"

# -----------------------------------------------------------------------------
# run-help
# -----------------------------------------------------------------------------
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

