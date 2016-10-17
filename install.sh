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
    else
        echo "No known way to install rcm. Please install it manually"
        exit 1
    fi
}

install_git_brew() {
    echo Installing git from homebrew
    brew install git
}

install_git_linux() {
    if has_command pacman; then
        echo Installing git from pacman
        sudo pacman -S git
    elif has_command apt-get; then
        echo Installing git from apt-get
        sudo apt-get update
        sudo apt-get install git
    else
        echo No known way to install git. Please install it manually
        exit 1
    fi
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
    if ! has_command git; then 
        echo "git is not installed!"    
        case `uname` in
            Darwin)
                install_git_brew
                ;;
            Linux)
                install_git_linux
                ;;
            *)
                echo "Unknown system `uname`. Install git manually"
                exit 1
                ;;
        esac
    fi
    echo Cloning dotfiles repo
    git clone --recursive $REPO_URL $DOTFILES_DIR
else
    echo dotfiles found at $DOTFILES_DIR
fi

echo Running rcup
rcup -d $DOTFILES_DIR

echo Success! Dotfiles installed
