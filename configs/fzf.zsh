
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

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'eza --tree -C {}'"

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# ------------------------------------------------------------------------------
# ~ Completions ~

export ENHANCD_FILTER=fzf
export ENHANCD_COMPLETION_BEHAVIOR=list

# # cd (and enhancd) previe/Users/andrew.kuttor/.local/share/zinit/polaris/binw
# zstyle ':fzf-tab:complete:(\\|*)cd:*' fzf_preview 'exa -1 --color=always --icons $realpath'
# # systemd unit status preview
# zstyle ':fzf-tab:complete:systemctl-*:*' fzf_preview 'SYSTEMD_COLORS=1 systemctl status $word'
# # environment variable preview
# zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf_preview 'echo ${(P)word}'
# # give a preview of commandline arguments when completing `kill`
# zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf_preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
# zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
# # preview file contents
# zstyle ':fzf-tab:complete:*:*' fzf_preview 'less ${(Q)realpath}'
# export LESSOPEN='|fzf_preview %s'

# but don't preview options and subcommands
zstyle ':fzf-tab:complete:*:options'    fzf
zstyle ':fzf-tab:complete:*:argument-1' fzf_preview
zstyle ':fzf-tab:complete:*:argument-2' fzf_preview

zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors \${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion::complete:*:*:files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
zstyle ':completion::complete:*:*:globbed-files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
zstyle ':completion::complete:rm:*:globbed-files' ignored-patterns
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' fzf-flags '--ansi'
zstyle ':fzf-tab:*' fzf-bindings \
  'tab:accept' \
  'ctrl-y:preview-page-up' \
  'ctrl-v:preview-page-down' \
  'ctrl-e:execute-silent(\${VISUAL:-code} \$realpath >/dev/null 2>&1)' \
  'ctrl-w:execute(\${EDITOR:-nano} \$realpath >/dev/tty </dev/tty)+refresh-preview'
zstyle ':fzf-tab:*' fzf-min-height 15
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
  'git diff --no-ext-diff \$word | delta --paging=never --no-gitconfig --line-numbers --file-style=omit --hunk-header-style=omit --theme=base16'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
  'git --no-pager log --color=always --format=oneline --abbrev-commit --follow \$word'
zstyle ':fzf-tab:complete:man:*' fzf-preview \
  'man -P \"col -bx\" \$word | $FZF_PREVIEW_FILE_COMMAND --language=man'
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview \
  'brew info \$word'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview \
  'echo \${(P)word}'
zstyle ':fzf-tab:complete:*:options'    fzf-preview
zstyle ':fzf-tab:complete:*:options'    fzf-flags '--no-preview'
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
zstyle ':fzf-tab:complete:*:argument-1' fzf-flags '--no-preview'
zstyle ':fzf-tab:complete:*:*'          fzf-preview \
  '($FZF_PREVIEW_FILE_COMMAND \$realpath || $FZF_PREVIEW_DIR_COMMAND \$realpath) 2>/dev/null'