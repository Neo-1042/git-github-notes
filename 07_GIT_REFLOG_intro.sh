################### GIT REFLOG ################### 
# git log      => Commits area
# git ls-files => Staging Area
# Say you delete the last commit, like this:
git reset --soft HEAD~1 # Keep the changes on the STAGING AREA
git reset HEAD~1 # Default: delete the commit and delete the changes from the SA, but keeps it on the local files
git reset --hard HEAD~1 # Delete everything everywhere
# What if we need back the deleted information??
##################################################
git reflog
# Stores ALL the changes for 30 days
# Challenge: delete this changes and THEN get them back
git reset --hard 431c7f1 # Bringing back the lost commit
# SUCCESS
##################################################
# DELETED BRANCHES and GIT REFLOG
git switch -c featureX # Create and switch to a new branch
touch DSCredentials.java
git add DSCredentials.java
git commit -m "Adds datasource Credencials java file"
git branch master
git branch -D featureX # Oh NO!!! We deleted a branch that we actually needed
# How can I get my branch back? :c
git reflog # featureXhash10
# Recreate the branch in 2 steps:
# 1
git checkout featureXhash10 # DETACHED HEAD mode
# 2
git switch -c featureX
# This last step associates the detached HEAD to the new branch :D
##################################################
