#
# User configuration sourced by interactive shells
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

alias copy="xsel -i -b"
alias reload="source ~/.zshrc"
# alias pip=pip3
alias astudio="sudo /opt/android-studio/bin/studio.sh"
alias eks-helm="kubectl config use-context tiller"
alias eks-nonprod="export AWS_PROFILE=astro-de-nonprod; kubectl config use-context 1602045626249059991@k8-de-nonprod.ap-southeast-1.eksctl.io"
alias eks-dev="export AWS_PROFILE=k8-de-nonprod; kubectl config use-context dev-k8-de-nonprod.ap-southeast-1.eksctl.io"

alias k-denonprod="export AWS_PROFILE=ecosystemnonprod-dev; kubectl config use-context de-nonprod"
alias k-deprod="export AWS_PROFILE=k8-de-prod; kubectl config use-context de-prod-admin"
alias k-loadtest="export AWS_PROFILE=ecosystemnonprod-dev; kubectl config use-context de-loadtest"
alias kk="kubectl-insecure"

function kubectl-insecure(){
    kubectl --insecure-skip-tls-verify ${@:1}
}

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
export PATH=/usr/local/go/bin:$HOME/.local/bin:/usr/local:$HOME/.cargo/bin:$HOME/.poetry/bin:$HOME/miniconda3/bin:$HOME/Android/Sdk/platform-tools:$HOME/.pyenv/bin:$GOPATH/bin:$PATH

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
export FZF_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" ~ 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_COMMAND"

jupyter_stop () {
    ssh $1 "pkill -u ubuntu jupyter"
}

jupyter_start () {
    nohup ssh -f $1 "cd $2; jupyter notebook --no-browser --port=8889"; $(portforward $1)
}

portforward () {
    nohup ssh -N -f -L localhost:8080:localhost:8889 $1
}

setup_kops () {
    export AWS_ACCESS_KEY_ID=AKIAY3V5FAIFMIXC2FIV
    export AWS_SECRET_ACCESS_KEY=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
}

setup_go () {
    local repo = $1
    go mod init $repo
    mkdir {cmd,internal,pkg}
}

setxkbmap -option caps:escape

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/gin/projects/SE2019/de-awani-webhooks/node_modules/tabtab/.completions/slss.zsh ]] && . /home/gin/projects/SE2019/de-awani-webhooks/node_modules/tabtab/.completions/slss.zsh

for f in `ls ~/.kube/config/ | grep kubeconfig`
do
    export KUBECONFIG="$HOME/.kube/config/$f:$KUBECONFIG";
done

export FZF_DEFAULT_OPTS="--ansi --bind up:preview-up,down:preview-down --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

# added by travis gem
[ ! -s /home/gin/.travis/travis.sh ] || source /home/gin/.travis/travis.sh

function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}

function get_bindings(){

    kubectl get rolebindings,clusterrolebindings \
      -n $1 \
      -o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,SERVICE_ACCOUNTS:subjects[?(@.kind=="ServiceAccount")].name' --insecure-skip-tls-verify | grep $2
}
# pyenv config
# Set virtualenv dir
export WORKON_HOME=~/.ve
# Initialize pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# Initialize pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"
# Get the poetry's full path
POETRY_CMD=$(which poetry)
# Allow poetry to load .env files
function poetry() {
    # Define the full command. i.e. poetry [run|shell|version]
    POETRY_FULL_CMD=($POETRY_CMD "$@")

    # if POETRY_DONT_LOAD_ENV is *not* set, then load .env if it exists
    # also, only loads when for "run" and "shell" commands.
    if [[ -z "$POETRY_DONT_LOAD_ENV" && -f .env && ("$1" = "run" || "$1" = "shell") ]]; then
        echo 'Loading .env environment variables…'
        env $(grep -v '^#' .env | tr -d ' ' | xargs) $POETRY_FULL_CMD
    else
        $POETRY_FULL_CMD
    fi
}
export PIP_REQUIRE_VIRTUALENV=true
export HISTTIMEFORMAT='%FT%T%z: ' #  YYYY-MM-DDTHH:MM:SS±0000
