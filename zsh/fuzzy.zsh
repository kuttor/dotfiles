#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------

source $(brew --prefix)/opt/fzf/shell/completion.zsh

FZF_DEFAULT_OPTS="
  --extended-exact
  --height 100%
  --cycle
  --reverse"

FZF_DEFAULT_OPTS+="
  --bind pgup:preview-up
  --bind pgdn:preview-down
  --bind ctrl-f:jump
  --bind ctrl-k:kill-line
  --bind ctrl-p:toggle-preview
  --bind ctrl-a:select-all"

#FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fzf + ag configuration
if _has fzf && _has ag
then
    export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='
    --color fg:242,bg:236,hl:65
    --color fg+:15,bg+:239,hl+:108
    --color info:108,prompt:109
    --color spinner:108,pointer:168,marker:168
    '
fi

# fzf + ripgrep configuration
if _has fzf && _has rg
then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git}" 2>/dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS=''
fi

# Add <TAB> completion handlers for fzf *after* fzf is loaded
_fzf_complete_z() {
    _fzf_complete '--multi --reverse' "$@" < <(raw_z)
}

# z.lua
# -----------------------------------------------------------------------------
#eval "$(lua $ZPLUG_REPOS/skywind3000/z.lua/z.lua --init zsh)"
_ZL_CMD="y" # command alias
_ZL_DATA="$CONFIG/zdatafile.lua" # datafile location
_ZL_ECHO=1 # Echo dirname after CD
_ZL_MATCH_MODE=1 # Enable enhanced master

