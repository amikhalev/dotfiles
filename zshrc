source $HOME/.zshbundles
antigen apply

source $HOME/.aliases

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

command -v keychain 1>/dev/null && eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
export TERM=xterm
