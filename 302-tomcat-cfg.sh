# Setup tomcat with basic stuff

printf "\n\n#### Setting Up Tomcat\n\n\n"

DEFAULT_TOMCAT_VERSION=9.0.96

read -p "?? Version of Tomcat to install [$DEFAULT_TOMCAT_VERSION] " respTomcatVersion

if [ -z "$respTomcatVersion" ]; then
    respTomcatVersion=$DEFAULT_TOMCAT_VERSION
fi

apt-get -qq install authbind libtcnative-1

useradd -m -d /opt/tomcat -U -s /bin/false tomcat
usermod -a -G tomcat bn

touch /etc/authbind/byport/80 /etc/authbind/byport/443
chmod 500 /etc/authbind/byport/80 /etc/authbind/byport/443
chown tomcat /etc/authbind/byport/80 /etc/authbind/byport/443

curl -sL https://dlcdn.apache.org/tomcat/tomcat-9/v$respTomcatVersion/bin/apache-tomcat-$respTomcatVersion.tar.gz \
	| tar xzvf - -C /opt/tomcat \
		--strip-components=1 \
		--exclude='*/webapps/examples' --exclude='*/webapps/docs'

chown -R tomcat:tomcat /opt/tomcat/
chmod -R u+x /opt/tomcat/bin
chmod -R go+rX /opt/tomcat

printf '[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat
UMask=0022

Environment="JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64"
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:///dev/urandom"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx2048M -server -XX:+UseParallelGC -Djava.net.preferIPv4Stack=true"

ExecStart=/usr/bin/authbind --deep /opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/tomcat.service

sed -i \
	-e '/<\/tomcat-users>/i \  <user username="tomcat" password="tomcat" roles="manager-gui" />' \
	-e '/<\/tomcat-users>/i \  <user username="server" password="5Star*" roles="manager-script" />' \
	/opt/tomcat/conf/tomcat-users.xml

sed -i \
	-e '/Valve/i <!--' \
	-e '/Manager/i -->' \
	/opt/tomcat/webapps/manager/META-INF/context.xml

systemctl daemon-reload
systemctl enable tomcat
systemctl start tomcat
