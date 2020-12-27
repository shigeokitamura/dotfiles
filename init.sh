#!/bin/bash

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

function install_packages () {
    sudo apt update && sudo apt upgrade
    sudo apt install zsh
    sudo apt install zlib1g-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
    sudo apt install yarn cmake golang-go
}

function install_homebrew () {
    /usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install\)'
}

function install_anyenv () {
    git clone https://github.com/anyenv/anyenv ~/.anyenv
    export PATH="$HOME/.anyenv/bin:$PATH"
    anyenv install --init

    anyenv install rbenv
    export PATH="$HOME/.anyenv/envs/rbenv/bin:$PATH"
    rbenv install 3.0.0
    rbenv global 3.0.0

    anyenv install pyenv
    export PATH="$HOME/.anyenv/envs/pyenv/bin:$PATH"
    export PYTHON_CONFIGURE_OPTS="--enable-shared"
    pyenv install 3.9.1
    pyenv global 3.9.1

    anyenv install nodenv
    export PATH="$HOME/.anyenv/envs/nodenv/bin:$PATH"
    echo yarn > "$HOME/.anyenv/envs/nodenv/default-packages"
    nodenv install 14.15.3
    nodenv global 14.15.3
}

function install_anyenv_mac () {
    brew install anyenv
    anyenv init
}

function install_vim() {
    ln -fs $HOME/dotfiles/vim/vimrc $HOME/.vimrc
    vim +PlugInstall +qall
    python $HOME/.vim/plugged/YouCompleteMe/install.py
}

if [ "$(uname)" == 'Darwin' ]; then
    install_homebrew
    install_prezto
    install_anyenv_mac
    install_vim
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    install_packages
    install_prezto
    install_anyenv
    install_vim
fi
