#!/usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# Color for different groups and their descriptions.
FZF_TAB_GROUP_COLORS=(
    $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS

# Main completion configuration for fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color="always" $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup # use fzf-tmux-popup
zstyle ':fzf-tab:*' continuous-trigger '/'        # ends and starts new complete with '/'
zstyle ':fzf-tab:*' switch-group '<' '>' # switch group using `<` and `>`
zstyle ':completion:*:git-checkout:*' sort false  # disable sort when completing `git checkout`
zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support
zstyle ':completion:*' menu nocd # force no show menu, requirement for fzf-tab
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-j:accept' 'ctrl-a:toggle-all'
# apply to all command
zstyle ':fzf-tab:*' popup-min-size 50 8
# only apply to 'diff'
zstyle ':fzf-tab:complete:diff:*' popup-min-size 80 12

zstyle ':fzf-tab:complete:*' fzf-bindings \
	'ctrl-v:execute-silent({_FTB_INIT_}code "$realpath")' \
  'ctrl-e:execute-silent({_FTB_INIT_}kwrite "$realpath")'

# Setup file preview - keep adding commands we might need preview for
function PREVIEW_SNIPPET() {
  local RPATH=$(realpath $1)
  [[ -d $RPATH ]] && lsd -1 --color="always" $RPATH;
  [[ -f $RPATH ]] && bat -pp --color="always" --line-range :30 $RPATH || exit;
}

# Apply preview for commands
zstyle ':fzf-tab:complete:bat:*'  fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:c:*'    fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:cat:*'  fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:cd:*'   fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:cp:*'   fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:ls:*'   fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:lsd:*'  fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:mv:*'   fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:nvim:*' fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:rg:*'   fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:rm:*'   fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:v:*'    fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:vi:*'   fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:vim:*'  fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:z:*'    fzf-preview $(PREVIEW_SNIPPET)
zstyle ':fzf-tab:complete:zd:*'   fzf-preview $(PREVIEW_SNIPPET)


# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zoxide:*' query-string input

#accept-line
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

# Prefix color
zstyle ':fzf-tab:*' prefix '·'

# Enable fzf completion
# enable-fzf-tab
