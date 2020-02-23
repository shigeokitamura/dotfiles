#!/bin/sh

function install_prezto () {
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    ln -fs $HOME/dotfiles/terminal/zlogin    $HOME/.zlogin
    ln -fs $HOME/dotfiles/terminal/zlogout   $HOME/.zlogout
    ln -fs $HOME/dotfiles/terminal/zpreztorc $HOME/.zpreztorc
    ln -fs $HOME/dotfiles/termianl/zprofile  $HOME/.zprofile
    ln -fs $HOME/dotfiles/terminal/zshenv    $HOME/.zshenv
    ln -fs $HOME/dotfiles/terminal/zshrc     $HOME/.zshrc

    chsh -s /bin/zsh
}

function install_homebrew () {
    /usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install\)'
}

function install_anyenv () {
    git clone https://github.com/anyenv/anyenv ~/.anyenv
    $HOME/.anyenv/bin/anyenv init
}

function install_anyenv_mac () {
    brew install anyenv
    anyenv init
}

if [ "$(uname)" == 'Darwin' ]; then
    install_homebrew
    install_prezto
    install_anyenv_mac
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    install_prezto
    install_anyenv
fi

