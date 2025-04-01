git checkout master
git log
# c1, c2, c3, c4 <- HEAD (latest commit of 'master' and (possibly) another branch)
git checkout Feature04
git log
# c1, c2, c3, c4, c5 <- HEAD (latest commit of 'Feature04')
###################################################################################################
# DETACHED HEAD
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
