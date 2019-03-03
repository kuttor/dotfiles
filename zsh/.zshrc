
#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0
# -----------------------------------------------------------------------------
# file: .zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

export ZDOTDIR="${${(%):-%N}:A:h}"
limit coredumpsize 0
skip_global_compinit=1
stty -ixon -ixoff # Reclaim ctrl-s and ctrl-q
_comp_options+=(globdots)

# Zompdump recompile: Added zcompile command to hasten startup time. 
{
  zcd="${ZDOTDIR:-$HOME}/.zcompdump"
  [[ -s "$zcd" && (! -s "${zcd}.zwc" || "$zcd" -nt "${zcd}.zwc") ]] && zcompile "$zcd"
} &!

# OS describing logic
[[ "$(uname -s)" == "Darwin" ]] &&\
    echo "You're using OSX";\
    source "$HOME/.iterm2_shell_integration.zsh";\

    # Ubuntu's Command-Not-Found functionality
    [ brew command command-not-found-init >/dev/null 2>&1 ] && eval "$(brew command-not-found-init)"

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

