# Git prompt

# Load Git prompt utilities
source $HOME/bin/git/contrib/completion/git-prompt.sh

# source ~/.git-prompt.sh
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
	GIT_PROMPT_ONLY_IN_REPO=1
	GIT_PROMPT_FETCH_REMOTE_STATUS=1   # avoid fetching remote status
	GIT_PROMPT_IGNORE_SUBMODULES=1 # avoid searching for changed files in submodules
	GIT_PROMPT_WITH_VIRTUAL_ENV=1 # avoid setting virtual environment infos for node/python/conda environments
	GIT_PROMPT_SHOW_UPSTREAM=0 # show upstream tracking branch
	GIT_PROMPT_SHOW_UNTRACKED_FILES=no # can be no, normal or all; determines counting of untracked files
	GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=1 # avoid printing the number of changed files
    # GIT_PROMPT_START=...    # custom prompt start sequence
    # GIT_PROMPT_END=...      # custom prompt end sequence
    # as last entry source the gitprompt script
    # GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
    # GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
	# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
	GIT_PROMPT_THEME=Minimal # ls ~/.bash-git-prompt/themes
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
	# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	# ;;
# *)
	# ;;
# esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w$(__git_ps1 "\[\033[00m\](\[\033[01;31m\]%s\[\033[00m\])")\[\033[00m\]\$\n'
else
	PS1='${debian_chroot:+($debian_chroot)}\u:\w$(__git_ps1 "(%s)")\$\n'
fi
unset color_prompt force_color_prompt

