zle -N autopair-insert
zle -N autopair-close
zle -N autopair-delete

local p
for p in ${(@k)AUTOPAIR_PAIRS}; do
    bindkey "$p" autopair-insert
    bindkey -M isearch "$p" self-insert

    local rchar="$(_ap-get-pair $p)"
    if [[ $p != $rchar ]]; then
        bindkey "$rchar" autopair-close
        bindkey -M isearch "$rchar" self-insert
    fi
done

bindkey "$key[Backspace]" autopair-delete
bindkey -M isearch "$key[Backspace]" backward-delete-char
