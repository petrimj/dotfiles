# Add aliases
alias ll "ls -lah"
alias grep "grep --color=always"

# Run docker commands in project with docker-compose.yml
function dexec
    docker exec -it (docker-compose ps -q web) $argv
end

##
# Check headers from curl with normal GET method
# Usage: $ headers google.fi
##
alias headers "curl -sD - -o /dev/null"

##
# Check if command exists
# @param $1 command_name
# @return boolean
##
function file_exists
    command -v "$argv" >/dev/null 2>&1
end

##
# Check if this is local or remote
##
function is_local_shell
  count $SSH_CONNECTION > /dev/null
end

##
# Remove variables
##
function unset
    set --erase "$argv"
end