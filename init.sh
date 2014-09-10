#!/bin/bash

# Add bash aliases
cp .bashrc ~/
cp .bash_aliases ~/
cp .bash_env ~/

# Install Common Packages
sudo apt-get install build-essential vim minicom wireshark git exuberant-ctags colormake

# Install Awesome VIMRC Script
if [ -d ~/.vim_runtime ]; then
    # update the script
    cd ~/.vim_runtime
    git pull --rebase
else
    git clone git://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
fi    

# Add custom VIM shortcuts

cp -f my_configs.vim ~/.vim_runtime/

# Reload environment
. ~/.bashrc
