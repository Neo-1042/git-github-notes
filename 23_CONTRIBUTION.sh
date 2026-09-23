#===================================================================================================================
# COLLABORATION vs CONTRIBUTION

# Contribute to a Project -> A developer improves the project without necessarily being assigned as a collaborator.

# Collaborator workflow -> CLONE
git clone ssh@nuke-ai.git
echo "Work Work Work" >> file.cpp
git add -A
git commit -m "Add code"
git push
#===================================================================================================================
# Contributor workflow -> FORKING & PULL REQUESTS
# GitHub
# Account A is the repository owner.
# Account B wants to work as a contributor
# Then, account B forks the remote repository to his own account, thereby creating a remote copy of the original repository.
# i.e. Forking is when a remote repository is copied into another remote repository.
# !!! FORKING is a GITHUB feature, not a git feature!!!
# Forking a repository allows you to git clone into your local machine, but this clones the copy, not the original repository.

# PULL REQUESTS

# Ask the account A holder for permission to integrate your changed forked repository into the original remote repo.
# i.e. Create a PR = Pull Request.
# The project owner can either: Reject || Accept (merge).

# GitHub Workflow example:
# Fork "original_repo" to "repo_0" > git clone repo_0 > Make changes to repo_0 > git push repo_0
# Then, you create a pull request to solicitate the owner of "original_repo" to integrate these new changes.
# Fork area (Notification) > Insights

# Go back to the account that pushed the forked code > Pull Requests > New Pull Request
# Comparing changes
# "Choose two branches to see what's changed or to start a new pull request"
# "If you need to, you can also compare across forks"
# Select the "base repository" + "branch".
#   <--- "Head repository" + "branch"

# OPEN A PULL REQUEST
#
# Title = Add shopping cart feature
# Comments = [...]
# Allow edits by maintainers [ ]
# Reviewers, Assignees, Labels, Projects, Milestone, Linked Issues.

# Switch to the owner's account: Pull Requests > Open (New)
# "user Y wants to merge 1 commit into 'mLoAmn:master' from 'manulorenz:master' "
# The reviewer/owner can review changes > reject it with comments, approve it ---> Submit Review.
# The reviewer/owner has 3 options:
#
# 1. Comment (without explict approval)
# 2. Approve
# 3. Request changes (before merging)
#===================================================================================================================
# OPENING & CLOSING ISSUES

# Example:
# github.com/vuejs/vue ---> JavaScript framework.
# Instead of randomly check the pull requests, you would normally check the "ISSUES" page of the repository.
# The "issues" tab is used to report bugs.
    # Assignees
    # Labels
    # Projects
    # Milestone
    # Linked PRs

# GITHUB PROJECTS

# Create a new project > Template (bug triage, kanban, etc.)
# Open issues are available to add to the "To do" column, for example.
# "Manage Automation for To Do/In Progress/Done"
# Once an issue is closed, automatically move it to the "Done" column.
#===================================================================================================================
# MODULE SUMMARY

# 1. GitHub
#   Account Types
#   Repository Types
#   Security
# 2. Collaboration
#   Collaborators
#   Organizations
#   Teams
# 3. Contribution && Project Management
#   Forks and Pull Requests
#   Issues
#   Projects

# Next up: React JS + git + GitHub Project
#===================================================================================================================