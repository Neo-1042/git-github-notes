# Go back locally to the commit before the last one

# --hard discards both staged and unstaged changes from the last commit
git reset --hard HEAD~1

# Push the change to GitHub, overwriting the remote history

git push origin <branch_name> --force
# --force is required because you are pushing a history that is different from the remote's history

# If you only wanted to undo the changes but keep the commit history intact, you would use:
git revert HEAD

####################################################
# Now, here is a 'undo my undo' method: (TODO)