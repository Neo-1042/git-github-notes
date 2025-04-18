################### GIT STASH ###################
echo "hello git stash" > file1.txt
git init
git add .
git commit -m "Adds file1.txt" # Commit400

# Stash => A sort of internal memory that saves UNCOMMITTED, UNSAVED changes
git branch # master
echo "Adding some feature" >> file1.txt
git stash
# Saved working directory and index state WIP on master: Commit400 Adds file1.txt
# The git stash allows you to save UNSTAGED changes until you are ready to 'git add' and 'git commit' them
git switch -c new-branch
# ...
git switch master
git stash apply # This brings back the echo "Adding some feature" >> file1.txt change, so you can add and commit it

git stash list
# stash@{0}: WIP on master: Commit400 Adds file1.txt
# stash@{1}: WIP on master: Commit400 Adds file1.txt
# stash@{2}: WIP on master: Commit400 Adds file1.txt

git stash apply 2

git stash push -m "Added LDAP classes"
git stash pop 0 # Add to the project, removing it from the stash (stack)
git add .
git commit -m "Adds LDAP classes. Updates documentation"

git stash drop 0 # Deletes the latest stash without applying to the project
git stash list # Gone

git stash clear # Clear the entire git stash
