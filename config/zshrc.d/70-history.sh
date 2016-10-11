#!/usr/bin/env zsh
# Configures zsh history

HISTFILE=$ZSH_CACHE_DIR/histfile
HISTSIZE=10000
SAVEHIST=5000
READNULLCMD=less

# Append on every command run
setopt inc_append_history

# Retrieve every time history is needed
setopt share_history
