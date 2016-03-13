# Run docker commands in project with docker-compose.yml
function dexec
    docker exec -it (docker-compose ps -q web) $argv
end
