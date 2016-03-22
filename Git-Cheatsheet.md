_Show history of git commits:_
- `git log`

_Pushing Remotely:_
- `git push -u origin master`

  The name of our remote is **origin** and the default local branch name is **master**. The `-u` tells Git to remember the parameters, so that next time we can simply run git push and Git will know what to do.

_Pulling Remotely:_
- `git pull origin master`

  Check for changes on our GitHub repository and pull down any new changes.

_Viewing Differences:_
- `git diff HEAD`

  The **HEAD** is a pointer that holds your position within all your different commits. By default **HEAD** _points to your most recent commit_, so it can be used as a quick way to reference that commit without having to look up the SHA.

_Commit Etiquette:_

  You want to try to keep related changes together in separate commits. Using `git diff` gives you a good overview of changes you have made and lets you add files or directories one at a time and commit them separately.

_Viewing Staged Differences:_
- `git diff --staged`

_Resetting Staged Changes:_
- `git reset` _filename_

  Unstaging files from a staged commit can help to ensure that only related changes are associated with a specific commit.  The unstaged file can be staged into its own commit.

_Undo:_
- `git checkout -- <target>`

  Files can be changed back to how they were at the last commit associated with a particular file. Git will roll back the status of files as they were at the time of the last commit for the file specified as the <target> of the checkout.  Using `--` is simply promising the command line that there are no more options after the `--`. This way if you happen to have a branch named <target>, it will still revert the file, instead of switching to the branch of the same name.
