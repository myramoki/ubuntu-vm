# https://phoenixnap.com/kb/linux-mount-cifs

printf "\n#### BEGIN CIFS Config\n\n\n"

read -p "?? Add Windows share path [return for nothing] " respDest

if [ -n "$respDest" ]; then
    read -p "?? Enter username: " respUsername
    read -p "?? Enter password: " respPassword

    apt-get -qq install cifs-utils

    if $(mount | grep -q /mnt/shared); then
        umount -f /mnt/shared
    else
        mkdir -p /mnt/shared
    fi

    printf "#- setup creds\n"

    mkdir /etc/cifs-creds
    chmod 700 /etc/cifs-creds

    printf "username=%s\npassword=%s\n" $respUsername $respPassword >> /etc/cifs-creds/shared

    printf "#- setup fstab\n"

    sed -i.bak '/\/mnt\/shared/d' /etc/fstab
    printf "%s /mnt/shared cifs credentials=/etc/cifs-creds/shared,uid=%s,gid=%s 0 0\n" $respDest $(id -u bn) $(id -g bn) >> /etc/fstab

    touch /tmp/doreboot
fi

printf "\n#### FINISHED CIFS Config\n\n"
