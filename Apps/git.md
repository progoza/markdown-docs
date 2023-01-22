
# GIT

After installation basic configurations hould be done:

```shell
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

To check the config:

```shell
git config --list
```

## SSH key

Best way to use git with remote repos (like github or gitlab) is to use prive/public key pair.

```shell
ssh-keygen -t rsa -b 4096
```

And copy the public key to github/gitlab account (thanks to that - no need to type username/password). 

### GPG key

To sign the commits, private [GPG](gpg.md) key is required. Public key can be uploaded to github. create commit with `-S` switch to sign the commit locally with private key.

## Basic usages

```shell
git clone <ssh-key>
# or create new repo locally
git create

git checkout <branch>
git checkout -b <branch> # create new branch and checkout

git status
git diff

git stage
git restore
git add
git rm

git commit -m "commit msg" [-S]

git merge <branch>
git push
```

## git origin

`origin` is a kind of shorthand/alias for the URL of the remote repo from which a given local repo was cloned. 

## rebase vs merge

I am not a fan of using rebase and usually avoid it. Instead, before pushing a feature branch I always merge master (or develop?) to that feature branch. Only then - push it to origin. However this is how rebase works:

```shell
git checkout feature_br
git rebase master
```

The above - instead of creating a new merge commit on the `feature_br` branch, "shifts" the commits on the feature branch (as if it was branched from the latest master's commit). Thanks to that - we have all changes on the feature-branch without "artificial" merge commit. In theory it gives us "clean" history of versions, but in my opinion this makes we loose the "context" of what was going on the version history.   

	Note: don't ever rebase feature-branch to master (public) branch - it will mess up woth local "master" branch and amy result in big problems when pushing to origin. 

..or mabe better avoid using rebase at all :-)


## Viewing history

```shell
git log
```

Log with diff:

```shell
git log -p
```

Show diff only in previous commit:

```shell
git log -p -1
```


## .gitignore

Specifies which files (or directories) should not be trancked. `.gitignore` file usually is placed in the main directory of the repo, but it can also be placed in sub-directories (e.g. when a subdir needs to have different rules).
There are tons of pre-sets for various programming languages.
Note: if file is already added to repository, it will be trancked despite of listing it in `.gitignore` file.
