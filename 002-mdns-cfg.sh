# ref https://gist.github.com/jimmydo/e4943950427234408a1aaa2d7beda8b6

printf "\n\n#### Setting Up MDNS\n\n\n"

sed -i 's/#MulticastDNS=no/MulticastDNS=yes/' /etc/systemd/resolved.conf

mkdir /etc/systemd/network/$(ls /run/systemd/network).d
printf "[Network]\nMulticastDNS=yes\n" > /etc/systemd/network/$(ls /run/systemd/network).d/override.conf

resolvectl mdns eth0 yes
