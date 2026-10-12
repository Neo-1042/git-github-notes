###################################################################################################
# React + git + GitHub Interface-Only Project
# REACTMEALS
# Choose meals and add them to your cart. Manage your cart
# NodeJS --> React
# These notes focus on git + GitHub
###################################################################################################
# App start
# React code reminder:
const CartIcon = () => {

    return (
        <svg
            xmlns='http://www.w3.org/2000/svg'
            viewBox='0 0 20 20'
            fill='currentColor'
        >
#            <path d='M3 1a1 ..."></path>
        </svg>
    );
};
export default CartIcon;
###################################################################################################
# (Max)
# npm = Node Package Manager
cd project-root
 # Get and install all the necessary dependencies for the project
npm install
# Run your app and start the development server
npm start # localhost:3000

# Start your local git repository:
git init
# Track your changes, but first, exclude the "node_modules" folder:
# Create your gitignore:
echo "node_modules" >> .gitignore
echo ".DS_Store" >> .gitignore

git add -A
git commit -m "Add gitignore to first version of frontend code"
git push

# Rename 'master' to 'main'
git branch -m master main

# node_modules/
# public/
# src/
#   assets/
#   components/
#   store/
# (Modifying) App.js

# const [cartIsShown, setCartIsShown] = useState(false); // Cart overlay will initiall not be visible.

# function showCartHandler() { setCartIsShown(true); }
# function hideCartHandler() { setCartIsShown(false); }

# Lorenz works on this feature: Controlling the cart visibility
# Since we don't want to interefere with other collaborators' work, let us:

# Create and switch into a new (temporary) branch:
git branch feature/cart-logic
#      +
git switch feature/cart-logic
#      =
# git checkout -b feature/cart-logic 

# Manuel will work on the Cart feature itself

# Reminder:
# 1] git init (local)
# 2] GitHub.com -> Create remote repository
# 3] Grab the HTTPS or SSH link and then associate it with the local repo:
git remote add origin https://github.com/neo_1042/git-github-notes.git
git branch -M main
git push -u origin main # set upstream
#-----------------------------------------------------------------------------------------------------------#
# (Manuel)
cd ~/GIT/Notes/git-github-notes
git clone https://github.com/neo_1042/git-github-notes.git . # When the folder already exists

npm install
git branch # main ---> OK
npm start # Start the development server
# (Manuel modifies): src/components/Cart/Cart.js, Cart.module.css
#    src/App.js
git branch feature/cart
git switch feature/cart
# (Manuel) Add changes to new feature branch
git add -A
git commit -m "Add Cart modal"
git push origin feature/cart
# NOT ALLOWED
#-----------------------------------------------------------------------------------------------------------#
# (Max) Revises permissions for Manuel
# Max invites Manuel as a Collaborator
#-----------------------------------------------------------------------------------------------------------#
# (Manuel) Accepts the invitation
git push origin feature/cart # OK
#-----------------------------------------------------------------------------------------------------------#
# (Max) Merging the Owner Branches
git branch -a # The new branch does not yet appear.
git pull
git branch -a # The new branch now appears.
git switch main # The main branch does not have the new code from Manuel, nor the feature/cart-logic from Max

# Merging feature/cart-logic ---> main
git merge feature/cart-logic # OK

git branch -a
# feature/cart-logic
# * main
# remotes/origin/feature/cart (not a local branch)
# remotes/origin/main
git checkout origin/feature/cart # To work with this remote branch (Solution 1)
git checkout feature/cart # This creates a local tracking branch for origin/feature/cart (Solution 2)
git branch
# * feature/cart
# feature/cart-logic
# main

# However, Max does not want to work with Manuel's branch. Thus, the following works:
git switch main
git merge feature/cart # Try and merge feature/cart ---> main
# !!! MERGE CONFLICT !!! #
# Fix conflicts and then commit the result.
# Options:
#   Accept Current Change
#   Accept Incoming Change
#   Accept Both Changes
#   Compare Changes