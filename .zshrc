# colors
export CLICOLOR=1
export TERM=xterm-256color
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# nvm
export NVM_DIR="/Users/steven/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# kiex
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# emacs/spacemacs
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# zsh
autoload -U compinit
setopt

compinit AUTOMENU
setopt MENUCOMPLETE
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# $PATH
path=(~/.local/bin
    node_modules/.bin
    /Users/steven/.themekit
    /Users/steven/.local/bin
    /Users/steven/.kiex/elixirs/elixir-1.2.1/bin
    /Users/steven/.kiex/bin
    /Users/steven/.nvm/versions/node/v5.4.1/bin
    /usr/local/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin)
export PATH

############################################################
## my custom functions, aliases, etc.
############################################################
# alias for youtube-dl
function ripaudio() { youtube-dl -x --audio-format=wav "$1" }

# aliases
alias l='ls -lf'
