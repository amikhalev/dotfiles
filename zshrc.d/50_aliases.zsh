alias sshu="ssh -o \"UserKnownHostsFile /dev/null\""
has_command nvim && alias vim=nvim

alias gping="ping 8.8.8.8"

alias cdot="cd $DOTFILES"
updot() {
    cd $DOTFILES
    git pull --recurse-submodules
    cd -
}

if [[ `uname` = "Linux" ]]; then
    alias ls='ls --color=auto'
fi

alias t="tail -f"

alias pgen="dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 | rev | cut -b 2- | rev"

alias vimrc="$EDITOR ~/.vimrc"
alias vizrc="$EDITOR ~/.zshrc"
alias vizpl="$EDITOR ~/.zshrc.d/plugins.zsh"

alias szrc="source ~/.zshrc"
