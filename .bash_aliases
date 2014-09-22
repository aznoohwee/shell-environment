if [ $PLATFORM == 'osx' ]; then
    alias ls='ls -ah'
else
    alias ls='ls -ah --color'
fi

alias ll='ls -l'

alias make='colormake'

if [ $PLATFORM == 'cygwin' ]; then
    alias vi='vim'
fi

alias df='df -h'
alias ns='netstat -aln'
alias nsl='netstat -lnp'
alias cpr='cp -R'
alias cd..='cd ..'
alias ga='git add'
alias gc='git commit -m'
alias gp='git pull'
alias gpp='git push'
alias gss='git status'
alias ..='cd ..'
alias rmm='rm -rf'
