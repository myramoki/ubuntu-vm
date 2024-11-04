printf "\n\n#### Updating BN user information\n\n\n"

echo "[core]
        autocrlf = false
" > ~bn/.gitconfig
chown bn: ~bn/.gitconfig

curl -sL https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/biznuvo-repos-sshkeys.txz.gpg | gpg -d | tar -J -tvf - -C ~/.ssh/

echo "Host server-v2
        Hostname github.com
        IdentityFile=~/.ssh/biznuvo-server-v2-id_ed255519
" > ~bn/.ssh/config

chown bn: ~bn/.ssh/*
