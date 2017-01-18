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

    # Other plugins
    zgen load zsh-users/zsh-completions src
    # zgen load arialdomartini/oh-my-git
    # zgen load peterhurford/git-it-on.zsh
    zgen load supercrabtree/k
    # zgen load caarlos0/zsh-open-pr

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

    # Syntax highlighting must be last
    zgen load zsh-users/zsh-syntax-highlighting

    zgen save

fi
