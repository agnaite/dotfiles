eval "$(rbenv init -)"

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
alias ls="ls -G"

export GOPATH=$HOME/Documents/code/go
export PATH="/usr/local/bin:/usr/local/go/bin:$GOPATH/bin:$PATH"

#psql not starting
alias startsql="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

#go to Doc/code
alias  code="cd ~/Documents/code"

#heroku
alias h="heroku"

#heroku/cedar
alias cedar="cd ~/Documents/code/go/src/github.com/heroku/cedar"

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
    
export PS1="\[\033[38;5;183m\]agne✨ \[$(tput sgr0)\]\[\033[38;5;147m\][\W]\033[38;5;221m\]\$(parse_git_branch)\[\033[38;5;147m\]: ${emoji}  \[\033[1;38;5;225m\]"

