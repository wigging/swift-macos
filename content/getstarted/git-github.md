---
title: Git and GitHub
date: November 9, 2022
---

Git and GitHub are essential tools for any Mac developer. Git is a great version control system that is the foundation of the online GitHub platform for sharing code. The sections below provide configuration settings and examples for working with these tools. Note, the remote is assumed to be `origin` in the examples below.

## Git configuration

```bash
# Show current configuration settings
git config --list

# Set system wide user name and email for git
git config --global user.name "John Doe"
git config --global user.email "johndoe@example.com"

# View configuration information
git config --list

# Set a different user name and email for the current repository
git config user.name "Jane Bane"
git config user.email "janedoe@example.com"
```

The gitignore file tells Git to not place certain types of files under version control. The file can be applied globally or just for a particular project. See the [gitignore.io](https://www.gitignore.io) online tool to easily create an ignore file.

```bash
# Set the global ignore file
git config --global core.excludesfile "~/.gitignore"
```

## GitHub private email

To keep your email private in your commits, GitHub offers a noreply email address. On your GitHub profile, go to Settings then Emails to enable the private email address feature.

## Branch

```bash
# Create and checkout a new branch
git checkout -b [branch-name]

# List all local branches
git branch

# List all local and remote-tracking branches
git branch -a

# List all remote branches
git branch -r

# List all local branches along with commit message
git branch -v

# Remove a local branch
# Use -D instead of -d to force delete the branch
git branch -d [branch-name]

# Rename a local branch
git branch -m [new-branch-name]

# Merge local branch to master then delete it
git checkout master
git merge [branch-name]
git branch -d [branch-name]

# Update a branch against the master branch
git checkout [branch-name]
git rebase master

# Push a new branch to the remote
git push origin [branch-name]

# Remove a remote branch
# In new versions of Git --delete can be replaced with -d
git push --delete origin [branch-name]
```

## Tag

```bash
# Tag the current commit as version 19.6
git tag v19.6

# Push this tag to the GitHub repository
git push origin v19.6
```

## Merge and squash

```bash
# Merge a branch into master then squash that branch's commits into one commit message
git checkout master
git merge --squash [branch-name]
git commit -m 'new feature from branch'
```

## Remote repository

```bash
# Show remote repositories associated with project
git remote -v

# Remove a remote repository from a local git project
git remote remove origin

# Remove local branches that no longer exist on remote
git remote prune origin

# Change a remote's URL
git remote set-url origin https://github.com/USERNAME/REPOSITORY.git
```

## Reset a repository

When developing a website hosted on GitHub Pages, it can be convenient to upload a beta version of the site for testing. Once the site is ready for public viewing, the local and remote Git repositories can be reset to clean up the commit history. The first step is to delete the git folder in the local directory then initialize a new Git repository in the same directory.

```bash
$ git init
$ git add .
$ git commit -m 'initial commit'
```

After the local repo has been initialized, push it to the existing remote GitHub server. The force option must be included in the push command otherwise the existing remote repository on GitHub will not be reset. Notice that the example below pushes to the master branch on GitHub but other branches can be specified.

```bash
git remote add origin https://github.com/tinkker/ztest.git
git push -f -u origin master
```

## Sync a forked repository

The commands below will sync a forked local repository with the original upstream repository. These notes are based on the Stack Overflow question [here](https://stackoverflow.com/questions/7244321/how-do-i-update-a-github-forked-repository).

```bash
# In the local repository, add the remote for the original "upstream" repo:
git remote add upstream https://github.com/whoever/whatever.git

# Fetch all the branches of that remote:
git fetch upstream

# Make sure you're on the master branch in the local repo:
git checkout master

# Rewrite your master branch so that any commits of yours that aren't already
# in upstream/master are replayed on top of that other branch:
git rebase upstream/master

# Finally push up the changes to your own forked repo on GitHub:
git push
```

## Undo last commit

Undo the last commit as if you didn't stage and commit the files. Don't do this if you already pushed to the remote.

```bash
git reset HEAD~
```

## Rename master branch to main

First, rename the local "master" branch for the repository:

```bash
git branch -m master main
```

Check that the branch was renamed and make sure you are on the "main" branch:

```bash
git branch
git checkout main
```

Next, push the "main" branch to the remote GitHub repository:

```bash
git push -u origin main
```

Next, for the GitHub repository, go to Settings -> Branches and change the default branch from "master" to "main". Finally, delete the remote "master" branch for the GitHub repository:

```bash
git push origin --delete master
```
