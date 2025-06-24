############ BRANCH TYPES OVERVIEW  ############

# Local branch  = Branch your machine only
# Remote branch = Branch in remote location (e.g. BitBucket)
# The only two ways to visualize remote branches are on the remote repo (BB) or:
git ls-remote 

# Tracking branch > exchanging information between local and remote repos
    # Remote tracking branch = A local copy of the actual remote branch (READ ONLY)
    # /remotes/origin/master
git fetch # to get the latest state of the actual remote 'master' to the local repository