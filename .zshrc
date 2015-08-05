# Path to your oh-my-zsh installation.
export ZSH=/Users/steven/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git vi-mode)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/local/heroku/bin:$HOME/.rbenv/bin:/Users/steven/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source /Users/steven/.iterm2_shell_integration.zsh
eval "$(rbenv init -)"
