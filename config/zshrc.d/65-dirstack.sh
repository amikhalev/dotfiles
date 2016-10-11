#!/usr/bin/env zsh

# Configure directory stack
DIRSTACKSIZE=10
DIRSTACKFILE=$ZSH_CACHE_DIR/zdirstack

# The load dirs into stack from given file.
if [[ -f $DIRSTACKFILE && $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi

# At last we add a function to store dirs stack on dir change.
function chpwd () {
    print -l $PWD ${(u)dirstack} > $DIRSTACKFILE
}

