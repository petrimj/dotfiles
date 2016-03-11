##
# onnimonni preferred aliases and functions
##

##
# Check if command exists
# @param $1 command_name
# @return boolean
##
function file_exists
    command -v "$argv" >/dev/null 2>&1
end

##
# Remove variables
##
function unset
    set --erase "$argv"
end

# Check current conf file directory
switch (uname)
case Darwin # OS-X
    set FISH_CONF_DIR ( dirname ( readlink    (status --current-filename) ) )
case '*'
    set FISH_CONF_DIR ( dirname ( readlink -f (status --current-filename) ) )
end
echo "Modify fish configs: $FISH_CONF_DIR"

source $FISH_CONF_DIR/aliases.fish
source $FISH_CONF_DIR/hacks.fish

# Use remote hacks if connection is not local and local hacks otherwise
if eval $SSH_CONNECTION
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

