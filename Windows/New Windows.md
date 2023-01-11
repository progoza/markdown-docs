This is my personal note how to initialize new Windows installation.

1. Install chocolatey
2. Install gnupg z chocolatey

```
choco install gnupg
```

3. Impot private and public key e.g. from pendrive.

```
gpg --import /path/to/public.gpg
gpg --import /path/to/private.gpg
```

4. Copy SSH keys and decrypt private key

```
mkdir .ssh
cd .ssh
cp /path/to/id_rsa* .
gpg --output id_rsa --decrypt .\id_rsa.gpg
cd ..
```

5. From this directory storage `\\storage\Archiwum\backup_pawel\New Windows Install\` and 
	1. install Nerd Fonts (from contect menu: "Install for All Users")
	2. Wllpaper from DistroTube (0057.jpg)

6. Install Chris Titus Tech script:

```powershell
irm christitus.com/win | iex
```

- revert classic contect menu

8. Install wsl2

9. Install Power Toys

10. Clone repos from github

```
mkdir src
cd src
mkdir github
cd github
git checkout git@github.com:progoza/WinDotFiles.git
cd WinDotFiles.git
```

11. Run `initalize.cmd` 

12. Download:
	1. `totcmd`
	2. chrome

13. Pin apps:
	1. Terminal
	2. totcmd
	3. file explorer
	4. firefox
	5. chrome
	6. ....

14. Remove bloatware
15. Install https://github.com/hwtnb/SylphyHornPlusWin11

