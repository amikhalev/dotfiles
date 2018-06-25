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
    if has_command pacaur; then
        echo Installing rcm from the AUR. Please accept any prompts
        pacaur -S rcm
    elif has_command add-apt-repository; then
        echo Installing rcm from ubuntu ppa
        sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
        sudo apt-get update
        sudo apt-get install rcm
    elif has_command dnf; then
	echo Installing rcm from Fedora copr
        sudo dnf copr enable seeitcoming/rcm
        sudo dnf install rcm
    else
        echo "No known way to install rcm. Please install it manually"
        exit 1
    fi
}

install_pkg_brew() {
    local pkg=$1
    echo Installing $pkg from homebrew
    brew install $pkg
}

install_pkg_linux() {
    local pkg=$1
    if has_command pacman; then
        echo Installing $pkg from pacman
        sudo pacman -S $pkg
    elif has_command apt-get; then
        echo Installing $pkg from apt-get
        sudo apt-get update
        sudo apt-get install $pkg
    elif has_command dnf; then
        echo Installing $pkg from dnf
        sudo dnf install $pkg
    else
        echo No known way to install $pkg. Please install it manually
        exit 1
    fi
}

install_pkg() {
    local pkg=$1
    case `uname` in
        Darwin)
            install_pkg_brew $pkg
            ;;
        Linux)
            install_pkg_linux $pkg
            ;;
        *)
            echo "Unknown system `uname`. Install $pkg manually"
            exit 1
            ;;
    esac
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

if ! has_command zsh; then 
    echo "zsh is not installed!"    
    install_pkg zsh
fi

if [ ! -e "$DOTFILES_DIR" ]; then
    if ! has_command git; then 
        echo "git is not installed!"    
        install_pkg git
    fi
    echo Cloning dotfiles repo
    git clone --recursive $REPO_URL $DOTFILES_DIR
else
    echo dotfiles found at $DOTFILES_DIR
fi

echo Running rcup
rcup -d $DOTFILES_DIR

echo Success! Dotfiles installed
