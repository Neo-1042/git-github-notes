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
###################################################################################################
# Remote and Tracking Branches. Command overview
git remote # Show remote servers
git branch -a # List all branches (local)
git branch -r # Remote tracking branches
# ****************************************************** #
git remote show origin # Show detailed configuration
# ****************************************************** #
git branch -vv # List local tracking branches and their remotes
git branch --track development origin/development # Craete local tracking branch called 'development'

################### CLONING ############################
# GitHub ---------------------------> git
git clone https://github.com/Neo-1042/git-github-notes.git
# You can clone via HTTPs (Server certificates, TLS) or using an 
# SSH key (more secure, since it uses public key cryptography encryption)
git clone git@github.com:Neo-1042/git-github-notes.git
# SSH Reminder: ssh user@FQDN
########################################################
git branch
git branch -a
git branch -vv # List local tracking branches and their respective remotes
# To work on the 'feature' branch, you create a local tracking branch
#   which refers to the remote tracking branch:
git branch --track origin/feature remotes/origin/feature
git branch -a # Now shows:
# *master
# origin/feature
git checkout -b "feature-local"
git branch -a
git branch -vv # "feature-local" is not currently referring to any remote branch
touch file1.txt
git add .
git commit -m "Add file1-txt"
git push origin feature-local # Push that branch to a new remote branch called "feature-local"
git branch -vv # Unfortunately, this is showing that this 'feature-local' is not referring to the
               # the desired remote tracking branch
# How to turn it into a LOCAL TRACKING BRANCH?
git checkout master
git branch -D feature-local
git branch --track feature-local origin/feature-local
git branch -vv # Shows that 'feature-local' is tracking [origin/feature-local]
# feature-local  ff1d76f [origin/feature-local] Add file1.txt
# *master        4f5ddf4 [origin/master] Commit number 2
# origin/feature 59551d5 [remotes/origin/feature] F1 commit
###############################################################################
# LOCAL AND REMOTE TRACKING BRANCHES
# 20251108 review
git remote # Show remote servers (origin)
git branch -a # List all branches
git branch -r # remote tracking branches
# origin/feature, origin/master, origin/feature2
git remote show origin # Show detailed configuration
git remote -vv # List local tracking branches and their remotes
###############################################################################
# Access an existing GitHub repository
# 20251129 PRACTICE
cd /GIT/
git clone git@github.com:Neo-1042/new_repository.git
cd new_repository
# Working with the recently cloned repository
git branch
# * master
git branch -a
# * master
# remotes/origin/HEAD -> origin/master
# remotes/origin/feature
# remotes/origin/feature-remote
# remotes/origin/master
git branch -vv
# We see that, indeed, master is a LOCAL TRACKING BRANCH
# * master 4f5ddf4 [origin/master] m2 ----> Contains all the information of the remote tracking branch
# But the others are missing!
# If you want to work in another branch, you create a remote tracking branch for that other remote branch
git branch --track origin/feature remotes/origin/feature
# Message = Branch 'origin/feature" set up to track remote branch 'feature' from 'origin'

# Now, we will see different messages for "git branch -a" and "git branch -vv"
git branch -a
# * master
# origin/feature (THIS ONE IS NEW)
# remotes/origin/HEAD -> origin/master
# remotes/origin/feature
# remotes/origin/feature-remote
# remotes/origin/master
git branch -vv # Show verbose information for local branches only
# Now origin/feature appears as a local branch, cool.
# master         4f5ddf4 [origin/master] m2
# origin/feature 59551d5 [remotes/origin/feature] f1
###############################################################################
# Adding a new branch locally and then pushing it to the remote repository
git checkout -b "local-branch"
git branch -a
# * local-branch (NEW)
# master
# origin/feature
# remotes/origin/HEAD -> origin/master
# remotes/origin/feature
# remotes/origin/feature-remote
# remotes/origin/master
git branch -vv
# * local-branch 4f5ddf4 m2 ------> NEW, this branch is not in the remote repository yet.
# master         4f5ddf4 [origin/master] m2
# origin/feature 59551d5 [remotes/origin/feature] f1

touch somefile.txt
git add .
git commit -m "Add somefile.txt to 'local-branch' "
git push origin local-branch
# [...]
# [new branch] local-branch -> local-branch

# This new branch is shown here:
git branch -a
# HOWEVER, it is not yet being shown here:
git branch -vv

# Switch to master
git checkout master
# Remove this local branch
git branch -D local-branch
# Create a new local-tracking branch
git branch --track origin/local-branch remotes/origin/local-branch

git branch -vv
# local-branch   ff1d76f [origin/local-branch] Add somefile.txt ------> NEW
# master         4f5ddf4 [origin/master] m2
# origin/feature 59551d5 [remotes/origin/feature] f1
# OK. SUCCESS