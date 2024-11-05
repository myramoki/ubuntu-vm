printf "\n#### BEGIN Software Config\n\n\n"

apt-get -qq update
apt-get -qq upgrade
apt-get -qq install unzip

sed -i 's#/usr/games:/usr/local/games:##' /etc/environment

printf "\n#### FINISHED Software Config\n\n"
