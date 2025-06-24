############ FROM LOCAL TO REMOTE ############
# Reminder:
URL="https://github.com/Neo-1042/git-github-notes.git"
git remote add origin ${URL}
git remote -v # Verify that you linked the local <-> remote repos correctly
#######################################################################
# Understading the workflow

# Local branch             -> master
# Remote tracking branch   -> remotes/origin/master (intermediary)
# Remote branch ("origin") -> master

git fetch # fetch the latest changes from the remote branch and add them to remotes/origin/master
git merge # remotes/origin/master (local, read-only for us)
# fetch + merge = pull
#######################################################################
git branch -a # Display remote and local branches
# remotes/origin/master
git branch -r # Display only remote branches
git branch -vv # Verbose

git branch feature # local
git add .
git commit -m "Add bla bla"
git push origin feature
#################################
git branch -a
# * feature
#   master
#   remotes/origin/feature
#   remotes/origin/master
#################################
# remotes/origin/master vs the ACTUAL remote branch
git branch -r # Intermediary copy of the actual remote branch
git ls-remote # list all the ACTUAL remote branches
#################################
# Create a branch from GitHub: 'feature-remote'
git fetch origin # brings the 'feature-remote' branch to the local directory 'remotes/origin/feature-remote'
git pull origin master
#################################
# Extra: to rename local branch 'main' to 'master' after it was renamed on the remote repo:
git branch -m main master
git fetch origin
git branch -u origin/master master
git remote set-head origin -a