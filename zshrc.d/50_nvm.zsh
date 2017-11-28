#
# Sets up NVM
#

function nvm() {
    # This loads nvm
    [ -s "$NVM_DIR/nvm.sh" ] || (
        read -q "RESP?nvm is not installed. Would you like to install it? [Y/n]: "
        echo
        if [[ $RESP != (y|Y) ]]; then return 1; fi
        echo Installing nvm...
        git clone https://github.com/creationix/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout $(git describe --abbrev=0 --tags --match "v[0-9]*" origin)
        return 0
    ) && . "$NVM_DIR/nvm.sh" || { echo "Unable to load nvm"; return 127 }
    nvm "${@}"
}

