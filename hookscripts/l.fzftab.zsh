# use fzf-tmux instead of fzf
zstyle ':fzf-tab:*' fzf-command fzf-tmux

# don't sort git checkout completions since it will mess up chronological order of commits
zstyle ':completion:*:git-checkout:*' sort false

# set header style for description
zstyle ':completion:*:descriptions' format ' %d'

# color all file/directory entries with LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# use '/' to end the current completion and start a new one
zstyle ':fzf-tab:*' continuous-trigger '/'

# setup file preview - keep adding commands we might need preview for
local PREVIEW_SNIPPET='if [ -d $realpath ]; then exa -1 --color=always $realpath; elif [ -f $realpath ]; then bat -pp --color=always --line-range :30 $realpath; else exit; fi'
zstyle ':fzf-tab:complete:ls:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:cd:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:z:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:zd:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:exa:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:v:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:nvim:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:vim:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:vi:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:c:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:cat:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:bat:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:rm:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:cp:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:mv:*' fzf-preview $PREVIEW_SNIPPET
zstyle ':fzf-tab:complete:less:*' fzf-preview $PREVIEW_SNIPPET

# enable fzf completion
enable-fzf-tab
