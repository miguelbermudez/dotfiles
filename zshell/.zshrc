# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
# Add fzf to PATH
PATH=$PATH:$VIMDATA/plugged/fzf/bin 
# Add go to PATH
PATH=$PATH:/usr/local/go/bin
# Add bspwm to PATH
PATH=$PATH:~/.config/bspwm

export PATH

# Go Config
export GOPATH=$HOME/Work/go
export PATH="$GOPATH/bin:$PATH"


# Path to your oh-my-zsh installation.
#  export ZSH="/home/miguelb/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

export LANG=en_US.UTF-8

if [ -f ~/.profile ]; then
	. ~/.profile
fi

# mostly from https://blog.callstack.io/supercharge-your-terminal-with-zsh-8b369d689770
# Load Autocomplete
autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

# Save history so we get auto suggestions
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Options
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances
unsetopt correct_all # autocorrect commands
setopt interactive_comments # allow comments in interactive shells

# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

ZSH_THEME="materialshell"
DISABLE_AUTO_UPDATE="true"

# Load antibody plugin manager
source <(antibody init)
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle mafredri/zsh-async
antibody bundle rupa/z

#### MATERIAL SHELL REQ ####
	# where is antibody keeping its stuff?
	ANTIBODY_HOME="$(antibody home)"
	# tell omz where it lives
	export ZSH="$ANTIBODY_HOME"/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh
	antibody bundle robbyrussell/oh-my-zsh
#### /MATERIAL SHELL REQ ####

antibody bundle robbyrussell/oh-my-zsh path:plugins/git
# antibody bundle psprint/zsh-navigation-tools

bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

fpath=($fpath "/home/miguelb/.zfunctions")

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
source /usr/share/fzf/shell/key-bindings.zsh

# ALIASES
alias c='pygmentize -O style=borland -f console256 -g'
alias la="exa -abghl --git --color=automatic"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
