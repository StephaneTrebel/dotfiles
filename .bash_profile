# Invoke GnuPG-Agent the first time we login.
# Does `.gpg-agent-info' exist and points to a gpg-agent process accepting signals?
if [ -f $HOME/.gpg-agent-info ] && \
    kill -0 $(cut -d: -f 2 $HOME/.gpg-agent-info) 2>/dev/null
then
    # Yes, `.gpg-agent.info' points to valid gpg-agent process;
    # Indicate gpg-agent process
    GPG_AGENT_INFO=$(cat $HOME/.gpg-agent-info | cut -c 16-)
else
    # No, no valid gpg-agent process available;
    # Start gpg-agent
    eval $(gpg-agent --daemon --no-grab --write-env-file $HOME/.gpg-agent-info)
fi
export GPG_TTY=$(tty)
export GPG_AGENT_INFO
. "$HOME/.cargo/env"
