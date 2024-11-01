# ref https://askubuntu.com/questions/1064921/scripting-netplan-for-static-ip-address

printf "\n\n#### Setting Up Internet\n\n\n"

currentHostname=$(hostname)

read -p "?? Change hostname [$currentHostname] " respHostname

if [ -n "$respHostname" ]; then
    printf "%s\n" $respHostname > /etc/hostname
fi

read -p "?? Enter IP CIDR address: " respIpAddress

if [ -n "$respIpAddress" ]; then
    read -p "?? Enter Gateway address: " respGatewayAddress


    printf "# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        eth0:
            addresses:
            - %s
            nameservers:
                addresses:
                - %s
                search: []
            routes:
            -   to: default
                via: %s
    version: 2
" $respIpAddress $respGatewayAddress $respGatewayAddress > /etc/netplan/50-cloud-init.yaml

    echo "netplan apply" >> /tmp/dofinal

    touch /tmp/doreboot
fi
