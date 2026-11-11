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
###################################################################################################################
# 20261105
# Elliptic Curves (Better)
ssh-keygen -t ed25519 -C "email@example.com"
# Default Location = ~/.ssh/id_ed25519
# Press enter twice to leave passphrase in blank

# Start ssh-agent in the background
eval "$(ssh-agent -s)"
# Agent pid 12345

# Agregar llave privada al agente SSH:
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub > /dev/clipboard # Git Bash

# GitHub > Settings > SSH and GPG Keys > New SSH Key

# Validate connection
ssh -T git@github.com

# ChangedProxy Settings Eclipse Git
####################################################################################
# (20261110 -> First successful commit to this bank)
# Reset to second-to-last commit
git reset --hard HEAD~1
git push origin feature/featureX --force

# Upload new changes from there
git add -A
git commit -m "New changes"
git push origin feature/featureX
####################################################################################