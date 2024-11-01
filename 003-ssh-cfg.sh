printf "\n\n#### Setting Up SSH Software\n\n\n"

sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh
