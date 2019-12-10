
# git abbreviations
abbr -a gss 		   git status -s
abbr -a gst 			 git status
abbr -a glg        git log --stat --max-count=10
abbr -a glgg       git log --graph --max-count=10
abbr -a glgga      git log --graph --decorate --all
abbr -a glo        git log --oneline --decorate --color
abbr -a glog       git log --oneline --decorate --color --graph
abbr -a gloo       "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"

# git checkout abbreviations
abbr -a gco git checkout
abbr -a gcb git checkout -b

# fnm
set PATH $HOME/.fnm $PATH
#fnm env --multi | source

# asdf
source ~/.asdf/asdf.fish

# IEX
set ERL_AFLAGS '-kernel shell_history enabled'

# fzf
set FZF_DEFAULT_COMMAND '(git ls-tree -r --name-only HEAD || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'

set FZF_DEFAULT_OPTS '--layout=reverse --inline-info'
