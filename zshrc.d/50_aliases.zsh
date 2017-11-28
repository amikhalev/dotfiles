alias sshu="ssh -o \"UserKnownHostsFile /dev/null\""
has_command nvim && alias vim=nvim

alias gping="ping 8.8.8.8"

alias cdotfiles="cd $HOME/.dotfiles"
alias updotfiles="cd $HOME/.dotfiles && git pull --recurse-submodules || cd -"

alias t="tail -f"

alias pgen="dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 | rev | cut -b 2- | rev"

alias edzshrc="$EDITOR ~/.zshrc"
alias edplug="$EDITOR ~/.zshrc.d/10_zplug.zsh"
