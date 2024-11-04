printf "\n\n#### Updating BN user information\n\n\n"

echo "[core]
    autocrlf = false
" > ~bn/.gitconfig
chown bn: ~bn/.gitconfig

curl -sL -o /tmp/ssh-keys https://raw.githubusercontent.com/myramoki/ubuntu-vm/main/biznuvo-repos-sshkeys.txz.gpg
gpg -d /tmp/ssh-keys | tar -J -tvf - -C ~/.ssh/

echo "
Host github.com-server-v2
    Hostname ssh.github.com
    Port 443
    IdentityFile=~/.ssh/biznuvo-server-v2-id_ed255519
" > ~bn/.ssh/config

chown bn: ~bn/.ssh/*
