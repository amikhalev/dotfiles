#
# All zplug plugins
#

[ -d "$ZPLUG_HOME" ] && source "$ZPLUG_HOME/init.zsh" || \
    { echo "zplug is not installed"; return 1 }

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# oh-my-zsh plugins
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/pass", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh

# Other plugins
#zplug "supercrabtree/k"
#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    as:command, \
#    rename-to:fzf, \
#    use:"*darwin*amd64*"

# Package manager plugins
if [[ `uname` == 'Linux' ]]; then # Linux (probably arch linux)
    zplug "plugins/archlinux", from:oh-my-zsh
    zplug "plugins/systemd", from:oh-my-zsh
elif [[ `uname` == 'Darwin' ]]; then # Mac OS X
    zplug "plugins/osx", from:oh-my-zsh
fi

# Theme
zplug "nojhan/liquidprompt"
# zplug mafredri/zsh-async, from:github
# zplug intelfx/pure, use:pure.zsh, from:github, as:theme
# zplug themes/funky, from:oh-my-zsh, as:theme
# zplug denysdovhan/spaceship-zsh-theme, use:spaceship.zsh, from:github, as:theme
# zplug "dracula/zsh", from:github, as:theme

# These must be last
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-completions", use:src, defer:2
zplug "lukechilds/zsh-better-npm-completion", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install out of date plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load $($_ZSHRC_IS_DEBUG && echo "--verbose")

