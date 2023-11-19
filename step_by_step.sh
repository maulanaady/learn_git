# Create a Bare Repository
# Let us initialize a new repository by using init command followed by --bare option. 
# It initializes the repository without a working directory. By convention, the bare repository must be named as .git.
# mkdir project.git
# cd project.git/
# git --bare init


# create repositoy online (ex: at github.com)
# token: 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
# on local machine, do following:
echo "# learn_git" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/maulanaady/learn_git.git
git push -u origin main

# check local repository
git status -s
# then do
git add step_by_step.sh
git commit -m 'Add step by step instruction file'

# after reviewing commit details, then realize that there is something wrong, do correction on local file, then:
git log         # (and copy commit id)
git show 0e4e7aa4772a69f7253ebe4be76922a62cbaa17c   # (0e4e7aa4772a69f7253ebe4be76922a62cbaa17c is id copied from above command)

# running the git diff command to see differences
git diff 
# (- sign indicate deleted rows, + sign indicate added rows)

# while before, we already committed the changes and he wants to correct his last commit. In this case, git amend operation will help
# The amend operation changes the last commit including your commit message; it creates a new commit ID
# Before amend operation, checks the commit log.
# commits the new changes with -- amend operation and views the commit log:
git status -s
git add step_by_step.sh
git status -s
git commit --amend -m 'Changed: adding more instruction lines'

# We modified his last commit by using the amend operation and he is ready to push the changes. 
# The Push operation stores data permanently to the Git repository. After a successful push operation, 
# other developers can see Jerry’s changes
# Before push operation, we wants to review his changes, so he uses the git show command to review his changes
git show (commit id)

#push to remote server
git push -u origin main

# Let say someone make changes to remote repository while we make change in local.
# When we want to push our local changes to remote, it will failed because remote repository not synced with our local repo,
# Now, we have to first update the local repository and only thereafter, he can push our own changes
git pull