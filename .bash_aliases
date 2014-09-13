alias ls='ls -ah --color'
alias ll='ls -l'

alias make='colormake'

if [ $PLATFORM == 'cygwin' ]; then
    alias vi='vim'
fi

alias df='df -h'
alias ns='netstat -aln'
alias nsl='netstat -lnp'
alias cpr='cp -R'
alias ..='cd ..'
