HISTORY_SUBSTRING_SEARCH_FUZZY=true
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=yellow,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'

# remap up/down keys
[[ -n "$key[Up]" ]] && bindkey - "$key[Up]" history-substring-search-up
[[ -n "$key[Down]" ]] && bindkey - "$key[Down]" history-substring-search-down

# use pgup/pgdn as fallback
[[ -n "$key[PageUp]" ]] && bindkey - "$key[PageUp]" history-substring-search-up
[[ -n "$key[PageDown]" ]] && bindkey - "$key[PageDown]" history-substring-search-down
