sh -c "$(curl \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/001-software-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/002-mdns-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/003-ssh-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/004-ufw-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/101-network-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/102-cifs-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/201-java-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/301-gradle-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/302-tomcat-cfg.sh \
	https://raw.githubusercontent.com/myramoki/ubuntu/main/601-ssl-tomcat-cfg.sh \
)"

if [ -e /tmp/doreboot ]; then
	reboot
fi
