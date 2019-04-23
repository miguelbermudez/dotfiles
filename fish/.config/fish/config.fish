
#fnm config
set PATH /Users/bermudem/.fnm $PATH
fnm env --multi | source

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


