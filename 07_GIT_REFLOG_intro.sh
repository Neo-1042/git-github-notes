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
