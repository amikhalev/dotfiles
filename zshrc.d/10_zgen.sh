#
# All zgen bundles for zsh
#

source $HOME/.dotfiles/zgen/zgen.zsh

if ! zgen saved; then

    # oh-my-zsh plugins
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/pass

    # Other plugins
    zgen load unixorn/autoupdate-zgen # update zgen + plugins every 7 days
    zgen load supercrabtree/k
    zgen load creationix/nvm nvm.sh
    zgen load greymd/docker-zsh-completion

    # Package manager plugins
    if [[ `uname` == 'Linux' ]]; then # Linux (probably arch linux)
        zgen oh-my-zsh plugins/archlinux
        zgen oh-my-zsh plugins/systemd
    elif [[ `uname` == 'Darwin' ]]; then # Mac OS X
        zgen oh-my-zsh plugins/osx
        zgen oh-my-zsh plugins/brew
    fi

    # Theme
    zgen load nojhan/liquidprompt

    # These must be in this order
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-completions src

    zgen save
fi

