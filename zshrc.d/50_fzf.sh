# Setup fzf
# ---------

# If fzf doesn't exist, stop
if [[ ! -e $FZF_HOME ]]; then
    exit 0
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_HOME/shell/key-bindings.zsh"

