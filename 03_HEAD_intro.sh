git checkout master
git log
# c1, c2, c3, c4 <- HEAD (latest commit of 'master' and (possibly) another branch)
git checkout Feature04
git log
# c1, c2, c3, c4, c5 <- HEAD (latest commit of 'Feature04')
###################################################################################################
# DETACHED HEAD
###################################################################################################
git checkout branch10 # Means that HEAD points to the latest commit of 'branch10'
git checkout commit10323 # Means that HEAD now points to that specific commit. In which branch?
# However, if 'commit10323' is shared by multiple branches, then we have a DETACHED HEAD
# You are in 'DETACHED HEAD' state. This DETACHED HEAD is not part of any specific branch
git branch
# * (HEAD detached at commit10323)
# master
# feature01
# feature02
# feature03
#-------------------------------------------------------------------------------------------------#
# Committing DETACHED HEAD changes
git branch # master
git log # 4 commits
echo "dummy" > dummy.txt
git add .
git commit -m "Adds dummy txt file"
# What if I forgot to add something to the second-to-last commit?
git checkout 00002
# DETACHED HEAD mode
echo "I forgot to add this part. It's good to have DETACHED HEAD" > detached.txt
git status
git add .
git commit -m "Changes made in DETACHED head"
git switch master # PROBLEM
# Warning: you are leaving 1 commit behind, not connected to any of your branches
git branch detached-head 00002 # could be a solution
git switch detached-head
git switch master
git merge detached-head # Merge made by the 'recursive' strategy
###
git branch -D detached-head detached-head-solution-2