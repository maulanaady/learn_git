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

# Avoid merge commits for pulling
# You pull the latest changes from a remote repository, and if these changes are divergent, 
# then by default Git creates merge commits. We can avoid this via following settings.
git config --global branch.autosetuprebase always

# Setting default merge tool
# Git does not provide a default merge tool for integrating conflicting changes into your working tree. 
# We can set default merge tool by enabling following settings
git config --global merge.tool vimdiff

# To see all config, execute below:
git config --list

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
git log
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

# Let say someone make changes to remote repository while we make changes in local.
# When we want to push our local changes to remote, it will failed because remote repository not synced with our local repo,
# Now, we have to first update the local repository and only thereafter, he can push our own changes
git pull

# Now, our local repository is fully synchronized with the remote repository. So we can safely push his changes
git push -u origin main

# Git stash
# Suppose you are implementing a new feature for your product. Your code is in progress and suddenly a customer escalation comes. 
# Because of this, you have to keep aside your new feature work for a few hours. You cannot commit your partial code and also 
# cannot throw away your changes. So you need some temporary space, where you can store your partial changes and later on commit it.
# In Git, the stash operation takes your modified tracked files, stages changes, and saves them on a stack of unfinished 
# changes that you can reapply at any time
# Now, you want to switch branches for customer escalation, but you don’t want to commit what you’ve been working on yet; 
# so you’ll stash the changes. To push a new stash onto your stack, run the git stash command
git stash

# Now, your working directory is clean and all the changes are saved on a stack. Let us verify it with the git status command
git status -s

# Now you can safely switch the branch and work elsewhere. We can view a list of stashed changes by using the git stash list command
git stash list

# Suppose you have resolved the customer escalation and you are back on your new feature looking for your half-done code, 
# just execute the git stash pop command, to remove the changes from the stack and place them in the current working directory.
git stash pop

# Git - Move Operation
# As the name suggests, the move operation moves a directory or a file from one location to another.
# create file moving test and move to folder moved

# To make these changes permanent, we have to push the modified directory structure to the remote repository so that 
# other developers can see this
git add step_by_step.sh
git add moved/
git commit -m "Modified directory structure"
git push -u origin main

# Git - Rename Operation
git mv file_from file_to

# We used -a flag, that makes git commit automatically detect the modified files
git commit -a -m 'Renamed moving_test to moved_test '