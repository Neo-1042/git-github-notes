############ FROM LOCAL TO REMOTE ############
# Reminder:
URL="https://github.com/Neo-1042/git-github-notes.git"
git remote add origin ${URL}
git remote -v # Verify that you linked the local <-> remote repos correctly
#######################################################################
# Understading the workflow
git branch -a # Display remote and local branches
# remotes/origin/master
git branch -r # Display only remote branches
git branch -vv # Verbose

