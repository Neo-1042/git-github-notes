# ACCESSING THE CODE VIA FORKS

# Manuel access the repository, but not as a collaborator.
# FORK -> PULL REQUEST

# 1] github.com/reactjs-food-order > Fork
# Fork > Where should we fork 'reactjs-food-order'?
# Once forked, you can clone this project to the local repository. In this way, you push into the forked repository, instead of the original repository.
cd ~/git-projects
git clone https://github.com/forked-repository.git
git branch
# * main

# From here, we have 2 options:
# 1. Make changes to 'main'
# 2. Branch from 'main' and then make changes.

# Since we are working with a forked repository, we can work in 'main' and then make the pull request from here.

# MAKING CHANGES TO THE FORKED AND CLONED REPOSITORY
# (...) making changes in src/components/Cart/Cart.js
# React code reminder:
const cartItemRemoveHandler = (id) => {
    cartCtx.removeItem(id);
};

const cartItemAddHandler = (item) => {
    cartCtx.addItem(...item, amount: 1);
};

#========================================================================================================#
# TESTING THE CHANGES
npm start # OK

# COMMIT CHANGES TO THE FORKED REMOTE REPOSITORY:
git add -A
git commit -m "Cart: Add and remove functionality"
git push -u origin main
# Create a personal access token:
# GitHub > Profile > Settings > Developer Settings > Personal Access Tokens
#========================================================================================================#