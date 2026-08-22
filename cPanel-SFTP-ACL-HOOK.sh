#!/bin/bash
# Read the JSON string coming from cPanel's STDIN
json=$(cat)

homedir=$(echo "$json" | jq -r '.data.homedir')

setfacl -m g:sftpsuperuser:r-x $homedir #grants transit permissions to home
setfacl -m g:sftpsuperuser:rwx $homedir/public_html #grants read and write to public_html