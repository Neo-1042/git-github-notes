################### REBASE ####################
# m1 > m2 > m3
#      |
# m1   m2 > f1 > f2

# m1 > m2 > m3 ---------------------------
#      |                                 |
# m1   m2  (Push f1 and f2 to the end) > m3 > f1 > f2
# Rebase master to feature
# m3 becomes new base commit for commits created in feature branc

# Then, you merge the rebased feature into master:
# m1 > m2 > m3 > f1 > f2
#      |    | (rebase)
# m1   m2 > m3 > f1 > f2

# **** 'Rebase' does not move commits; it CREATES new commits
# **** NEVER rebase commits outside your own local repository.

# Let's code:
git branch
# feature
# *master
# m1 > m2 > m3
#      |
# m1   m2 > f1 > f2
git switch feature

git rebase master
# Succesfully rebased and updated /refs/heads/feature
# m1 > m2 > m3
#      |    |
# m1   m2 > m3 > f1 > f2
# These are NEW commits
git switch master
git merge fearure # Fast-forward merge
# m1 > m2 > m3 > f1 > f2
#      |    |
# m1   m2 > m3 > f1 > f2
# SUCCESS
###################################################################################################
# When to apply git rebase?

# If new commits appear in the master branch while working in the feature branch
# If my feature branch depends on new changes on the master branch
# When feature is finished and the implementation into master must be done without merge commit

# ***** Remember: rebasing re-writes code history