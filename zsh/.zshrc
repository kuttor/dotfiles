#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0
# -----------------------------------------------------------------------------
# file: .zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

limit coredumpsize 0
skip_global_compinit=1
_comp_options+=(globdots)

# Ubuntu's Command-Not-Found functionality
if brew command command-not-found-init >/dev/null 2>&1
then
  eval "$(brew command-not-found-init)"
fi

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


# Returns whether the given command is executable or aliased.
_has() { return $( whence $1 >/dev/null ) }

# Returns whether the given statement executed cleanly. Try to avoid this
# because this slows down shell loading.
_try() { return $( eval $* >/dev/null 2>&1 ) }

# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
_is() { return $( [ "$HOSTTYPE" = "$1" ] ) }

# Interactive/verbose commands.
alias mv='mv -i'
for c in cp rm chmod chown rename
do
  alias $c="$c -v"
done

alias v='vim -R -'
for i in /usr/share/vim/vim*/macros/less.sh(N)
do
  alias v="$i"
done

# Show dots while waiting to complete. Useful for systems with slow net access,
# like those places where they use giant, slow NFS solutions. (Hint.)
expand-or-complete-with-dots() {
    echo -n "\e[31m......\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Use ZMV
autoload -U zmv
alias zmv="noglob zmv -W"

# run-help
autoload -Uz run-help-git
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# Reclaim ctrl-s and ctrl-q
stty -ixon -ixoff

# Manage SSH keys with keychain
if $(command -v keychain >/dev/null)
then
  keychain id_rsa
  source "$HOME/.keychain/$(hostname)-sh"
fi

# -----------------------------------------------------------------------------
# Sources
# -----------------------------------------------------------------------------
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
