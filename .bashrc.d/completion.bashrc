# This function checks whether we have a given program on the system.
#
_have()
{
    # Completions for system administrator commands are installed as well in
    # case completion is attempted via `sudo command ...'.
    PATH=$PATH:/usr/sbin:/sbin:/usr/local/sbin type $1 &>/dev/null
}

# Backwards compatibility for compat completions that use have().
# @deprecated should no longer be used; generally not needed with dynamically
#             loaded completions, and _have is suitable for runtime use.
have()
{
    unset -v have
    _have $1 && have=yes
}

for file in /etc/bash_completion.d/* ; do
	source "$file"
done
