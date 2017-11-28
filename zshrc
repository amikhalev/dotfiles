#
# Sources all files in $ZSHRC_DIR
#

load_all() {
    setopt localoptions extendedglob

    local profile=$( [[ "$PROFILE_STARTUP" = (1|true) ]] && echo true || echo false )

    if $profile; then
        STARTLOG=$HOME/startlog.$$
        PS4=$'\\\011%D{%s%6.}\011%x\011%I\011%N\011%e\011'
        exec 3>&2 2>$STARTLOG
        setopt xtrace prompt_subst
    fi

    for config in "$1"/*.zsh; do
        if $profile; then
            echo "Sourcing $config"
        fi
        source $config || { echo "Startup script at '$config' returned failure status code $?"; }
    done

    if $profile; then
        unsetopt xtrace
        exec 2>&3 3>&-
        echo "Wrote startlog to $STARTLOG"
    fi
}

load_all $ZSHRC_DIR

