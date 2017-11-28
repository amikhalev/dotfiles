#
# Loads zsh config by sourcing all files in $ZSHRC_DIR
#

_ZSHRC_IS_DEBUG=$( [[ "$DEBUG" = (1|true) ]] && echo true || echo false )

if $_ZSHRC_IS_DEBUG; then
    _zshrc_debug() {
        echo "DEBUG: $@"
    }
else
    _zshrc_debug() {
    }
fi

if [ -d "$ZPLUG_HOME" ]; then
    source "$ZPLUG_HOME/init.zsh"

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install out of date plugins? [y/N]: "
        if read -q; then
            echo
            zplug install
        fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load $($_ZSHRC_IS_DEBUG && echo "--verbose")
else
    echo "WARN: zplug is not installed"
fi

unfunction _zshrc_debug

