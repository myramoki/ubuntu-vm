# https://phoenixnap.com/kb/linux-mount-cifs

read -p "?? Add Windows share? [y/N] " respDoSharing

if [ "$respDoSharing" = "y" ]; then
	apt install -y cifs-utils

	read -p "?? Enter destination path: " respDest

	if [ -n "$respDest" ]; then
		read -p "?? Enter username: " respUsername
		read -p "?? Enter password: " respPassword

		if $(mount | grep -q /mnt/winshare); then
			umount -f /mnt/winshare
		else
			mkdir -p /mnt/winshare
		fi

		mkdir /etc/cifs-creds
		chmod 700 /etc/cifs-creds

		printf "username=%s\npassword=%s\n" $respUsername $respPassword >> /etc/cifs-creds/winshare

		sed -i.bak '/\/mnt\/winshare/d' /etc/fstab
		printf "%s /mnt/winshare cifs credentials=/etc/cifs-creds/winshare,uid=%s,gid=%s 0 0\n" $respDest $(id -u bn) $(id -g bn) >> /etc/fstab

		touch /tmp/doreboot
	fi
fi
