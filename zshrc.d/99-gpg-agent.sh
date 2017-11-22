GNUPGHOME=${GNUPGHOME:-"$HOME/.gnupg"}

GPG_TTY=$(tty)

# Set SSH to use gpg-agent if it is configured to do so
GNUPGCONFIG="$GNUPGHOME/gpg-agent.conf"
if [ -r "$GNUPGCONFIG" ] && grep -q enable-ssh-support "$GNUPGCONFIG"; then
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK="$GNUPGHOME/S.gpg-agent.ssh"
fi

