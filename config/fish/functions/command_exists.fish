##
# Check if command exists
# @param $1 command_name
# @return boolean
##
function command_exists
    command -v "$argv" >/dev/null 2>&1
end
