printf "\n\n#### Setting Up UFW\n\n\n"

ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable
