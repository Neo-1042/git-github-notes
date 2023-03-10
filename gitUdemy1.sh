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
# Windows offers 3 options: command prompt (cmd), PowerShell (W7), Git Bash (emulation)
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

