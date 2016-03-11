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

source ~/.config/fish/aliases.fish

source ~/.config/fish/hacks.fish

# Use remote hacks if connection is not local and local hacks otherwise
if eval $SSH_CONNECTION
    source ~/.config/fish/remote.fish
else
    source ~/.config/fish/local.fish
end

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

