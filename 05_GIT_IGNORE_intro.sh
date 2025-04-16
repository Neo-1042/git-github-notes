# The .gitignore file must be placed in the root of the project
# Once you create this file, you have to add it to the SA and then to the commits
################################################################################
# Ignore all *.log files, except the console.log
*.log
!console.log
# Ignore this folder and all of its contents
web-app/*

git clean -df # git checkout .