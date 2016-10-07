#!/bin/sh

set -e

DOTFILES_DIR=$HOME/.dotfiles
REPO_URL="https://github.com/amikhalev/dotfiles.git"

has_command() {
    command -v $1 1>/dev/null
}

install_rcm_brew() {
    has_command brew || { echo "Homebrew is not installed!"; exit 1; }
    echo Installing rcm through homebrew
    brew tap thoughtbot/formulae
    brew install thoughtbot/formulae/rcm
}

install_rcm_linux() {
    has_command pacaur || { echo "pacaur is not installed. Please install pacaur or install rcm manually."; exit 1; }
    echo Installing rcm from the AUR. Please accept any prompts
    pacaur -S rcm
}

if ! has_command rcup; then
    echo rcm is not installed!
    case `uname` in
        Darwin)
            install_rcm_brew
            ;;
        Linux)
            install_rcm_linux
            ;;
        *)
            echo "Unknown system `uname`. Install rcm manually"
            exit 1
            ;;
    esac
else
    echo rcup found at `which rcup`
fi

if [ ! -e "$DOTFILES_DIR" ]; then
    has_command git || { echo "git is not installed and must be in order to fetch dotfiles"; exit 1; }
    echo Cloning dotfiles repo
    git clone --recursive $REPO_URL $DOTFILES_DIR
else
    echo dotfiles found at $DOTFILES_DIR
fi

echo Running rcup
rcup -d $DOTFILES_DIR

echo Success! Dotfiles installed
