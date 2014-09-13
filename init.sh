#!/bin/bash

CWD=`pwd`
platform='unknown'
unamestr=`uname`

if [[ $unamestr == *Linux* ]]
then
    platform='linux'
fi

if [[ $unamestr == *Cygwin* ]]
then
    platform='cygwin'
fi

# Add bash aliases
echo "Adding BASH Aliases"
cp -v .bashrc ~/
cp -v .bash_aliases ~/
cp -v .bash_env ~/

# Install Common Packages
echo "Installing Common Packages"
if [ $platform == 'linux' ]
then
    sudo apt-get install astyle build-essential vim minicom wireshark git exuberant-ctags colormake
fi

if [ $platform == 'cygwin' ]
then
    if [ ! -f /bin/apt-cyg]; then
        svn --force export http://apt-cyg.googlecode.com/svn/trunk/ /bin
        chmod +x /bin/apt-cyg
    fi
fi

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
