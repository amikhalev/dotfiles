#
# Loads zsh config by sourcing all files in $ZSHRC_DIR
#

_ZSHRC_IS_PROFILE=$( [[ "$PROFILE_STARTUP" = (1|true) ]] && echo true || echo false ) 

_ZSHRC_IS_DEBUG=$( [[ "$DEBUG" = (1|true) ]] || $_ZSHRC_IS_PROFILE && echo true || echo false )

if $_ZSHRC_IS_DEBUG; then
    _zshrc_debug() {
        echo "DEBUG: $@"
    }
else
    _zshrc_debug() {
    }
fi

setopt localoptions extendedglob

if $_ZSHRC_IS_PROFILE; then
    _zshrc_debug Starting startup profiling
    STARTLOG=$HOME/startlog.$$
    PS4=$'\\\011%D{%s%6.}\011%x\011%I\011%N\011%e\011'
    exec 3>&2 2>$STARTLOG
    setopt xtrace prompt_subst
fi

for config in "$ZSHRC_DIR"/*.zsh; do
    _zshrc_debug "Sourcing $config"
    source $config || { echo "Startup script at '$config' returned failure status code $?"; }
done

if $_ZSHRC_IS_PROFILE; then
    unsetopt xtrace
    exec 2>&3 3>&-
    _zshrc_debug "Wrote startlog to $STARTLOG"
fi

unfunction _zshrc_debug

