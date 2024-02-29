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

for function in $HOME/.dotfiles/autoloads/*; do
  autoload $function
done


# --  Path Related Aliases --
alias path_list='echo "$PATH" | tr ":" "\n"'
alias fpath_list='echo "$FPATH" | tr ":" "\n"'
