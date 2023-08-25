
Git Cheat Sheet
===============

### Index

* [Links](#links)
* [Set Up](#setup)
* [Configuration Files](#configuration-files)
* [Create](#create)
* [Local Changes](#local-changes)
* [Search](#search)
* [Commit History](#commit-history)
* [Branches & Tags](#branches--tags)
* [Update & Publish](#update--publish)
* [Merge & Rebase](#merge--rebase)
* [Undo](#undo)
* [Git Flow](#git-flow)


## Links

* [github style guide](https://github.com/agis/git-style-guide)
* [Git Merge vs. Rebase: What’s the Diff?](https://hackernoon.com/git-merge-vs-rebase-whats-the-diff-76413c117333)
* [tiimgreen/github-cheat-sheet](https://github.com/tiimgreen/github-cheat-sheet)
* [drew barontini github conventions](http://drewbarontini.com/articles/git-github-conventions/)

## Setup

##### Show current configuration:
```
$ git config --list
```
##### Show repository configuration:
```
$ git config --local --list
```

##### Show global configuration:
```
$ git config --global --list
```

##### Show system configuration:
```
$ git config --system --list
```

##### Set a name that is identifiable for credit when review version history:
```
$ git config --global user.name “[firstname lastname]”
```

##### Set an email address that will be associated with each history marker:
```
$ git config --global user.email “[valid-email]”
```

##### Set automatic command line coloring for Git for easy reviewing:
```
$ git config --global color.ui auto
```

##### Set global editor for commit
```
$ git config --global core.editor vi
```

<hr>

## Configuration Files

##### Repository specific configuration file [--local]:
```
<repo>/.git/config
```

##### User-specific configuration file [--global]:
```
~/.gitconfig
```

##### System-wide configuration file [--system]:
```
/etc/gitconfig
```

<hr>

## Create

##### Clone an existing repository:

There are two ways:

Via SSH

```
$ git clone ssh://user@domain.com/repo.git
```

Via HTTP

```
$ git clone http://domain.com/user/repo.git
```

##### Create a new local repository:
```
$ git init
```

<hr>

## Local Changes

##### Changes in working directory:
```
$ git status
```

##### Changes to tracked files:
```
$ git diff
```

##### Add all current changes to the next commit:
```
$ git add .
```

##### Add some changes in &lt;file&gt; to the next commit:
```
$ git add -p <file>
```

##### Commit all local changes in tracked files:
```
$ git commit -a
```

##### Commit previously staged changes:
```
$ git commit
```

##### Commit with message:
```
$ git commit -m 'message here'
```

##### Commit skipping the staging area and adding message:
```
$ git commit -am 'message here'
```

##### Commit to some previous date:
```
$ git commit --date="`date --date='n day ago'`" -am "<Commit Message Here>"
```

##### Change last commit:<br>
<em><sub>Don't amend published commits!</sub></em>

```
$ git commit -a --amend
```

##### Amend with last commit but use the previous commit log message
<em><sub>Don't amend published commits!</sub></em>

```shell
$ git commit --amend --no-edit
```

##### Change committer date of last commit:
```
GIT_COMMITTER_DATE="date" git commit --amend
```

##### Change Author date of last commit:
```shell
$ git commit --amend --date="date"
```

##### Move uncommitted changes from current branch to some other branch:<br>
```
$ git stash
$ git checkout branch2
$ git stash pop
```

##### Restore stashed changes back to current branch:
```shell
$ git stash apply
```

#### Restore particular stash back to current branch:
- *{stash_number}* can be obtained from `git stash list`

```shell
$ git stash apply stash@{stash_number}
```

##### Remove the last set of stashed changes:
```
$ git stash drop
```

<hr>

## Search

##### A text search on all files in the directory:
```
$ git grep "Hello"
```

##### In any version of a text search:
```
$ git grep "Hello" v2.5
```

<hr>

## Commit History

##### Show all commits, starting with newest (it'll show the hash, author information, date of commit and title of the commit):
```
$ git log
```

##### Show all the commits(it'll show just the commit hash and the commit message):
```
$ git log --oneline
```

##### Show all commits of a specific user:
```
$ git log --author="username"
```

##### Show changes over time for a specific file:
```
$ git log -p <file>
```

##### Display commits that are present only in remote/branch in right side
```
$ git log --oneline <origin/master>..<remote/master> --left-right
```

##### Who changed, what and when in &lt;file&gt;:
```
$ git blame <file>
```

##### Show Reference log:
```
$ git reflog show
```

##### Delete Reference log:
```
$ git reflog delete
```
<hr>

## Branches & Tags

##### List all local branches:
```
$ git branch
```

#### List local/remote branches
```
$ git branch -a
```

##### List all remote branches:
```
$ git branch -r
```

##### Switch HEAD branch:
```
$ git checkout <branch>
```

##### Checkout single file from different branch
```
$ git checkout <branch> -- <filename>
```

##### Create and switch into new branch:
```
$ git checkout -b <branch>
```

##### Create and switch new branch and push upstream:
```
git checkout -b <branch>
git push --set-upstream origin <branch>
```

#### Checkout and create a new branch from existing commit
```
$ git checkout <commit-hash> -b <new_branch_name>
```

##### Create a new branch based on your current HEAD:
```
$ git branch <new-branch>
```

##### Create a new tracking branch based on a remote branch:
```
$ git branch --track <new-branch> <remote-branch>
```

##### Delete a local branch:
```
$ git branch -d <branch>
```

##### Rename current branch to new branch name
```shell
$ git branch -m <new_branch_name>
```

##### Force delete a local branch:
<em><sub>You will lose unmerged changes!</sub></em>

```
$ git branch -D <branch>
```

##### Mark the current commit with a tag:
```
$ git tag <tag-name>
```

##### Mark the current commit with a tag that includes a message:
```
$ git tag -a <tag-name>
```
<hr>

## Update & Publish

##### List all current configured remotes:
```
$ git remote -v
```

##### Show information about a remote:
```
$ git remote show <remote>
```

##### Add new remote repository, named &lt;remote&gt;:
```
$ git remote add <remote> <url>
```

##### Download all changes from &lt;remote&gt;, but don't integrate into HEAD:
```
$ git fetch <remote>
```

##### Download changes and directly merge/integrate into HEAD:
```
$ git remote pull <remote> <url>
```

##### Get all changes from HEAD to local repository:
```
$ git pull origin master
```

##### Get all changes from HEAD to local repository without a merge:
```
$ git pull --rebase <remote> <branch>
```

##### Publish local changes on a remote:
```
$ git push remote <remote> <branch>
```

##### Delete a branch on the remote:
```
$ git push <remote> :<branch> (since Git v1.5.0)
```
OR
```
$ git push <remote> --delete <branch> (since Git v1.7.0)
```

##### Publish your tags:
```
$ git push --tags
```
<hr>

#### Configure the merge tool globally to meld (editor)
```bash
$ git config --global merge.tool meld
```

##### Use your configured merge tool to solve conflicts:
```
$ git mergetool
```

## Merge & Rebase

##### Merge branch into your current HEAD:
```
$ git merge <branch>
```

##### Rebase your current HEAD onto &lt;branch&gt;:<br>
<em><sub>Don't rebase published commit!</sub></em>

```
$ git rebase <branch>
```

##### Abort a rebase:
```
$ git rebase --abort
```

##### Continue a rebase after resolving conflicts:
```
$ git rebase --continue
```

##### Use your editor to manually solve conflicts and (after resolving) mark file as resolved:
```
$ git add <resolved-file>
```

```
$ git rm <resolved-file>
```

##### Squashing commits:
```
$ git rebase -i <commit-just-before-first>
```

Now replace this,

```
pick <commit_id>
pick <commit_id2>
pick <commit_id3>
```

to this,

```
pick <commit_id>
squash <commit_id2>
squash <commit_id3>
```
<hr>

#### Rebase Branch with Master Example:

If you use the more-explicit git fetch origin (then optionally look around) and then git merge origin/master sequence, you can also bring your own local master up to date with the remote, with only one fetch run across the network:
```
git fetch origin --prune
git checkout master
git merge --ff-only origin/master
git checkout <existing_branch_to_rebase>
git merge --no-ff origin/master
```

## Undo

##### Discard all local changes in your working directory:
```
$ git reset --hard HEAD
```

##### Get all the files out of the staging area(i.e. undo the last `git add`):
```
$ git reset HEAD
```

##### Discard local changes in a specific file:
```
$ git checkout HEAD <file>
```

##### Revert a commit (by producing a new commit with contrary changes):
```
$ git revert <commit>
```

##### Reset your HEAD pointer to a previous commit and discard all changes since then:
```
$ git reset --hard <commit>
```

##### Reset your HEAD pointer to a remote branch current state.
```
$ git reset --hard <remote/branch> e.g., upstream/master, origin/my-feature
```

##### Reset your HEAD pointer to a previous commit and preserve all changes as unstaged changes:
```
$ git reset <commit>
```

##### Reset your HEAD pointer to a previous commit and preserve uncommitted local changes:
```
$ git reset --keep <commit>
```

##### Remove files that were accidentally committed before they were added to .gitignore
```
$ git rm -r --cached .
$ git add .
$ git commit -m "remove xyz file"
```
<hr>

## What are the differences between git remote prune, git prune, git fetch --prune, etc

There are potentially three versions of every remote branch:

1. The actual branch on the remote repository

2. Your snapshot of that branch locally (stored under refs/remotes/...)

3. And a local branch that might be tracking the remote branch

Let's start with `git prune`. This removes objects that are no longer being referenced, it does not remove references. In your case, you have a local branch. That means there's a ref `named random_branch_I_want_deleted` that refers to some objects that represent the history of that branch. So, by definition, `git prune` will not remove `random_branch_I_want_deleted`. Really, git prune is a way to delete data that has accumulated in Git but is not being referenced by anything. In general, it doesn't affect your view of any branches.

`git remote prune origin` and `git fetch --prune` both operate on references under `refs/remotes/...` (I'll refer to these as remote references). It doesn't affect local branches. The `git remote` version is useful if you only want to remove remote references under a particular remote. Otherwise, the two do exactly the same thing. So, in short, `git remote prune` and `git fetch --prune` operate on number 2 above. For example, if you deleted a branch using the git web GUI and don't want it to show up in your local branch list anymore (`git branch -r`), then this is the command you should use.

To remove a local branch, you should use `git branch -d` (or `-D` if it's not merged anywhere). FWIW, there is no git command to automatically remove the local tracking branches if a remote branch disappears.

Another perspective:

`git remote prune` and `git fetch --prune` do the same thing: deleting the refs to the branches that don't exist on the remote, as you said. The second command connects to the remote and fetches its current branches before pruning.

However it doesn't touch the local branches you have checked out, that you can simply delete with

`git branch -d  random_branch_I_want_deleted`
Replace `-d` by `-D` if the branch is not merged elsewhere

`git prune` does something different, it purges unreachable objects, those commits that aren't reachable in any branch or tag, and thus not needed anymore.

### Clean up list of remote branches:

```
git fetch origin --prune;git merge --ff-only origin/master;git branch -a
```

<hr>

## Create diff file from one repo to apply to another repo

### Links:

* [create-patch-or-diff-file-from-git-repository-and-apply-it-to-another-different](https://stackoverflow.com/questions/28192623/create-patch-or-diff-file-from-git-repository-and-apply-it-to-another-different)

In repo that you want to collect changes to be applied to another repo perform the following:

`git diff bea2119..HEAD > /path/to/patchfile/to-be-created/fubar.patch`

Several things to note with regards to the above command:

1. Assuming you are wanting to grab diff of repo from most current state (i.e. HEAD) back to and including concurrent commits from a particular commit number (i.e. bea2119).  You could also specify any range of commits that you are looking to get a diff of, it doesn't have to always be all the way back to HEAD.

2. The first commit referenced is the commit immediately prior to the commit that you are actually wanting to include within the diff.  Essentially the first referenced commit (i.e. bea2119) represents the initial snapshot of the repo that you are diffing and the second commit number (i.e. HEAD) represents the "end-state" snapshot of the repository and the `git diff` is collecting all commits that happened between those two repo snapshot.

Switch repo focus to the repo and branch that you are trying to apply/migrate commits into and execute the following:

`git apply /path/to/patchfile/to-be-applied/fubar.patch`

You will probably get some warnings as below about whitespace errors (see below), but it should apply the diff to the repo

```
/path/to/patchfile/to-be-applied/fubar.patch:179: trailing whitespace.
   DependsOn:
/path/to/patchfile/to-be-applied/fubar.patch:211: trailing whitespace.
   DependsOn: rAwsS3AdminRole
/path/to/patchfile/to-be-applied/fubar.patch:321: trailing whitespace.
         - ec2:SomeRandomThing1
/path/to/patchfile/to-be-applied/fubar.patch:460: trailing whitespace.
         - ec2:SomeRandomThing2
/path/to/patchfile/to-be-applied/fubar.patch:549: trailing whitespace.
             - ec2:SomeRandomThing3
warning: squelched 2 whitespace errors
warning: 7 lines add whitespace errors.
```

## Git-Flow

Improved [Git-flow](https://github.com/petervanderdoes/gitflow-avh)

### Git flow schema

<p align="center">
    <img alt="Git" src="img/git-flow-commands-without-flow.png">
</p>
