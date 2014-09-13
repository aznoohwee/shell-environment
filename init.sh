#!/bin/bash

CWD=`pwd`
platform='unknown'
unamestr=`uname`

if [[ $unamestr == *Linux* ]]
then
    platform='linux'
fi

if [[ $unamestr == *CYGWIN* ]]
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
    if [ ! -f /bin/apt-cyg ]; then
        svn --force export http://apt-cyg.googlecode.com/svn/trunk/ /bin
        chmod +x /bin/apt-cyg
    fi

    apt-cyg install curl
    apt-cyg install git
    apt-cyg install git-svn
    apt-cyg install python
    apt-cyg install python-setuptools

    easy_install pip
    pip install requests

    # Install Colormake
    curl https://raw.githubusercontent.com/pagekite/Colormake/master/colormake > /usr/bin/colormake
    curl https://raw.githubusercontent.com/pagekite/Colormake/master/colormake.pl > /usr/bin/colormake.pl
    chmod +x colormake
    chmod +x colormake.pl
fi

# Install Awesome VIMRC Script
if [ -d ~/.vim_runtime ]; then
    # update the script
    echo "Updating Ultimate .vimrc"
    cd ~/.vim_runtime
    git stash
    git pull --rebase
    git stash pop
    python update_plugins.py
    echo "Applying patches"
    curl https://github.com/amix/vimrc/pull/60.patch | patch -p1
else
    echo "Getting Ultimate .vimrc"
    git clone git://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
    echo "Applying patches"
    cd ~/.vim_runtime/sources_non_forked/vim-zenroom2
    curl https://github.com/amix/vimrc/pull/60.patch | patch -p1
fi    

# Add custom VIM shortcuts
echo "Adding .vimrc shortcuts"
cd $CWD
cp -v my_configs.vim ~/.vim_runtime

# Reload environment
echo "Reloading the enviornment"
. ~/.bashrc
