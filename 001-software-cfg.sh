printf "\n\n#### Setting Up Basic Software\n\n\n"

apt update -y
apt upgrade -y
apt install unzip

sed -i 's#/usr/games:/usr/local/games:##' /etc/environment
