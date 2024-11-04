printf "\n\n#### BEGIN SSH Config\n\n\n"

sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh

printf "\n\n#### FINISHED SSH Config\n\n\n"
