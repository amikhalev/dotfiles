alias sshu="ssh -o \"UserKnownHostsFile /dev/null\""
[[ `uname` == 'Linux' ]] && alias ls="ls --color=auto"
has_command nvim && alias vim=nvim

alias gping="ping 8.8.8.8"

alias cdotfiles="cd $HOME/.dotfiles"
alias updotfiles="cd $HOME/.dotfiles && git pull --recurse-submodules || cd -"
