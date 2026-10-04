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
# Since we don't want to interefere with other collaborators' work, let us
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