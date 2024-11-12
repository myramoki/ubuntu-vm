# ref https://gist.github.com/jimmydo/e4943950427234408a1aaa2d7beda8b6

printf "\n#### BEGIN MDNS Config\n\n\n"

sed -i 's/#MulticastDNS=no/MulticastDNS=yes/' /etc/systemd/resolved.conf

printf "#- setup network.d\n"

mkdir -p /etc/systemd/network/$(ls /run/systemd/network).d
printf "[Network]\nMulticastDNS=yes\n" > /etc/systemd/network/$(ls /run/systemd/network).d/override.conf

printf "#- resolvectl mdns\n"

resolvectl mdns eth0 yes

printf "\n#### FINISHED MDNS Config\n\n"
