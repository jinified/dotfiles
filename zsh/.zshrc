#
# User configuration sourced by interactive shells
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

alias reload="source ~/.zshrc"
# alias pip=pip3
alias astudio="sudo /opt/android-studio/bin/studio.sh"

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


alias vim=nvim

# Git aliases
alias gpr="git pull --rebase"
alias gpom="git push origin master"
alias gs="git status -sb"
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

# Edit file in vim
function edit-in-vim() {
    vim $(fzf ~)
}

# Set path for frequently accessed directory 
export CDPATH=$CDPATH:$HOME/projects/

# GOLANG
export GOPATH=$HOME/golang
export PATH=/usr/local/go/bin:$HOME/.local/bin:/usr/local:$HOME/.cargo/bin:$PATH

export DATABASE_URL=postgres://anubis:AnubisTheDogGod@localhost:5432/anubis 
export JWTSecret="AnubisTheDogGod"
export JWTRefreshSecret="AnubisCanabisMeGusta"
export MONGO_URI="mongodb://anubis:AnubisTheDogGod@localhost:27017/anubis_users"
export DRONE_SERVER=https://drone-dev.auto.pink.cat
export DRONE_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0IjoicGFyYXBhdHJwIiwidHlwZSI6InVzZXIifQ.wXwzZZQBdqUViCseZNop8lkJIJAFuJPyGAV_xAyFtFk
COWPATH="$COWPATH:$HOME/.cowsay"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/gin/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/gin/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/gin/node_modules/tabtab/.completions/sls.zsh ]] && . /home/gin/node_modules/tabtab/.completions/sls.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
