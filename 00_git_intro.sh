28/March/2025

Git means tracking changes, NOT storing files again and again!

Working Directory WD = Local directory tracked by git (.git hidden folder)

Repository = Where all the version management happens

The git repository is divided into two areas:
[1] Staging Area (Basically an index File) => Draft area before becoming an actual commit
[2] Commits (Contains the different snapshots)

Note: The commits set is a subset of the staging area set. i.e., every file in the commit area is also
in the staging area, but not necessarily the other way around.

Workflow:
WD --> SD --> Commits
---------------------------------------------------------------------------------------------------
# BASIC COMMANDS SUMMARY
git --version
git init
git status # Check WD and SA status
git log # Display all commits of the current branch
git branch # Display all branches
git ls-files # List all files in SA

git add filename.txt
git add . # Add all to SA
git add -A # Same as 'git add .'
git commit -m "Create new commit"
# Correcting a commit message (before pushing it to remote repo)
git commit --amend -m "Correct commit message"
git checkout commit_hash123 # Checkout commit DETACHED HEAD!!!
git branch new-branch
git switch new-branch
git checkout other-branch
git checkout -b new-branch
git switch -c new-branch
git merge other-branch
