########## DEEP DIVE SUMMARY #############

git stash # Temporary storage for unstaged and uncommitted changes
git reflog # A log of ALL project changes made including DELETED commits and branches
git merge # Fast-forward (moves the HEAD without creating new commits)
git rebase # Change the base (i.e. the parent commit) of commits in another branch
git cherry-pick # Add a specific commit to a specific branch (HEAD) > Copies commit with new ID
    # This commit becomes the HEAD to another branch