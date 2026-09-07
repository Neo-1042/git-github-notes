# Start:  2025-03-28
# Review: 2026-09-06

# Git means tracking changes, NOT storing files again and again!

# Working Directory WD = Local directory tracked by git (.git hidden folder)

# Repository = Where all the version management happens

# The git repository is divided into two areas:
# [1] Staging Area (Basically an index File) => Draft area before becoming an actual commit
# [2] Commits (Contains the different snapshots)

# Note: The commits set is a subset of the staging area set. i.e., every file in the commit area is also
# in the staging area, but not necessarily the other way around.

Workflow:
WD --> SD --> Commits

# Understanding commits as snapshots
# Using git to track only changes. git doesn't remember files over and over again

# Working directory (tree): a folder that is tracked/managed by git
# (Creates the .git directory)

# Branches
# master = main branch

# The repository contains 2 different areas: 
# 1] Staging Area (index file)
# 2] Commits (Objects Folder)
---------------------------------------------------------------------------------------------------
# BASIC COMMANDS SUMMARY
git --version
git init
git status # Check WD and SA status
git log # Display all commits of the current branch
git branch # Display all branches
git ls-files # List all files in SA

git add filename.txt
git add . # Add all to SA
git add -A # Same as 'git add .'
git commit -m "Create new commit"
# Correcting a commit message (before pushing it to remote repo)
git commit --amend -m "Correct commit message"
git checkout commit_hash123 # Checkout commit DETACHED HEAD!!!
git branch new-branch
git switch new-branch
git checkout other-branch
git checkout -b new-branch
git switch -c new-branch
git merge other-branch


#### git Introduction #####
# Basic Commands

git init
git add <file>
git status
git commit
git push
git pull
git clone

# WORKING DIRECTORY
git add
# STAGING AREA
git commit
# REPOSITORY

# git bash available (for Windows, for example)

cd /Users/Rafael/Desktop/Project
git init # .git is created

git status
# Add files to staging area
git add index.html 
git add myApp.js 
git status

git commit # Who are you???
git config --global user.email "rafael.dhr@ciencias.unam.mx"
git config --global user.name "Batman"

git commit -m "Added 3 files etc." # A hash is created
git log # Returns the hash (identifier)

# Sistema de control de versiones
# Recuperar versiones especificas
# Comparar cambios a lo largo del tiempo
################## Git and GitHub. Academind ##################
# git is a local tool. That's why we need GitHub
# Cloud hosting and collaboration provider
# Let's start with the Z shell (zsh)
# More possibilities: start servers, 
#                     install tools,
#                     run code,
#                     execute files,
#                     work with git.
# Windows offers 3 options: command prompt (cmd), PowerShell (from W7), Git Bash (emulation)
~   # Home directory
# Absolute vs Relative Paths
/   # Root directory
cd .. # go back one layer in directories
#################### Creating and deleting files
mkdir 
rmdir folder1 # only empty folders
touch # "touch" existing files and change its state (or create a new one)
touch style.css script.js
rm style.css script.js # gone forever

##################### Flags
cd practice
touch index.html style1.css
ls -s # size
ls -l # long format
ls -ls # long format + size
man ls # manual
man rm
rm -r folder2 # or -R. Removes the folder even if it is non-empty

####################### Copying and Moving Files
mkdir copied
mkdir moved
touch file1.html file2.js
cd ..
# cp source target
cp data/index.html copied/
cd copied
cp -r data/ copied/ # -r = recursive. Copies all the contents from data/ into copied/
mv data/index.html moved/
###################################################################################
