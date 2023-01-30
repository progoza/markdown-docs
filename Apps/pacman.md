# pacman

Package manger used e.g. in arch and its deriverates.

## Install a package

```
sudo pacman -S package
```

## Remove package

```
sudo pacman -R package
```

With dependencies:

```
sudo pacman -Rns package
```

## Search package

Get information about package, or just search a package

```
pacman -Ss package
```

## Update repos

```
sudo pacman -Syy
```

## Mirros

```
sudo vim /etc/pacman.d/mirrorlist
```

# yay

In most cases there is also `yay` installed on the system - yay is tool to install AUR packages. Generally `yay` uses the same switches like pacman. Runing `yay`  with no parameters will upgrade all pacman packages and AUR packages as well.

