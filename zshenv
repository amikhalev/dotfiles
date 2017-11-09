export LANG=en_US.UTF-8

PATH_ORIG="$PATH"
if [ `uname` = "Darwin" ]; then
    # PATH does not get set on macOS until /etc/zprofile is loaded, which is after zshenv
    PATH="$path:/usr/local/bin"
fi
if which nvim 1>/dev/null; then
    export EDITOR=`which nvim`
else
    export EDITOR=`which vim`
fi

export GOPATH="$HOME/Programming/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH_ORIG:$GOBIN:$HOME/.cargo/bin"

export NVM_DIR=$HOME/.nvm

export ZSHRC_DIR=$HOME/.zshrc.d
export ZSH_CACHE_DIR=${XDG_CACHE_DIR:-$HOME/.cache}/zsh
mkdir -p $ZSH_CACHE_DIR

[ -e $HOME/.zshenv.local ] && source $HOME/.zshenv.local
