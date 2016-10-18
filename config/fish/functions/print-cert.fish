##
# Check if command exists
# @param $1 command_name
# @return boolean
##
function print-cert
    openssl x509 -text -noout -in "$argv"
end
