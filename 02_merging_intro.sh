git checkout -b feature03
# Code changes
git add . 
git commit -m "Adds html and wsdl file to project"
# Switch back to the master branch, and these last changes are gone
git checkout master
###################################################################################################
# HEAD -> master,

git merge feature03 # Merges feature03 into the current branch (master)