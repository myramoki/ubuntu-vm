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
	s) sh -c "$(curl https://raw.githubusercontent.com/myramoki/ubuntu/main/setup-basic.sh)" ;;
	b) sh -c "$(curl https://raw.githubusercontent.com/myramoki/ubuntu/main/setup-builder.sh)" ;;
	t) sh -c "$(curl https://raw.githubusercontent.com/myramoki/ubuntu/main/setup-tomcat.sh)" ;;
	z) sh -c "$(curl https://raw.githubusercontent.com/myramoki/ubuntu/main/setup-biznuvo.sh)" ;;
	esac
fi
