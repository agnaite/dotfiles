eval "$(rbenv init -)"

export GOPATH=$HOME/Documents/code/go
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH:/usr/local/bin"

#psql not starting
alias startsql="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

#restart video hardware
alias killvid="sudo killall VDCAssistant"

#go to Doc/code
alias  code="cd ~/Documents/code"

#vim
alias vi="vim"

#heroku
alias h="heroku"

# kube workshop
alias kc='kubectl --kubeconfig /Users/aklimaite/.kube/3aa92223-8f45-4652-b9a1-27910b768c40.conf'

alias ls="ls -G"

#heroku/runtime
alias cedar="cd ~/Documents/code/go/src/github.com/heroku/runtime"

#heroku/dogwood
alias dw="cd ~/Documents/code/go/src/github.com/heroku/dogwood"

#open bash
alias  bashp="vim ~/.bash_profile"

#source bash
alias  src="source ~/.bash_profile"

# bpython
alias bp="cd ~/Documents/Code/bpython && venv && bpython"

# ENV
alias venv="source env/bin/activate"

# hide desktop icons (mac os x)
alias deskhide='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias deskshow='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

idfor() {
    app=$1
    heroku sudo apps:info -a $app --json | jq .app.id
}

EMOJI=(
☕️
🍄
🍕
🌱
🐱
🌙
✨
🌯
💕
🐰
👽
💎
🔮
🚀
💅🏻
🦄
🍺
)

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Heroku Cloud / Ion
export ION_USER=aklimaite

DEFAULT_CLOUD=production
eval "$(ion-client shell)"
cloud $DEFAULT_CLOUD &> /dev/null
export CAAS_HOST=cloudformation.herokai.com

# show cloud if inside heroku directory
cloud_ps1() {
  if [[ "$PWD" == *heroku* ]]; then
    echo "["$HEROKU_CLOUD"]"
  fi
}
directory() {
  echo $(basename $(dirname "$PWD"))/$(basename "$PWD")
}
emoji="${EMOJI[$RANDOM % ${#EMOJI[@]}]}"

function prompt {
  local name_color="\[\033[38;5;189m\]"
  local directory_color="\[\033[38;5;147m\]"
  local branch_color="\[\033[38;5;221m\]"
  local cloud_color="\[\033[38;5;115m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="$name_color\aagne✨$directory_color[\W]$cloud_color\$(cloud_ps1)$RESETCOLOR$branch_color\$(parse_git_branch) ${emoji} → $RESETCOLOR"
}
prompt

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/aklimaite/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

export EDITOR=vim

