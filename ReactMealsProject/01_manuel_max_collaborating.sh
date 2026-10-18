# (Manuel): Clones the repository and starts working on the Cart feature
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
# Max (owner) revises permissions for Manuel
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
# ... GO TO merge conflicts