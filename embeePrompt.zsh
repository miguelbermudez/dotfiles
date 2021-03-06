# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%}%d%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
%}$(_prompt_char)%} %#%{%f%k%b%} '

RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%} |%F{blue}%D{%R.%S %b %d %Y}'

if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
     touch ~/.dirs
 fi

alias show='cat ~/.dirs'

# Module: Change directory with bookmarks
# path: bin/zsh-modules-available/cdbookmarks
# http://ivan.fomentgroup.org/blog/2010/01/29/zsh-bookmarks-for-cd-change-directory-with-completion/
function cdb_edit() {
  vim ~/.cdbookmarks
}
function cdb() {
  NewDir=`egrep "^$1	" ~/.cdbookmarks \
     | sed 's/^.*	//'`;
  echo cd $NewDir
  cd $NewDir
}
function _cdb() {
  reply=(`cat ~/.cdbookmarks | sed 's/	.*$//'`);
}
compctl -K _cdb cdb


# conveince function for gittower
function gt() {  gittower --status "$*"; }

#Aliases
alias gs='git status'
alias clera='clear'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'
