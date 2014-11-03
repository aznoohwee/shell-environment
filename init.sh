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
cp -v .screenrc ~/

if [ $platform == 'cygwin' ]; then
    cp -v .vimperatorrc.local /cygdrive/c/Users/`whoami`/_vimperatorrc
else
    cp -v .vimperatorrc.local ~/
fi

# Install Common Packages
echo "Installing Common Packages"
if [ $platform == 'linux' ]
then
    sudo apt-get install astyle build-essential screen vim minicom wireshark git exuberant-ctags colormake
fi

if [ $platform == 'cygwin' ]
then
    if [ ! -f /bin/apt-cyg ]; then
        svn --force export http://apt-cyg.googlecode.com/svn/trunk/ /bin
        chmod +x /bin/apt-cyg
    fi

    apt-cyg install automake autoconf gcc-g++ ctags curl vim git git-svn python python-setuptools screen astyle unzip patch

    easy_install pip
    pip install requests

    # Install Colormake
    curl https://raw.githubusercontent.com/pagekite/Colormake/master/colormake > /usr/bin/colormake
    curl https://raw.githubusercontent.com/pagekite/Colormake/master/colormake.pl > /usr/bin/colormake.pl
    chmod +x colormake
    chmod +x colormake.pl
fi

if [ $platform == 'osx' ]
then
    # Check if homebrew is installed, if not install it
    if [ ! -f /usr/local/bin/brew ]; then
        echo "Install Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Updating Homebrew"
        brew update
    fi

    brew install ctags
    brew install wget
    brew install curl
    brew install git
    brew install git-svn
    brew install vim
    brew install screen
    brew install minicom
    brew install colormake
    brew install astyle
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
    cd ~/.vim_runtime
    curl https://github.com/amix/vimrc/pull/60.patch | patch -p1
fi    

# Install more VIM Plugins
echo "Installing more plugins"

if [ ! -d ~/.vim_runtime/sources_non_forked/supertab ]; then
    cd ~/.vim_runtime/sources_non_forked
    git clone https://github.com/ervandew/supertab.git
fi

if [ ! -d ~/.vim_runtime/sources_non_forked/vim-easygrep ]; then
    cd ~/.vim_runtime/sources_non_forked
    git clone https://github.com/dkprice/vim-easygrep.git
fi

if [ ! -d ~/.vim_runtime/sources_non_forked/QFEnter ]; then
    cd ~/.vim_runtime/sources_non_forked
    git clone https://github.com/yssl/QFEnter
fi

if [ ! -d ~/.vim_runtime/sources_non_forked/cvim ]; then
    cd /tmp
    wget http://www.vim.org/scripts/download_script.php?src_id=21803 -O cvim.zip
    rm -rf cvim
    unzip -d cvim cvim.zip
    mv cvim  ~/.vim_runtime/sources_non_forked
fi

if [ ! -d ~/.vim_runtime/sources_non_forked/hexman ]; then
    mkdir -p ~/.vim_runtime/sources_non_forked/hexman/plugin
    cd ~/.vim_runtime/sources_non_forked/hexman/plugin
    wget http://www.vim.org/scripts/download_script.php?src_id=21365 -O hexman.vim 
fi

# Setup vimdiff
echo "Setting vimdiff as git merge tool"
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false

# Add custom VIM shortcuts
echo "Adding .vimrc shortcuts"
cd $CWD
cp -v my_configs.vim ~/.vim_runtime

# Reload environment
echo "Reloading the enviornment"
. ~/.bashrc
