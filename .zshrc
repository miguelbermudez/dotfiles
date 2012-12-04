# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git heroku osx rails ruby textmate)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/miguelb/.rvm/gems/ruby-1.9.3-p194/bin:/Users/miguelb/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/miguelb/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/miguelb/src/bin:/Users/miguelb/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PKG_CONFIG_PATH="/usr/local/Cellar/imagemagick/6.7.7-6/include/ImageMagick/wand:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/Cellar/imagemagick/6.7.7-6/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory
