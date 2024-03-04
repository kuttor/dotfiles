# case insensitive path-completion
zstyle ':completion:*' matcher-list \
  'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' \
  'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' \
  'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# -- Ignore --
zstyle ':completion::complete:*:*:files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
zstyle ':completion::complete:*:*:globbed-files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
zstyle ':completion::complete:rm:*:globbed-files' ignored-patter
