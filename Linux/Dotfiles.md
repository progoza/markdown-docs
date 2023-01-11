# Dotfiles in bare git repo

To save the dotfiles I use bare git repository, as explained by distrotube on this [video](https://www.youtube.com/watch?v=tBoLDpTWVOM)

First I initialized the bare git repo

```
git init --bare $HOME/dotfiles
```

Or just cone existing repo with "git clone –bare" switch

In my [.bashrc](https://github.com/progoza/LinuxDotFiles/blob/main/.bashrc) I added the required alias:

```
alias config='/usr/bin/git --git-dir=$HOME/workdir/LinuxDotFiles.git/ --work-tree=$HOME'
```

Assuming the bare repository is checked out in directory `~/workdir`

To avoid tracking unnecessary files from the home folder, the git bare repo can be configured:

```
config config --local status.showUntrackedFiles no
```

Now I can add any file from my home directory with this:

```
config add .dotfile
```

Then commit

```
config commit -S -m "comment"
```

And push

```
config push
```
