printf "\n\n#### Setting Up Gradle\n\n\n"

DEFAULT_GRADLE_VERSION=8.10.2

read -p "?? Version of Gradle to install [$DEFAULT_GRADLE_VERSION] " respGradleVersion

if [ -z "$respGradleVersion" ]; then
	respGradleVersion=$DEFAULT_GRADLE_VERSION
fi

curl -sL -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-$respGradleVersion-bin.zip
unzip /tmp/gradle.zip -d /opt

cd /opt

ln -s gradle-$respGradleVersion gradle

sed -i -e $'$a\\\nGRADLE_HOME=/opt/gradle' -e 's#/snap/bin#/snap/bin:/opt/gradle/bin#' /etc/environment
sed -i 's#/snap/bin#/snap/bin:/opt/gradle/bin#' /etc/sudoers
