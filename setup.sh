echo "
##
## Choose which setup you want to run:
##
##   s - Basic starter setup [default]
##   b - Builder setup (Java, Gradle and SSH Keys)
##   t - Basic Tomcat setup with Java
##   z - Biznuvo setup
##
"

read -p "?? Select setup type: [sbtz] " respType

if [ -n "$respType" ]; then
	case $respType in
	b)
		echo "# Processing setup-builder"
		sh -c "$(curl \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/001-software-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/002-mdns-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/003-ssh-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/004-ufw-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/101-network-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/102-cifs-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/201-java-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/301-gradle-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/602-github-ssh-cfg.sh \
		)"
		;;

	t)
		echo "# Processing setup-tomcat"
		sh -c "$(curl \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/001-software-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/002-mdns-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/003-ssh-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/004-ufw-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/101-network-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/102-cifs-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/201-java-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/301-gradle-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/302-tomcat-cfg.sh \
		)"
		;;

	z)
		echo "# Processing setup-biznuvo"
		sh -c "$(curl \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/001-software-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/002-mdns-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/003-ssh-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/004-ufw-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/101-network-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/102-cifs-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/201-java-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/301-gradle-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/302-tomcat-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/601-ssl-tomcat-cfg.sh \
		)"
		;;

	*)
		echo "# Processing setup-basic"
		sh -c "$(curl \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/001-software-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/002-mdns-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/003-ssh-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/004-ufw-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/101-network-cfg.sh \
			https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/102-cifs-cfg.sh \
		)"
		;;
	esac
fi
