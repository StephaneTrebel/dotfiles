CDPATH=$CDPATH:$HOME

# Restrict "cd" autocompletion prompt to directories
complete -d cd

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."
alias ............="cd ../../../../../../../../../../.."
alias .............="cd ../../../../../../../../../../../.."

# List directory elememts with a leading number that can be used with "lf" function
# Eg: lln -> …list stuff like this:
# 1 - foo
# 2 - bar
# 3 - …
# And then: lf 1 === foo
# So stuff like cd $(lf 1) will change directory to foo
alias lln="ls -lhtr  --time-style long-iso | tac | cat -n | tac | sed -s 's/^\s*\([0-9]*\)\s*\(.*\)/[\1]  \2 [\1]/'g && pwd"
function lf() {
    if [ "x${1}" == "x" ]
    then
        n=1 
    else
        n="${1}"
    fi  
    ls -rt1 | tail -n ${n} | head -n 1
}
