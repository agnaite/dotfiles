eval "$(rbenv init -)"

export GOPATH=$HOME/Documents/code/go
export PATH="/usr/local/bin:/usr/local/go/bin:$GOPATH/bin:$PATH"

#psql not starting
alias startsql="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

#go to Doc/code
alias  code="cd ~/Documents/code"

#heroku
alias h="heroku"

alias ls="ls -G"

#heroku/cedar
alias cedar="cd ~/Documents/code/go/src/github.com/heroku/cedar"

#heroku/dogwood
alias dw="cd ~/Documents/code/go/src/github.com/heroku/dogwood"

#open bash
alias  bashp="open ~/.bash_profile"

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
🇩🇪
)

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

emoji="${EMOJI[$RANDOM % ${#EMOJI[@]}]}"

function prompt {
  local name_color="\[\033[38;5;183m\]"
  local directory_color="\[\033[38;5;147m\]"
  local branch_color="\[\033[38;5;221m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="$name_color\aagne✨$directory_color[\W]$RESETCOLOR$branch_color\$(parse_git_branch) ${emoji} → $RESETCOLOR"
}
prompt

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/aklimaite/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

