##
# This file contains commands which are useful only in remote servers
##

##
# Use custom rmate port to avoid clashes with other users
##
if command_exists rmate
  alias subl "rmate --port 52777"
  alias rmate "rmate --port 52777"
end

# Use nano as editor in remotes
set -U EDITOR nano
