export LANG=en_US.UTF-8

if which nvim 1>/dev/null; then
    export EDITOR=`which nvim`
else
    export EDITOR=`which vim`
fi

export GOPATH="$HOME/Programming/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN:$HOME/.cargo/bin"

export ZSHRC_DIR=$HOME/.zshrc.d
export ZSH_CACHE_DIR=${XDG_CACHE_DIR:-$HOME/.cache}/zsh
mkdir -p $ZSH_CACHE_DIR
