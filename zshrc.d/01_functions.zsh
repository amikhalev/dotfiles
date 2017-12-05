#
# Global functions/variables
#

has_command() {
    command -v $1 1>/dev/null
}

path() {
    tr -s ':' '\n' <<<$PATH
}

