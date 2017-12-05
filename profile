source "$HOME/.shrc.d/01_functions.sh"

export DOTFILES_DIRS="$HOME/.dotfiles"
export DOTFILES="$DOTFILES_DIRS"

if [ "$(uname)" = "Darwin" ]; then
    export CLICOLOR=1
fi

# editor
find_editor() {
    local found_editor
    # Set editor to the best vim available
    # PATH does not get set on macOS until /etc/zprofile is loaded, which is after zshenv, so for this temporarily
    # add entries to PATH
    if [ "$(uname)" = "Darwin" ]; then
        local PATH="$PATH:/usr/local/bin"
    fi

    found_editor=`which nvim` # nvim is the best if available usually
    if [ $? != 0 ]; then 
        found_editor=`which vim` # if not, vim is alright also
    fi
    if [ $? != 0 ]; then 
        found_editor="$EDITOR" # if no vim (wtf?), keep current EDITOR
    fi
    echo $ed
}

export EDITOR=`find_editor`
unset find_editor

# golang
export GOPATH="$HOME/Programming/go"
export GOBIN="$GOPATH/bin"
which go 1>/dev/null && [ -e $GOBIN ] && try_add_path $GOBIN

# rust (cargo)
export CARGO_HOME="$HOME/.cargo"
export CARGO_BIN="$CARGO_HOME/bin"
try_add_path $CARGO_BIN

# fzf
export FZF_HOME="$HOME/.fzf"
[ -e $FZF_HOME ] && try_add_path $FZF_HOME/bin

# nvm
export NVM_DIR="$HOME/.nvm"

[ -e $HOME/.zshenv.local ] && source $HOME/.zshenv.local

export PATH MANPATH

load_rc_d $HOME/.shrc.d .sh
