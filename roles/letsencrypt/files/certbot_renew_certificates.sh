#!/bin/bash

# This script renew certbot certificates

# To simulate the renewal :
# certbot renew --dry-run

# Get the name of this script
script_name=$( basename "$0" )

# Function that will echo and log the messages at the same time
function msg {
	echo "$1"
	logger "$script_name - $1"
}

# Make sure that certbot is installed
if [[ ! $( which certbot ) ]]; then
    msg "Error - Unable to find certbot"
    exit 0
fi

# Renew the certificates
certbot -q renew --renew-hook "systemctl reload nginx"
errorlevel=$?

# Verify the result
if [[ $errorlevel -eq 0 ]]; then
    msg "OK - The certbot/letsencrypt certificates have been renewed or verified correctly."
else
    msg "Error - Unable to renew the certbot/letsencrypt certificates properly (errorlevel:$errorlevel)"
fi


