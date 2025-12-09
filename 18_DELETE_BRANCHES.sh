# DELETING BRANCHES AND COMMITS

git branch -vv
git ls-remote

git fetch origin
# Before deleting:
git branch -a
# feature 
# feature-remote
# *master
# remotes/origin/feature
# remotes/origin/feature-local
# remotes/origin/feature-remote
# remotes/origin/feature-upstream
# remotes/origin/master

# Deleting the local branch
git branch -D feature
# After deleting
git branch -a
# feature-remote
# *master
# remotes/origin/feature ---> This remote tracking branch is still available
# remotes/origin/feature-local
# remotes/origin/feature-remote
# remotes/origin/feature-upstream
# remotes/origin/master

# Delete the remote tracking branch as well
git branch -D remotes/origin/feature
# ERROR: branch 'remotes/origin/feature' not found.

# Correct way to delete a remote tracking branch:
git branch --delete --remotes origin/feature

# After the deletion of both local and remote tracking branches:
git branch -a 
# feature-remote
# *master
# remotes/origin/feature-local
# remotes/origin/feature-remote
# remotes/origin/feature-upstream
# remotes/origin/master

# HOWEVER, this branch is still under refs/heads/
git ls-remote
# HEAD
# refs/heads/feature ---> STILL HERE
# refs/heads/feature-local
# refs/heads/feature-remote
# refs/heads/feature-upstream
# refs/heads/master

# That is, this branch is not yet fully deleted. To intercat with GitHub recall that we need
# to 'git push' or 'git pull' = fetch + merge
# DELETING in GitHub:
git push origin --delete feature

# Now, the branch is fully deleted. Nice.
git ls-remote
# HEAD
# refs/heads/feature-local
# refs/heads/feature-remote
# refs/heads/feature-upstream
# refs/heads/master
###############################################################################
# Let's remove another branch
git push origin --delete feature-remote
git ls-remote
# HEAD
# refs/heads/feature-local
# refs/heads/feature-upstream
# refs/heads/master
# If you query for remote tracking branches:
git branch -r
# origin/feature-local
# origin/feature-upstream
# origin/master

# In summary, if you delete a remote branch, its remote-tracking branch
# will be automatically deleted as well.
###############################################################################
# Reminder: Go back one commit and update GitHub as well
git reset --hard HEAD~1
git push --force origin master # Mind the '--force'
###############################################################################
# GITHUB SUMMARY

git remote add origin URL
# Branches
# Git -> local-tracking + remote-tracking
# GitHub -> remote
# Create a local-tracking branch
git branch --track branchname origin/branchname
###############################################################################