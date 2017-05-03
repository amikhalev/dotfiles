#/usr/bin/env zsh
# Configures zsh completion settings.
#

fpath+="$HOME/.zfunc"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Move .zcompdump and .zcompcache to the $XDG_CACHE_HOME folder (cleans up the home directory)
zstyle ':completion:*:' cache-path $ZSH_CACHE_DIR/zcompcache 

autoload -U +X bashcompinit;

export ANTIGEN_COMPDUMPFILE=$ZSH_CACHE_DIR/zcompdump
# compinit -d 
bashcompinit

