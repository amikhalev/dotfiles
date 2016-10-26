#/usr/bin/env zsh
# Configures zsh completion settings.
#

# Move .zcompdump and .zcompcache to the $XDG_CACHE_HOME folder (cleans up the home directory)
zstyle ':completion:*:' cache-path $ZSH_CACHE_DIR/zcompcache 

autoload -U +X bashcompinit;

compinit -d $ZSH_CACHE_DIR/zcompdump
bashcompinit

