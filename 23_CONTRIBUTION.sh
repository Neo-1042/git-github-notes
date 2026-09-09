# COLLABORATION vs CONTRIBUTION

# Contribute to a Project -> A developer improves the project without necessarily being assigned as a collaborator.

# Collaborator workflow -> CLONE
git clone ssh@nuclear.git
echo "Work Work Work" >> file.cpp
git add -A
git commit -m "Add code"
git push

# Contributor workflow -> FORK & PULL REQUESTS
# GitHub
# Account A is the repository owner.
# Account B wants to work as a contributor
# Then, account B forks the remote repository to his own account, thereby creating a remote copy of the original repository.
# i.e. Forking is when a remote repository is copied into another remote repository.
# !!! FORKING is a GITHUB feature, not a git feature!!!
# Forking a repository allows you to git clone into your local machine, but this clones the copy, not the original repository.

# PULL REQUESTS

# Ask the account A holder for permission to integrate your changed forked repository into the original remote repo.
# i.e. Create PR = Pull Request.
# The project owner can either: Reject || Accept (merge).