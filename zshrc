#
# Sources all files in $ZSHRC_DIR
#

setopt localoptions extendedglob

if [[ ( $PROFILE_STARTUP ) ]]; then
    STARTLOG=$HOME/startlog.$$
    PS4=$'\\\011%D{%s%6.}\011%x\011%I\011%N\011%e\011'
    exec 3>&2 2>$STARTLOG
    setopt xtrace prompt_subst
fi

for config in "$ZSHRC_DIR"/*.*sh; do
    if [[ ( $PROFILE_STARTUP ) ]]; then
        echo "Loading $config"
    fi
    source $config || { echo "Startup script at '$config' returned failure status code $?"; }
done

if [[ ( $PROFILE_STARTUP ) ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
    echo "Wrote startlog to $STARTLOG"
fi

