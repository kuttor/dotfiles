#! /usr/bin/env zsh

# ==============================================================================
# -- keybinds ------------------------------------------------------------------
# ==============================================================================

# to add other keys to this hash, see: man 5 terminfo

#stty intr '^C'        # Ctrl+C cancel
#stty susp '^Z'        # Ctrl+Z suspend
#stty stop undef

# Mac keyboard specific keybindings

# The host is using OSX terminal, as set in
# 89-ssh-enhancements
if [[ "$LC_TERM_PROGRAM" == "iTerm.app" ]]
then
  bindkey "\e\e[D" backward-word # alt + <-
  bindkey "\e\e[C" forward-word  # alt + -> 
  bindkey '^[[H'   beginning-of-line
  bindkey '^[[F' end-of-line
fi


typeset -g -A key
key[End]="${terminfo[kend]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Home]="${terminfo[khome]}"
key[Left]="${terminfo[kcub1]}"
key[PageUp]="${terminfo[kpp]}"
key[Right]="${terminfo[kcuf1]}"
key[Delete]="${terminfo[kdch1]}"
key[Insert]="${terminfo[kich1]}"
key[PageDown]="${terminfo[knp]}"
key[Backspace]="${terminfo[kbs]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"        delete-char
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"           end-of-line
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"         forward-char
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"          backward-char
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"        overwrite-mode
[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"          beginning-of-line
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"            up-line-or-history
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"     backward-delete-char
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"          down-line-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# ------------------------------------------------------------------------------
# ~ Custom Keybindings ~
# ------------------------------------------------------------------------------
bindkey " " magic-space
bindkey "^I" expand-or-complete-with-dots
bindkey "^N" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^X^L" insert-last-command-output && zle -N insert-last-command-output
bindkey "^[[1;2C" forward-word
bindkey "^[[1;2D" backward-word
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[^[[C" end-of-line
bindkey "^[^[[D" beginning-of-line
bindkey '^Xh' _complete_help

# shift-tab ~ reverse-menu-completion
bindkey '^[[Z' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

# copy buffer
bindkey '^X^Y' pbcopy-buffer
bindkey '^Xy' pbcopy-buffer
bindkey '^[u' undo
bindkey '^[r' redo

# edit command-line using editor (like fc command)
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
#bindkey "^E" edit-command-line

bindkey -e

# Enable History Search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# exit shell in middle of line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh
