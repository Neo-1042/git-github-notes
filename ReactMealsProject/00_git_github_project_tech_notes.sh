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