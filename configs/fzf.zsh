
# -- BUILTIN Env-Vars ---------------------------------------------------------

# Execute completion hotkey: Default="**"
export FZF_COMPLETION_TRIGGER='~~'

# Commons | Completion Output Options
export FZF_COMPLETION_OPTS='\
--border \
--info=inline \
'

# Base Launcher Command
export FZF_DEFAULT_COMMAND="\
fd \
--color=always \
--hidden \
--follow \
--type=file \
"

# Base Output Defaults
export FZF_DEFAULT_OPTS=" \
--bind='ctrl-j:accept' \
--border='sharp' \
--cycle \
--exit-0 \
--layout='reverse' \
--margin='0' \
--marker='✓ ', \
--no-height \
--pointer='▶ ' \
--color=\
dark,\
gutter:-1,\
bg:-1,\
bg+:-1,\
fg:-1,\
fg+:-1,\
hl:#5fff87,\
hl+:#ffaf5f, \
info:#af87ff,\
prompt:#5fff87,\
pointer:#ff87d7,\
marker:#ff87d7,\
spinner:#ff87d7\
"

export FZF_ALT_C_COMMAND='fd --hidden --follow --type=d'

# Canvas setting
export FZF_DEFAULT_HEIGHT='80%'
export FZF_TMUX_HEIGHT='80%'


# -- Functions ----------------------------------------------------------------

# -- fd ~ list path candidates. "$1" is base path to start traversal
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# -- fd ~ list directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

_fzf_setup_completion path ag git

_fzf_setup_completion dir tree

# -- Completions --------------------------------------------------------------

ENHANCD_COMPLETION_BEHAVIOR=list

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# cd (and enhancd) preview
zstyle ':fzf-tab:complete:(\\|*)cd:*' fzf-preview 'exa -1 --color=always --icons $realpath'
# systemd unit status preview
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
# environment variable preview
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
# preview file contents
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|fzf_preview %s'
# but don't preview options and subcommands
zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
zstyle ':fzf-tab:complete:*:argument-2' fzf-preview
