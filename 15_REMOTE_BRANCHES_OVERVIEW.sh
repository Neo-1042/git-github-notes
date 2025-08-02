############ BRANCH TYPES OVERVIEW  ############

# Local branch  = Branch your machine only
# Remote branch = Branch in remote location (e.g. BitBucket)
# The only two ways to visualize remote branches are on the remote repo (BB) or:
git ls-remote 

# Tracking branch => exchanging information between local and remote repos
    # Remote tracking branch -> A local copy of the actual remote branch (READ ONLY)
        # /remotes/origin/master
        git fetch # to get the latest state of the actual remote 'master' to the local repository
    # Local Tracking Branch -> Local reference to remote tracking branch (can be edited)
        git push ; git pull ; git fetch

# How are local and remote branches connected?
# REMOTE BRANCH
#   |
#   |
#   |
git fetch
# REMOTE TRACKING BRANCH (local cache of remote branch's content)
#   |
#   |
#   |
git merge
# LOCAL TRACKING BRANCH

# This is why git pull = git fetch + git merge (in that order)
#------------------------------------------------------------------------------------------#
# Create a local tracking branch to add it to GitHub
git branch --track feature-remote-local origin/feature-remote
git branch -a
git checkout feature-remote-local
touch local-tracking-branch.txt
git add .
git commit -m "Add file in local tracking branch"
git checkout remotes/origin/feature-remote
git checkout feature-remote-local
git push # to update remote tracking branch and the remote branch.
# ERROR. FATAL: The upstream branch of your current branch does not match the name of your current branch.
# To push to the upstream branch on the remote, use
git push origin HEAD:feature-remote
# To push to the branch of the same name on the remote, use
git push origin HEAD
git branch -a
git checkout feature
git branch -D feature-remote-local # This branch was incorrectly named
# Create the branch with the correct name
git branch --track feature-remote origin/feature-remote
git branch -a
git switch feature-remote
    touch added_to_local_tracking_branch.txt
    git add .
    git commit -m "Add txt file to feature-remote branch"
    git push # OK. It's already on GitHub

git branch -vv # More details about branches
