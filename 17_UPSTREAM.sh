##### UPSTREAM #####
git push -u origin master
git push --set-upstream origin master # The same

git checkout -b feature-upstream
touch upstream.txt
git add .
git commit -m "Add upstream txt file"
# git push origin feature-upstream -> ERROR, there is no real connection yet
git push -u origin feature-upstream # Correct. 
# Branch 'feature-upstream' set up to track remote branch 'feature-upstream' from 'origin'. NICE

# git push --set-upstream origin sso saves the work of having to create a local tracking branch with
# git branch --track origin/sso remotes/origin/sso