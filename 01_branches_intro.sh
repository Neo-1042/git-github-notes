# Master = main branch
# Going back to a previous commit

git log # Take the second-to-last commit
# <second-to-last-hash> = asdfasdf29178428374128347128347 (feature03, feature02, master)
git checkout asdfasdf29178428374128347128347
git log # The last commit does not appear here
git checkout master 
git log # This time, the last commit DOES appear
###################################################################################################
# Branch = a set of specific code changes (commits)
git branch

# Create a new branch called 'feature01'
git branch feature01
# Switch to the new branch
git checkout feature01
git log # Shows the same commits as 'master', with the same IDs (hash codes)
# Create a new branch called 'feature02' while stillbeing on 'feature01' and switch to it
git checkout -b feature02
