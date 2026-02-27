# Set up SSH keys authentication
ssh-keygen -t rsa -b 4096 -C "email@example.com"
# Passphrase (enter for no passphrase)

# RSA keypair saved in ~/.ssh
# id_rsa
# id_rsa.pub

cat ~/.ssh/id_rsa.pub > /dev/clipboard # Git bash

# GitHub || BitBucket
# Profile > Settings > SSH Keys > Add New SSH Key

git clone git@github.com:Neo-1042/git-github-notes.git