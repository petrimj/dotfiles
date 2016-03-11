##
# This file contains commands which are useful only in remote servers
##

##
# Use custom rmate port to avoid clashes with other users
##
if file_exists rmate
   alias rmate "rmate --port 52777" 
end