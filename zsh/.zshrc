setopt GLOB_COMPLETE

#  Uses 256-color
export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=/home/parapa/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wezm"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

autoload zmv
plugins=(git emoji)

# User configuration

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'

# Git
# Git wrapper needed to be installed https://github.com/github/hub
alias git=hub
alias gpr="git pull --rebase"
alias gpom="git push origin master"
alias gs="git status -sb"
alias gh="git hist"
alias gf='git fetch'
alias gb='git branch'
alias ga='git add'
alias gc='git commit -m $1'
alias gca='git commit --amend'
alias grc='git rebase --continue'
alias grs='git rebase --skip'

# Set path for frequently accessed directory 
setopt autocd
export CDPATH=$CDPATH:$HOME/github/
source /opt/ros/kinetic/setup.zsh
source $HOME/github/bbauv/devel/setup.zsh

# GOLANG
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$HOME/.stack/snapshots/x86_64-linux/lts-8.14/8.0.2/bin:$HOME/.stack/programs/x86_64-linux/ghc-8.0.2/bin:/usr/local/go/bin:$PATH
