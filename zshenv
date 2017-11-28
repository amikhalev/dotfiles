# zsh specific config
ZSHRC_DIR="$HOME/.zshrc.d"
ZSH_CACHE_DIR="${XDG_CACHE_DIR:-$HOME/.cache}/zsh"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump"
HISTFILE="$ZSH_CACHE_DIR/histfile"
export ZPLUG_HOME="$HOME/.zplug"

# editor
find_editor() {
    local ed
    # Set editor to the best vim available
    # PATH does not get set on macOS until /etc/zprofile is loaded, which is after zshenv, so for this temporarily
    # add entries to PATH
    if [ "$(uname)" = "Darwin" ]; then
        local PATH="$PATH:/usr/local/bin"
    fi

    ed=$(which -p nvim) # nvim is the best if available usually
    if (( $? != 0 )) then; 
        ed=$(which -p vim) # if not, vim is alright also
    fi
    if (( $? != 0 )) then; 
        echo $EDITOR # if no vim (wtf?), keep current EDITOR
    else
        echo $ed
    fi
}

export EDITOR=$(find_editor)

# golang
export GOPATH="$HOME/Programming/go"
export GOBIN="$GOPATH/bin"
which go 1>/dev/null && [ -e $GOBIN ] && PATH="$PATH:$GOBIN"

# rust (cargo)
export CARGO_HOME="$HOME/.cargo"
export CARGO_BIN="$CARGO_HOME/bin"
PATH="$PATH:$CARGO_BIN"

# fzf
export FZF_HOME="$HOME/.fzf"
[ -e $FZF_HOME ] && PATH="$PATH:$FZF_HOME/bin"

# nvm
export NVM_DIR="$HOME/.nvm"

# misc
DOTFILES_DIRS="$HOME/.dotfiles"

[ -e $HOME/.zshenv.local ] && source $HOME/.zshenv.local

export PATH MANPATH

