# case insensitive path-completion 
zstyle  ':completion:*' matcher-list \
        'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
        'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' \
        'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' \
        'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

