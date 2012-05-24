# Don't check mail when opening terminal.
unset MAILCHECK

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
stty -ixon -ixoff
