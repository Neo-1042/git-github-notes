############# TAGGING COMMITS ############# 
# git tag 1.1.1 <hash_code>
# git show 1.1.1

git init
touch file1.txt
git add .
git commit -m "Added file1.txt" # commit 1

touch file2.txt
git add .
git commit -m "Added file2.txt" # commit 2

touch file3.txt
git add .
git commit -m "Added file3.txt" # commit 3

# Tag important stages in our project history
# Lightweight tags
# Annotated tags (BETTER, full object in git)

git tag # View any existing tags
git log # commit2_id

# LIGHTWEIGHT TAG (temporary)
git tag 1.0 commit2_id
git show 1.0
git checkout 1.0 # go to that commit > detached HEAD mode
git switch master # go back to the HEAD

# DELETE a tag
git tag -d 1.0 

# ANNOTATED TAG (full object)
git tag -a 2.0 commit2_id -m "This is the latest version of the app"
git tag
git show
git tag -d 2.0
###################################################################################################