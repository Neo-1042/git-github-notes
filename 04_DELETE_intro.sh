# DELETE Data from our git project

# 1] DELETE Working Directory Files (Already part of previous commits)
# 2] DELETE unstaged changes (either part of previous commits OR not even on the commits)
# 3] DELETE staged changes (unstage files that have been added with 'git add file' command)
# 4] DELETE whole commits
# 5] DELETE whole branches

###################################################################################################
# DELETE WD files
###################################################################################################
# At the same time, we have to be aware of the files that we have on the SA = Staging Area
git ls-files # These files are on the staging area and WD
git status
# Remove file.txt from the working directory first
git add file1.txt 
git rm file1.txt
git status # Deleted: file1.txt
git ls-files # file1.txt won't appear here
git commit -m "Deletes file1.txt"
###################################################################################################
# DELETE Unstaged changes
###################################################################################################
# Suppose we added some line of code of file2.cpp, but now we don't need it
# How to undo this change?
# Go back to the latest commit to get rid of this unstaged change
git branch # development
git checkout -- # No other branch, just checkout the CURRENT branch
git checkout # The same as 'git checkout --'
git checkout file2.cpp # refers to the HEAD of this file on the CURRENT branch
#-------------------------------------------------------------------------------------------------#
git checkout . # Return the state of ALL files on this current branch
# That is, suppose you made changes to 2 python files, 3 cpp files and 1 XML file, BUT
# We no longer need/want these UNSTAGED changes (that is, you haven't executed git add nor git commit)
# Then, to restore/undo all UNSTAGED changes:
git checkout .
# From git v2.23 on:
git restore file2.cpp # Revert changes in tracked files
# Delete untracked files
git clean -dn # d -> delete all UNSTAGED changes, n -> name the files to be deleted
git clean -df # f -> force
#-------------------------------------------------------------------------------------------------#
###################################################################################################
# DELETE staged changes (SA = Staging Area)
###################################################################################################
echo "Hello, file" > new.txt
git add new.txt
git status
# Traditional way of deleting staged files:
git reset new.txt # Copies the latest stage of the file into the SA
git checkout new.txt # Delete unstaged changes
# New way (git version > 2.23) More explicitly says that we are unstaging files
git restore --staged new.txt
git checkout new.txt
# Actually, git reset is used more often in another context
###################################################################################################
# DELETE commits
# git reset (soft, default and hard)
###################################################################################################
echo "JavaScript sucks" > unrequired.js
git add unrequired.js
git ls-files # Display files in the Staging Area
# Remember that files that are on commits will still be on the SA
git commit -m "Adds unrequired.js file" # commitJS13
git log 
# commitJS13 (HEAD -> master) This is the latest commit
# desired-commit07 This is the second-to-last commit. We want to go back to this commit
git reset --soft HEAD~1 # Go back 1 commit but keep changes on the SA
git reset --soft HEAD~2 # Go back 2 commits but keep changes on the SA
git reset --soft HEAD^3 # Go back 3 commits but keep changes on the SA
#-------------------------------------------------------------------------------------------------#
# We choose to go back 1 commit (go back to 'desired-commit07')
git reset --soft HEAD~1 # However, the changes will still be in the staging area
git ls-files # 'unrequired.js' is still in the staging area (SA). How to remove from SA?
git restore --staged unrequired.js
#-------------------------------------------------------------------------------------------------#
# Instead, we choose to delete the commit and delete the changes from the SA at the same time:
git reset HEAD~1
git log
git ls-files # 'Unrequired.js' is NOT in the staging area, nor in the commits area
# How ever, 'Unrequired.js' is still in our local files
#-------------------------------------------------------------------------------------------------#
git reset --hard HEAD~1 # Remove the file everywhere
git log # Not here (commits)
git ls-files # Not here (staging area)
###################################################################################################
# DELETE branch
###################################################################################################
git branch -d feature-branch # Only deletes branch 'feature-branch' if it was already merged
git branch -D feature-branch # Forces the deletion of the branch, no matter if it was merged or not
git branch -D second-branch third-branch # Force delete multiple branches
###################################################################################################
###################################################################################################