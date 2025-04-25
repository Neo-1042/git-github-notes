################### COMBINING BRANCHES ####################
# master = main
# feature branches
# GOAL: How to combine master <---> featureX branches?
#       Either master INTO featureX or featureX into master
git merge
git rebase # NEW
###########################################################
# MERGE TYPES
# 1] Fast-forward +++++
# 2] Non fast-forward:
#    Recursive +++++
#    Octopus
#    Ours
#    Subtree

# However, the mostly used merge types are: fast-forward and recursive (which is non ff)
#################################################################################
# FAST-FORWARD merge
# This only works when there are NO additional commits in the master branch
#  AFTER the feature branch was created
# MASTER   m1, m2
# FEATURE  m1, m2, f1, f2, f3 <- HEAD is moved forward to feature's last commit
git switch master
git merge feature # fast-forward merge of FEATURE into MASTER
# In this case, the ff merge moves the HEAD forward to the f3 commit :O
# but does NOT create a new commit.
mkdir master
cd master
touch m1.txt
git add .
git commit -m "M1"
touch m2.txt
git add .
git commit -m "M2"
# Feature branch
git switch -c feature
mkdir feature
cd feature
touch f1.txt
git add .
git commit -m "F1"
touch f2.txt
git add .
git commit -m "F2"

git switch master
git merge feature # Fast-forward merge
# No new commits were created
# F2 : HEAD -> master, feature
# git branch -D feature # Delete the branch
# Undo the merge
git reset --hard HEAD~2 # To go back to the state where 'feature' had not been merged into 'master'

git switch master
git merge --squash feature # Combine or squash all the feature commits into one, then merge with master
# HEAD is not yet updated
git status # Changes to be committed
git commit -m "Merges feature into master after squash merge"

git reset --hard HEAD~1 # Go back to the state before any merges were done
###################################################################################################
# RECURSIVE MERGE (NON fast-forward merge)
# For cases when you have new commits in the master branch AFTER branching into the feature branch
# m1 > m2 > m3 -------> NEW_MERGE after the new branch was created
#      |
# m1   m2 > f1 > f2
#
# An additional merge-commit is (automatically) created in the master branch
###################################################################################################
git merge --no-ff feature # I don't want to use the fast-forward merge
# Merge made by the 'recursive' strategy
# Automatically creates a NEW commit:
# Merge branch 'feature' into master
# m1 > m2  > m3 > NEW
#      |           |
# m1   m2  > f1 > f2
git reset --hard HEAD~1 # To revert the merge commit ("Merge branch 'feature' into master")

# However, when you have additional commits on the master branch after branching
git switch master
touch m4.txt
git add .
git commit -m "M4"
# and then you merge 'feature' into 'master':
git merge feature
# Merge made by the 'recursive' strategy
git log # Check the newly-created merge commit
