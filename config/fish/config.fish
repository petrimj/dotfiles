##
# onnimonni preferred aliases and functions
##

##
# Get current conf file directory
# This needs to resolve symlinks from rcm
##
switch (uname)
case Darwin # OS-X
    set FISH_CONF_DIR ( dirname ( readlink    (status --current-filename) ) )
case '*'
    set FISH_CONF_DIR ( dirname ( readlink -f (status --current-filename) ) )
end

source $FISH_CONF_DIR/aliases.fish
source $FISH_CONF_DIR/hacks.fish

# Use remote hacks if connection is not local and local hacks otherwise
if test -d $SSH_CONNECTION
    source $FISH_CONF_DIR/remote.fish
else
    source $FISH_CONF_DIR/local.fish
end

# Remove when not needed
unset FISH_CONF_DIR

# Show where I am
function fish_title
    echo -n (whoami)@(hostname):(pwd)
end

# Show current branch in shell
function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    echo -n (whoami)'@'(hostname)':'
    set_color green
    echo -n (prompt_pwd)
    set_color blue
    echo -n '{'"$git_branch"'} '
    set_color white
    echo -n '$ '
end

