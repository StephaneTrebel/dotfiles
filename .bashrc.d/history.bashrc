# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# big big history
export HISTSIZE=100000
export HISTFILESIZE=100000

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
