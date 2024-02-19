if [[ ! -r "${ZINIT[COMPLETIONS_DIR]}/_gh" ]]; then
    gh completion -s zsh > "${ZINIT[COMPLETIONS_DIR]}/_gh"
fi
