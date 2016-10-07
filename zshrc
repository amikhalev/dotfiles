# Antigen
source $HOME/.dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

# oh-my-zsh plugins
antigen bundle git
antigen bundle sudo
antigen bundle command-not-found
antigen bundle pip

# Other plugins
antigen bundle zsh-users/zsh-completions src
antigen bundle arialdomartini/oh-my-git
antigen bundle peterhurford/git-it-on.zsh
antigen bundle supercrabtree/k
antigen bundle caarlos0/zsh-open-pr

# Package manager plugins
if [[ `uname` == 'Linux' ]]; then # Linux (probably arch linux)
        antigen bundle archlinux
        antigen bundle systemd
        eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
elif [[ `uname` == 'Darwin' ]]; then # Mac OS X
        antigen bundle brew
fi

# Theme
antigen bundle nojhan/liquidprompt
# antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

# Syntax highlighting must be last
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

source $HOME/.aliases
