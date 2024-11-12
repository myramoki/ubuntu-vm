printf "\n#### BEGIN Software Config\n\n"

apt-get -y -qq update
apt-get -y -qq upgrade
apt-get -y -qq install unzip

sed -i 's#/usr/games:/usr/local/games:##' /etc/environment

printf "\n#### FINISHED Software Config\n\n"
