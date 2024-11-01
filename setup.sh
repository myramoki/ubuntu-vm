echo "
##
## Choose which setup you want to run:
##
##   s - Basic starter setup
##   b - Builder setup (Java, Gradle and SSH Keys)
##   t - Basic Tomcat setup with Java
##   z - Biznuvo setup
##
"

read -p "?? Select setup type: [sbtz] " respType

if [ -n "$respType" ]; then
	case $respType in
	s)
		echo "# Processing setup-basic"
		sh -c "$(curl -sL https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/setup-basic.sh)"
		;;

	b)
		echo "# Processing setup-builder"
		sh -c "$(curl -sL https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/setup-builder.sh)"
		;;

	t)
		echo "# Processing setup-tomcat"
		sh -c "$(curl -sL https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/setup-tomcat.sh)"
		;;
	
	z)
		echo "# Processing setup-biznuvo"
		sh -c "$(curl -sL https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/setup-biznuvo.sh)"
		;;
	esac
fi
