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


# Note taking aliases
alias tj="touch ~/Notes/journal/$(date +%d-%m-%Y).org && emacs ~/Notes/journal/$(date +%d-%m-%Y).org"

# FASD aliases
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias m='f -e mpv' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open

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

# General functions

# Encrypt a file
function encrypt() { openssl enc -aes-256-cbc -salt -a -in $1 -out $2 ; }

# Decrypt a file
function decrypt() { openssl enc -aes-256-cbc -d -a -in $1 -out $2 ; }

# Fetch weather forecast
function weather() { curl "http://wttr.in/$1"; }

# Convert input text into a QR code
function qrify() { curl "http://qrenco.de/$1"; }

# Backup everything to a specific directory
function backup() { rsync -avzr --info=progress2 --size-only ~/.backup $1 }

# Compress to gzip format and encrypt with symmetric cipher, AES256
function encrypt-zip() {
    tar cvf - "$@" --checkpoint | gpg -c --cipher-algo AES256 --enable-progress-filter > encrypted.tar.gz.gpg
}

# Decrypt and decompress gzipped folder
function decrypt-zip() {
    gpg-zip -d $1
}

# Set path for frequently accessed directory 
export CDPATH=$CDPATH:$HOME/github/

# GOLANG
export GOPATH=$HOME/Golang
export PATH=$GOPATH/bin:$HOME/.stack/snapshots/x86_64-linux/lts-8.14/8.0.2/bin:$HOME/.stack/programs/x86_64-linux/ghc-8.0.2/bin:/usr/local/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# This is the same functionality as fzf's ctrl-t, except that the file or
# directory selected is now automatically cd'ed or opened, respectively.
fzf-open-file-or-dir() {
  local cmd="command find -L . \
    \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  local out=$(eval $cmd | fzf-tmux --exit-0)

  if [ -f "$out" ]; then
    $EDITOR "$out" < /dev/tty
  elif [ -d "$out" ]; then
    cd "$out"
    zle reset-prompt
  fi
}
zle     -N   fzf-open-file-or-dir
bindkey '^P' fzf-open-file-or-dir

# Setup environment for cargo
source ~/.cargo/env

# Disable touch screen
xinput disable 11
