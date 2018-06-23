#
# All zplug plugins
#

# Manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Load defined zshrc.d files
zplug "~/.zshrc.d", from:local, use:"<->_*.zsh"

# oh-my-zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/pass", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh

# Other plugins
zplug "supercrabtree/k"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf

# Package manager plugins
if [[ `uname` == 'Linux' ]]; then # Linux (probably arch linux)
    zplug "plugins/archlinux", from:oh-my-zsh
    zplug "plugins/debian", from:oh-my-zsh
    zplug "plugins/systemd", from:oh-my-zsh
elif [[ `uname` == 'Darwin' ]]; then # Mac OS X
    zplug "plugins/osx", from:oh-my-zsh
    zplug "/usr/local/share/zsh-completions", from:local
fi

# Theme
# zplug "nojhan/liquidprompt"
zplug mafredri/zsh-async, from:github
zplug intelfx/pure, use:pure.zsh, from:github, as:theme
# zplug "caiogondim/bullet-train.zsh", from:github, as:theme

# These must be last
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-completions"
zplug "lukechilds/zsh-better-npm-completion"

