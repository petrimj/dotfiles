# This is normal GET request instead of HEAD request
# It also follows redirects
# Usage: $ headers google.fi
function headers --description 'Print all headers of request'
    curl -LsD - $argv -o /dev/null
end
