export LANG=en_US.UTF-8

if which nvim 1>/dev/null; then
    export EDITOR=`which nvim`
else
    export EDITOR=`which vim`
fi

export GOPATH="$HOME/Programming/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN:$HOME/.cargo/bin"

export NVM_DIR="$HOME/.nvm"
NVM="$HOME/.zgen/creationix/nvm-master/nvm.sh"
. "$NVM" # This loads nvm

[ -e $HOME/.bashrc.local ] && source $HOME/.bashrc.local


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
