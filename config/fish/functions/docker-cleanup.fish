function docker-cleanup --description 'Cleans stopped containers and unused images'
  if command_exists docker
    echo "Removing stopped containers..."
    docker rm -v (docker ps -a -q -f status=exited)
    echo "Removing dangling images..."
    docker rmi (docker images -f "dangling=true" -q)
    echo "Removing dangling volumes..."
    docker volume rm (docker volume ls -qf dangling=true)
  end
end
