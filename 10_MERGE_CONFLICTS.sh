############# HANDLING MERGE CONFLICTS ############# 
# 
git switch master
echo "This is the change made in the master branch" >> f1.txt
git add .

git commit -m "change in master"
git switch feature
echo "I changed this in the feature branch" >> f1.txt # Conflict!

git switch master
git merge feature
# Auto-merging feature/f1.txt
# CONFLICT (content): Merge conflict in feature/f1.txt
# Automatic merge failed; fix conflicts and then commit the result.

# Accept Current Change => Changes in master branch
# Accept Incoming Change => Changes in the feature branch
# Accept Both Changes => *** (Put first the changes in master, then place the changes in the feature branch)
# Compare changes first
git merge --abort
# OR use 
git add f1.txt # to mark resolution
git log --merge # Shows the 2 commits that you are trying to merge
git diff # Shows the same content that shows when running "Compare changes" on VS Code
git status
git add .
git commit -m "Merged feature and master in f1 file"
###################################################################################################
####### MERGE vs REBASE vs CHERRY-PICK
###################################################################################################

# Merge (non fast-forward) -> Create merge commit combining changes in the master and feature branches
# git rebase -> Changes a single commit's parent (NOT RECOMMENDED) > Create new commit IDs
# Cherry-pick -> Add a specific commit to a specific branch (HEAD) > Copies commit with new ID

git switch master
echo "Some impotant feature!" >> m1.txt # Typo
git add .
git commit -m "Added text to m1 in master branch"

git branch feature-2
git switch feature-2
mkdir new-feature
cd new-feature
touch f-new.txt
git add .
git commit -m "Added f-new.txt file in feature-2 branch"
# Fix the typo written in the m1.txt file in the feature-2 branch
echo "Some important feature!" > m1.txt # Deletes previous version of the line
git add .
git commit -m "Typo in m1 fixed"

# Add another file
echo "I do not want this change to be in the master branch yet" > f2.txt
git add .
git commit -m "Added f2 text file in feature-2 branch"

# What if you want to add ONLY the commit that fixes the typo (but not all the following commits)

git log 
# typo_id_12345

git switch master
git cherry-pick typo_id_12345
# Typo in m1 fixed
git log # Only this commit has been added to 'master', but it has a NEW id

