################################ GITHUB_INTRO ################################
# What is GitHub?
# How are git and GitHub connected?
# Remote branches, remote tracking branches, local tracking branches
# Understanding upstreams
# git clone
###############################################################################
# GitHub = Remote git repository hosting
# Connecting git with GitHub :D
# 1] Local git repo to empty remote repo
# git ------------> GitHub = origin (alias/shorthand of the URL of the remote repo)

# Establish a connection between local and remote
# git remote add origin URL # origin := URL
git remote add origin https://github.com/Neo-1042/git-github-notes.git
git remote add ssh-origin git@github.com:Neo-1042/git-github-notes.git
# Verify that you set the URL correctly:
git remote -v
# Push the local data from git to GitHub
git push
git push -u origin master # or 'main', depending on the name of the branch
# Pull the remote data from GitHub to git
git pull

#### pull, fetch and merge in depth
# Reminder: git pull = fetch + merge (or rebase)
git fetch # updates changes from GitHub to my local git (NOT yet to my WD)
# Updates the remote-tracking branches under
    # /refs/remotes/<remoteRepoName>/
# This operation is safe to run at any time, since it never changes any of your local branches (WD)
# under
    # /refs/heads/
git pull # pulls code from GitHub to my working directory.
# git pull brings a local branch up-to-date with its remote version, while also updating your other
# remote-tracking branches

################### CLONING ############################
# GitHub ---------------------------> 
git clone https://github.com/q2e213xxx
# You can clone via HTTPs (Server certificates, TLS) or SSH (more secure)
# Recommended order:
git add .
git commit -m "Cambia xml"
git push -u origin development # Upstream
git tag -a v1.0.0 -m "First stable release wujuu"
###################################################################################################
# Personal Access Token
###################################################################################################
# For macOS users, the credentials can be updated via the terminal as follows:
git credential-osxkeychain erase
host=github.com
protocol=https

