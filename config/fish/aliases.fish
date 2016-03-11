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