#!/bin/bash

CWD=`pwd`

# Add bash aliases
echo "Adding BASH Aliases"
cp -v .bashrc ~/
cp -v .bash_aliases ~/
cp -v .bash_env ~/

# Install Common Packages
echo "Installing Common Packages"
sudo apt-get install astyle build-essential vim minicom wireshark git exuberant-ctags colormake

# Install Awesome VIMRC Script
if [ -d ~/.vim_runtime ]; then
    # update the script
    echo "Updating Ultimate .vimrc"
    cd ~/.vim_runtime
    git pull --rebase
else
    echo "Getting Ultimate .vimrc"
    git clone git://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
fi    

# Add custom VIM shortcuts
echo "Adding .vimrc shortcuts"
cd $CWD
cp -v my_configs.vim ~/.vim_runtime

# Reload environment
echo "Reloading the enviornment"
. ~/.bashrc
