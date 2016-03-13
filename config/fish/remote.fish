##
# This file contains commands which are useful only in remote servers
##

if command_exists rmate
  alias subl "rmate"
end

# Use nano as editor in remotes
set -U EDITOR nano
