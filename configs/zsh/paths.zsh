# Vim:Set filetype=zsh syntax=zsh

# Export existing paths.
typeset -gx path PATH
typeset -gx fpath FPATH

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/.local/bin
  /usr/local/bin
  /usr/{sbin,bin}
  /{sbin,bin}
  $path
)
