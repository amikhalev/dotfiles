# Antigen
source $HOME/.homesick/repos/antigen/antigen.zsh

antigen use oh-my-zsh

# oh-my-zsh plugins
antigen bundle git
antigen bundle sudo
antigen bundle command-not-found

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
        # aura functions
        aupg() {
            sudo aura -Syu --noconfirm && sudo aura -Ayux --noconfirm
        }
elif [[ `uname` == 'Darwin' ]]; then # Mac OS X
        antigen bundle brew
fi

# Theme
antigen bundle nojhan/liquidprompt
# antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

antigen apply

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Use homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='vim'
bindkey -v

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

