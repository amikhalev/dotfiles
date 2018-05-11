if which systemctl 1>/dev/null; then
    user_commands=(
      list-units is-active status show help list-unit-files
      is-enabled list-jobs show-environment)

    sudo_commands=(
      start stop reload restart try-restart isolate kill
      reset-failed enable disable reenable preset mask unmask daemon-reload
      link load cancel set-environment unset-environment)

    for c in $user_commands $sudo_commands; do; alias sc-$c="systemctl $c"; done
    for c in $user_commands $sudo_commands; do; alias scu-$c="systemctl --user $c"; done
fi

if which journalctl 1>/dev/null; then
    alias jctl="journalctl"
fi

