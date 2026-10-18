#-----------------------------------------------------------------------------------------------------------#
# (Manuel) Accepts the invitation
git push origin feature/cart # OK
#-----------------------------------------------------------------------------------------------------------#
# (Max) Merging the Owner Branches
git branch -a # The new branch does not yet appear.
git pull
git branch -a # The new branch now appears.
git switch main # The main branch does not have the new code from Manuel, nor the feature/cart-logic from Max

# Merging feature/cart-logic (Max) ---> main
git merge feature/cart-logic # OK

git branch -a
# feature/cart-logic
# * main
# remotes/origin/feature/cart (not a local branch)
# remotes/origin/main
git checkout origin/feature/cart # To work with this remote branch (Solution 1)
git checkout feature/cart # This creates a local tracking branch for origin/feature/cart (Solution 2)
git branch
# * feature/cart (Manuel)
# feature/cart-logic
# main

# However, Max does not want to work with Manuel's branch. Thus, the following works:
git switch main
git merge feature/cart # Try and merge feature/cart ---> main
# !!! MERGE CONFLICT !!! #
# Fix conflicts and then commit the result.
# Options:
#   Accept Current Change (Max's original code)
#   Accept Incoming Change (Manuel's incoming code)
#   Accept Both Changes ---> (Can you always do this?)
#   Compare Changes

# Max chose a "hybrid" solution, taking Manuel's changes and his changes, manually coding this.