printf "\n#### BEGIN Java Config\n\n\n"

apt-get -y -qq install openjdk-8-jdk-headless
printf "JAVA_HOME=%s\n" $(realpath $(which java) | sed 's#/jre/.*##') >> /etc/environment

printf "\n#### FINISHED Java Config\n\n"
