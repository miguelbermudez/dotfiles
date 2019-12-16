# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
# Add fzf to PATH
PATH=$PATH:$VIMDATA/plugged/fzf/bin 
# Add go to PATH
PATH=$PATH:/usr/local/go/bin

export PATH

ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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

bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

fpath=($fpath "/home/miguelb/.zfunctions")


# ZPLUG
source ~/.zplug/init.zsh
zplug "junegunn/fzf-bin", 			from:gh-r, as:command, rename-to:fzf
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", 	defer:2
zplug "tarruda/zsh-autosuggestions",            defer:3
zplug "zdharma/fast-syntax-highlighting",	defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "b4b4r07/ultimate", 			as:theme
zplug "plugins/git",   				from:oh-my-zsh
zplug "junegunn/fzf", 				from:github, use:"shell/completion.zsh"
zplug "junegunn/fzf", 				from:github, use:"shell/key-bindings.zsh"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

if zplug check zsh-users/zsh-autosuggestions; then
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
fi


KEYTIMEOUT=1
# bindkey -v

if zplug check zsh-users/zsh-history-substring-search; then
    bindkey '\eOA' history-substring-search-up
    bindkey '\eOB' history-substring-search-down
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# ALIASES
alias c='pygmentize -O style=borland -f console256 -g'
alias la="exa -abghl --git --color=automatic"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
