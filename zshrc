#
# Sources all files in $ZSHRC_DIR
#

setopt localoptions extendedglob

for config in "$ZSHRC_DIR"/*.*sh; do
    . $config || { echo "Startup script at '$config' returned failure status code $?"; }
done

