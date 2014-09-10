# Include env files

if [ -f ~/.bash_env ]; then
    . ~/.bash_env
fi

# Include aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
