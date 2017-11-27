# Configures zsh completion settings.
#

# Move .zcompdump and .zcompcache to the $XDG_CACHE_HOME folder (cleans up the home directory)
zstyle ':completion:*:' cache-path $ZSH_CACHE_DIR/zcompcache 

autoload -U +X bashcompinit;
bashcompinit

[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" || :  # This loads nvm bash_completion

