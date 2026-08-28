#!/bin/bash
# Read the JSON string coming from cPanel's STDIN
json=$(cat)

homedir=$(echo "$json" | jq -r '.data.homedir')

#delays execusion of script, this is needed as around 4 seconds after this script is initially triggered, cPanel will perform an action that edits file permissions and will overwrite changes made by this script if this execution isn't delayed.
sleep 5

setfacl -m g:sftpsuperuser:r-x $homedir #grants transit permissions to home
setfacl -m g:sftpsuperuser:rwx $homedir/public_html #grants read and write to public_html
