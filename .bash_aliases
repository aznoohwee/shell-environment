alias ls='ls -ah --color'
alias ll='ls -l'

if [ $PLATFORM == 'linux' ]; then
    alias make='colormake'
fi

alias df='df -h'
alias ns='netstat -aln'
alias nsl='netstat -lnp'
alias cpr='cp -R'
alias ..='cd ..'
