#
# Sets up NVM
#

_zsh_nvm_has() {
  type "$1" > /dev/null 2>&1
}

_zsh_nvm_install() {
  echo "Installing nvm..."
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  $(cd "$NVM_DIR" && git checkout --quiet "$(_zsh_nvm_latest_release_tag)")
}

_zsh_nvm_global_binaries() {

  # Look for global binaries
  local global_binary_paths="$(echo "$NVM_DIR"/v0*/bin/*(N) "$NVM_DIR"/versions/*/*/bin/*(N))"

  # If we have some, format them
  if [[ -n "$global_binary_paths" ]]; then
    echo "$NVM_DIR"/v0*/bin/*(N) "$NVM_DIR"/versions/*/*/bin/*(N) |
      xargs -n 1 basename |
      sort |
      uniq
  fi
}

_zsh_nvm_load() {
    [ -s "$NVM_DIR/nvm.sh" ] || (
        read -q "RESP?nvm is not installed. Would you like to install it? [Y/n]: "
        echo
        if [[ $RESP != (y|Y) ]]; then return 1; fi
        echo Installing nvm...
        git clone https://github.com/creationix/nvm.git "$NVM_DIR" || return $?
        cd "$NVM_DIR"
        git checkout $(git describe --abbrev=0 --tags --match "v[0-9]*" origin)
        return 0
    ) && . "$NVM_DIR/nvm.sh" || { echo "Unable to load nvm"; return 127 }
}

_zsh_nvm_create_funs() {
    local cmds=("${@}")
    for cmd in $cmds; do
echo "creating nvm cmd '$cmd'"
        # When called, unset all lazy loaders, load nvm then run current command
        eval "$cmd(){
            unset -f $cmds > /dev/null 2>&1
            _zsh_nvm_load || { local res=\$?; _zsh_nvm_create_funs $cmds; return \$res }
            $cmd \"\$@\"
        }"
    done
}

_zsh_nvm_lazy_load() {

  # Get all global node module binaries including node
  local global_binaries
  global_binaries=($(_zsh_nvm_global_binaries))

  # Add yarn lazy loader if it's been installed by something other than npm
  _zsh_nvm_has yarn && global_binaries+=('yarn')

  # Add nvm
  global_binaries+=('nvm')

  # Remove any binaries that conflict with current aliases
  local cmds
  cmds=()
  for bin in $global_binaries; do
    [[ "$(which $bin 2> /dev/null)" = "$bin: aliased to "* ]] || cmds+=($bin)
  done

  # Create function for each command
  _zsh_nvm_create_funs $cmds
}

_zsh_nvm_lazy_load

