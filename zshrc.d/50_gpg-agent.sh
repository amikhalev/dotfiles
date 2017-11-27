if ! which gpg-agent 1>/dev/null; then
    return
fi

GNUPGHOME=$(gpgconf --list-dir homedir)

export GPG_TTY=$(tty)

if ! pgrep gpg-agent 1>/dev/null; then
    gpgconf --launch gpg-agent &
fi

# Set SSH to use gpg-agent if it is configured to do so
GNUPGCONFIG="$GNUPGHOME/gpg-agent.conf"
if [ -r "$GNUPGCONFIG" ] && grep -q enable-ssh-support "$GNUPGCONFIG"; then
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK=$(gpgconf --list-dir agent-ssh-socket)
fi

