alias aliases="cat ~/.bashrc.d/aliases.bashrc"
alias valiases="vim ~/.bashrc.d/aliases.bashrc"
alias src="source ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias vim="fg || vim"
alias v="vim"
alias tn="tmux new -s steph"

alias ga="git add --all"
alias gc="git commit"
alias gd="git diff"
alias gdc="git diff --cached"
alias gs="git status"
alias gp="git push"
alias gpl="git pull"
alias gl="git glog"
# Removed local branches that have been merged (master and develop preserved)
alias gpurge="git branch --merged | egrep -v '(^\*|master|develop)' | xargs git branch -d"

alias dr="docker run --rm -it"
alias dp="docker ps -a"
alias di="docker images"
alias drm="docker rm"
alias drmi="docker rmi"
