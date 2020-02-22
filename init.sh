#!/bin/sh

# terminal
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -fs $HOME/dotfiles/terminal/zlogin    $HOME/.zlogin
ln -fs $HOME/dotfiles/terminal/zlogout   $HOME/.zlogout
ln -fs $HOME/dotfiles/terminal/zpreztorc $HOME/.zpreztorc
ln -fs $HOME/dotfiles/termianl/zprofile  $HOME/.zprofile
ln -fs $HOME/dotfiles/terminal/zshenv    $HOME/.zshenv
ln -fs $HOME/dotfiles/terminal/zshrc     $HOME/.zshrc

chsh -s /bin/zsh

