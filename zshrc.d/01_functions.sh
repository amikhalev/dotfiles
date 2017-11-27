# Global functions/variables

mkdir -p $ZSH_CACHE_DIR

has_command() {
    command -v $1 1>/dev/null
}

path() {
    tr -s ':' '\n' <<<$PATH
}

