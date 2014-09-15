# Include env files

platform='unknown';
unamestr=`uname`;
archstr=`uname -m`;
arch='x86'

if [[ $unamestr == *Linux* ]]
then
    platform="linux"
fi

if [[ $unamestr == *CYGWIN* ]]
then
    platform="cygwin"
fi

if [[ $unamestr == *Darwin* ]]
then
    platform="osx"
fi

if [[ $archstr == 'x86_64' ]]
then
    arch='x86_64'
fi

export PLATFORM=$platform
export ARCH=$arch

if [ -f ~/.bash_env ]
then
    . ~/.bash_env
fi

# Include aliases file
if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_avr ]
then
    . ~/.bash_avr
fi

