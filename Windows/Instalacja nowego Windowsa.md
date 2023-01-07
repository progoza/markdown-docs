1. Zainstalować chocolatey
2. Zainstalować gnupg z chocolatey

```
choco install gnupg
```

3. Zainstalować klucz prywatny i publiczny gpg np. z pendrive'a.

```
gpg --import /path/to/public.gpg
gpg --import /path/to/private.gpg
```

4. Skopiować klucze SSH i odszyfrować klucz prywatny

```
mkdir .ssh
cd .ssh
cp /path/to/id_rsa* .
gpg --output id_rsa --decrypt .\id_rsa.gpg
cd ..
```

5. Ze storege'a pobrać katalog `\\storage\Archiwum\backup_pawel\New Windows Install\` i 
	1. zainstalować Nerd Fonty (z menu kontekstowego "Install for All Users")
	2. Tapeta od DistroTube (0057.jpg)

6. Zainstalować Chris Titus Tech script:
```powershell
irm christitus.com/win | iex
```
- przywrócić klasyczne menu kontekstowe

8. Zainstalować wsl2

9. Zainstalować Power Toys

10. Sklonować repozytorium z github-a

```
git checkout git@github.com:progoza/WinDotFiles.git
```

11. Uruchomić `initalize.cmd` 

12. Ściągnąć i zainstalować:
	1. `totcmd`
	2. chrome

13. Poprzypinać aplikacje
	1. Terminal
	2. totcmd
	3. file explorer
	4. firefox
	5. chrome
	6. ....

14. Usunąć bloatware
15. Zainstalować https://github.com/hwtnb/SylphyHornPlusWin11

