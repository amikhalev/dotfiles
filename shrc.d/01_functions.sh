try_add_path() {
    local path_to_add=$1
    if [[ ":$PATH:" != *":$path_to_add:"* ]]; then
        PATH="$PATH:$path_to_add"
    fi
}

load_rc_d() {
    local source_dir=$1 extension=${2:-.sh}

    if [ "$ZSH_VERSION" ]; then
        setopt extendedglob
    elif [ "$BASH_VERSION" ]; then
        shopt -s extglob 
    else
        return
    fi

    for f in $source_dir/[0-9]*_*$extension; do
        source $f
    done
}

