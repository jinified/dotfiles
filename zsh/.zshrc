# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

alias reload="source ~/.zshrc"

# User configuration
export LANG=en_US.UTF-8
export EDITOR='vim'

# ZSH options
setopt GLOB_COMPLETE
setopt correct
setopt autocd               # change dir without cd
setopt notify               # notify of BG job completion immediately
setopt printexitvalue       # alert me if something has failed
setopt autopushd            # automatically append dirs to the push/pop list
setopt extendedglob         # awesome pattern matching
setopt promptcr             # ensure a new line before prompt is drawn
setopt autolist             # list choices on ambigious completion
setopt listtypes            # show types in completion
setopt interactivecomments  # escape commands so i can use them later
setopt histverify           # when using ! cmds, confirm first

# Autoload functions
autoload zmv # Massive renaming


# Git aliases
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
export CDPATH=$CDPATH:$HOME/github/

# GOLANG
export GOPATH=$HOME/Golang
export PATH=$GOPATH/bin:$HOME/.stack/snapshots/x86_64-linux/lts-8.14/8.0.2/bin:$HOME/.stack/programs/x86_64-linux/ghc-8.0.2/bin:/usr/local/go/bin:$HOME/.local/bin:$PATH

xinput disable 11
