[[ -f ~/.profile ]] && . ~/.profile

# zsh specific config
ZPLUG_HOME="$HOME/.zplug"
ZPLUG_LOADFILE="$HOME/.zshrc.d/plugins.zsh"
ZSH_CACHE_DIR="$ZPLUG_HOME"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump"
HISTFILE="$ZSH_CACHE_DIR/histfile"

