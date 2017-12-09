
_pio_completion() {
    which pio 1>/dev/null && eval "$(_PIO_COMPLETE=source pio)"
    _pio_completion $@
}

complete -F _pio_completion -o default pio;
