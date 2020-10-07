# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# big big history
export HISTSIZE=10000000
export HISTFILESIZE=10000000

# Allow use of Ctrl-S in Bash history-search (Ctrl-R) to forward search
# (only for interactive shell, hence the condition)
[[ $- == *i* ]] && stty -ixon

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
