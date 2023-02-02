# Arch install - the easy way

There is a myth that Arch Linux installation is extremly hard. Well, it is not necesairly the case any more - at least it does not need to be, since Arch Linux istallation iso comes with `archinstall` script.

## Why Arch Linux

There is a few reasons why I like Arch Linux. First of all I like that it does not comes with bloatware pre-installed and I can (have to?) configure it the way I want - including the window manager, display manager, and many other thigs.
Second reason is AUR (Arch User Repository) where you cna actually find any piece of Linux software you might need (obviously you don't need to use actuall Arch Linux to use AUR, Manjaro and many Arch-deriverates are compatible with that as well).
Finally I like Arch becuase ... I am an ethusiast. Indeed Arch probably is not the perfect ditro for everybody (in particular - new to Linux).

BTW: Arch is not the only distro I use. I also use Debian (for server installations), Linux Mint / Ubuntu... 

## archinstall

Although I like Arch, not necessairly I'm a fan of spendng hours to install it. Few years ago, I was a happy user of "Architect Linux" installer, which used to make Arch Linux installation pretty easy. Architect Linux is not maintained any more, but it does not mean that Arch must be installed fully manual - as we can use mentioned `archinstall` script. It is still text based script, but it has a menu-like UI, allows to run all basic commands required during installation in an easy way. Usually I use the profile "desktop" with "i3" window manager, as this is my preffered WM and install git right away (so that I can checkout my dotfiles repo).

A great video showing the archinstall script features is on DT channel: https://www.youtube.com/watch?v=leQbSsu-7F4&t=969s 

Before running archinstall wireless network needs to be configured. Easiest way is to use `iwl`:

```
iwctl
[iwd]# station wlan0 connect SSID
```

iwl will prompt for password and configure the IP using DHCP.

### additional packages

In archinstall you can add additional packages to install, I suggest installing:

```
vim git firefox gnupg mc
```

After installing the distro and booting into the system there is a few thigs to do.

1. Checkout my dotfiles repo (in `~/src/` directory, as a bare repo):

```shell
cd; mkdir src; cd src
git clone git@github.com:progoza/LinuxDotFiles.git
alias config='/usr/bin/git --git-dir=$HOME/src/LinuxDotFiles.git/ --work-tree=$HOME'
config checkout main
config pull
```

3. Import my gpg key:

```
gpg --import /path/to/public.gpg
gpg --import /path/to/private.gpg
```

4.Install yay 

```shell
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R pawel:pawel ./yay-git
cd yay-git
makepkg -si
```

5. Install the packages using scripts in  ~/distro-config/ directory

```
cd; cd distro-config/arch
sudo pacman -S $(cat packages-pacman.txt)
sudo yay -S $(cat packages-yay.txt)
```
