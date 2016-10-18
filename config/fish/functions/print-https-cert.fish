# This requests TLS handshake from https port, prints details and stops the connection
# Usage: $ print-https-cert google.fi
function print-https-cert --description 'Print https certificate details'
    set cert_host $argv[1]
    echo QUIT | openssl s_client -connect $cert_host:443 -showcerts
end
