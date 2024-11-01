printf "\n\n#### Setting Up Java\n\n\n"

apt install -y openjdk-8-jdk-headless
printf "JAVA_HOME=%s\n" $(realpath $(which java) | sed 's#/jre/.*##') >> /etc/environment
