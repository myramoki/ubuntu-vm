GITDIR="https://raw.githubusercontent.com/myramoki/ubuntu-vm/main"
GITBASIC="
	$GITDIR/001-software-cfg.sh \
	$GITDIR/002-mdns-cfg.sh \
	$GITDIR/003-ssh-cfg.sh \
	$GITDIR/004-ufw-cfg.sh \
	$GITDIR/101-network-cfg.sh \
	$GITDIR/102-cifs-cfg.sh \
"

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
		sh -c "$(curl $GITBASIC \
			$GITDIR/201-java-cfg.sh \
			$GITDIR/301-gradle-cfg.sh \
			$GITDIR/602-github-ssh-cfg.sh \
		)"
		;;

	t)
		echo "# Processing setup-tomcat"
		sh -c "$(curl $GITBASIC \
			$GITDIR/201-java-cfg.sh \
			$GITDIR/301-gradle-cfg.sh \
			$GITDIR/302-tomcat-cfg.sh \
		)"
		;;

	z)
		echo "# Processing setup-biznuvo"
		sh -c "$(curl $GITBASIC \
			$GITDIR/201-java-cfg.sh \
			$GITDIR/301-gradle-cfg.sh \
			$GITDIR/302-tomcat-cfg.sh \
			$GITDIR/601-ssl-tomcat-cfg.sh \
		)"
		;;

	*)
		echo "# Processing setup-basic"
		sh -c "$(curl $GITBASIC)"
		;;
	esac
fi

if [ -e /tmp/dofinal ]; then
	sh -c "$(cat /tmp/dofinal)"
fi

if [ -e /tmp/doreboot ]; then
	reboot
fi
