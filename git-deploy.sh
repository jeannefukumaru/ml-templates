# script to automate git commits 
# download and run chmod u+x git-deploy.sh to make executable 
# run `bash git-deploy.sh` to stage commit then add a commit message when prompted 
# repurposed from https://www.taniarascia.com/how-to-create-and-use-bash-scripts/

#!/bin/bash

read -r -p 'Commit message: ' desc  # prompt user for commit message
git add .                           # track all files
git add -u                          # track deletes
git commit -m "$desc"               # commit with message
git push origin master              # push to origin
