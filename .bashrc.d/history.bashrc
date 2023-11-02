# avoid duplicates..
export HISTCONTROL=ignorespace:ignoredups:erasedups

# infinite history
export HISTSIZE=-1
export HISTFILESIZE=-1

# Allow use of Ctrl-S in Bash history-search (Ctrl-R) to forward search
# (only for interactive shell, hence the condition)
[[ $- == *i* ]] && stty -ixon

# append history entries..
shopt -s histappend

# After each command, save and reload history
# setLastCommandState and setGitPrompt come from bash-git-prompt
export PROMPT_COMMAND="setLastCommandState; history -a; history -c; history -r; setGitPrompt"
