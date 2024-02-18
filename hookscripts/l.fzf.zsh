# use alternate sequence since ** will expand paths
export FZF_COMPLETION_TRIGGER='~~'
# 80% seems to be good in most sizes and doesn't hide the actual prompt
export FZF_DEFAULT_HEIGHT='80%'
export FZF_TMUX_HEIGHT='80%'
# some styling, but more importantly, use space as not literal, but to accept suggestion
export FZF_DEFAULT_OPTS="--height=80% --layout=reverse --border=sharp --margin=0 --cycle --color=dark --color fg:15,hl:10,bg+:237,hl+:2 --color gutter:-1,info:10,prompt:13,spinner:11,pointer:14,marker:12 --prompt=' ' --marker='✓ ' --pointer='▶ ' --bind \ :accept"
# make sure that directory completion and file completion uses fd instead
export FZF_DEFAULT_COMMAND='fd --hidden --follow --type=f'
_fzf_compgen_path() { fd --hidden --follow --type=f }
export FZF_ALT_C_COMMAND='fd --hidden --follow --type=d'
_fzf_compgen_dir() { fd --hidden --follow --type=d }
