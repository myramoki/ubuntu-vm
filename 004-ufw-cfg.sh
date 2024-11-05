printf "\n#### BEGIN UFW Config\n\n\n"

ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

printf "\n#### FINISHED UFW Config\n\n"
