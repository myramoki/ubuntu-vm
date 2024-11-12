printf "\n#### BEGIN Gradle Config\n\n"

DEFAULT_GRADLE_VERSION=8.11

read -p "?? Version of Gradle to install [$DEFAULT_GRADLE_VERSION] " respGradleVersion

if [ -z "$respGradleVersion" ]; then
	respGradleVersion=$DEFAULT_GRADLE_VERSION
fi

printf "#- fetch gradle\n"

curl -sL -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-$respGradleVersion-bin.zip
unzip /tmp/gradle.zip -d /opt

cd /opt

ln -s gradle-$respGradleVersion gradle

printf "#- setup environment\n"

sed -i 's#/snap/bin#/snap/bin:/opt/gradle/bin#' /etc/environment
echo 'GRADLE_HOME=/opt/gradle' >> /etc/environment

sed -i 's#/snap/bin#/snap/bin:/opt/gradle/bin#' /etc/sudoers

printf "\n#### FINISHED Gradle Config\n\n"
