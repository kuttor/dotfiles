
# ------------------------------------------------------------------------------
# ~ Environment Variables ~

export FZF_DEFAULT_OPTS_FILE="${CONFIGS}/.fzf.conf"
export FZF_BASE="$(which fzf)"
export FZF_COMPLETION_TRIGGER="~~"
export FZF_DEFAULT_HEIGHT='80%'
export FZF_TMUX_HEIGHT='80%'

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
export FZF_COMPLETION_OPTS=" \
--border \
--info=inline \
"
export FZF_DEFAULT_COMMAND=" \
fd \
--color=always \
--hidden \
--follow \
--type=file \
"
export FZF_ALT_C_COMMAND=" \
fd \
--hidden \
--follow \
--type=d \
"

# ------------------------------------------------------------------------------
# ~ Completions ~

export ENHANCD_FILTER=fzf
export ENHANCD_COMPLETION_BEHAVIOR=list

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# cd (and enhancd) previe/Users/andrew.kuttor/.local/share/zinit/polaris/binw
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
