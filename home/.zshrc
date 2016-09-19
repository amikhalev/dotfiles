# Use homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# For vim
if [ ! -e "$HOME/.vim/bundle/neobundle.vim" ]; then
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# Antigen
if [ ! -e "$HOME/.homesick/repos/antigen" ]; then
    homeshick clone https://github.com/zsh-users/antigen.git
fi
source $HOME/.homesick/repos/antigen/antigen.zsh

# antigen use oh-my-zsh

# oh-my-zsh plugins
antigen bundle git
antigen bundle sudo
antigen bundle command-not-found
antigen bundle pip

# Other plugins
antigen bundle zsh-users/zsh-syntax-highlighting
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
        PHP_AUTOCONF="/usr/local/bin/autoconf"
        export PATH="/usr/local/sbin:$PATH"
        alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
        alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
        alias nginx.restart='nginx.stop && nginx.start'
        alias php-fpm.start="sudo launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
        alias php-fpm.stop="sudo launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
        alias php-fpm.restart='php-fpm.stop && php-fpm.start'
        alias mysql.start="sudo launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
        alias mysql.stop="sudo launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
        alias mysql.restart='mysql.stop && mysql.start'
        alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
        alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
        alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
        alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
        alias nginx.logs.phpmyadmin.error='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.error.log'
        alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'
fi

# Theme
antigen bundle nojhan/liquidprompt
# antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

antigen apply

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
unsetopt AUTO_CD

export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='vim'
# bindkey -v

alias sshu="ssh -o \"UserKnownHostsFile /dev/null\""
alias ls="ls --color=auto"

export PATH="$PATH:$HOME/.composer/vendor/bin"

alias gping="ping 8.8.8.8"

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export TERM=screen-256color
