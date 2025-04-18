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

# However, the mostly used merge types are: fast-forwared and recursive (non ff)
###########################################################
# FAST-FORWARD merge
# This only works when there are NO additional commits in the master branch
#  after the feature branch was created
# MASTER   m1, m2
# FEATURE  m1, m2, f1, f2, f3
git switch master
git merge feature # fast-forward merge of FEATURE into MASTER
# In this case, the ff merge moves the HEAD forward to the f3 commit :O
# but does NOT create a new commit.

