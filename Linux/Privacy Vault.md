# How I created a "private vault" on my Linux

Normally I don't use full disk encryption when I install OS on my PC. However, I need to have some data encrypted. In most cases this is rarly changing data, but I want it to be seurely stored. 
For that reason I created a small script: `privacy`. It is added to my LinuxDotFiles repository: [privacy]([LinuxDotFiles/privacy at main · progoza/LinuxDotFiles (github.com)](https://github.com/progoza/LinuxDotFiles/blob/main/.local/bin/privacy)) 
The script has 3 options:

 - open - it opens the vault (or creates a new one) - to be more precise, it does the following:
	 - creates on the ramdisk a directory that is accessible only for the current user.
	 - decrypts and extracts to that directory the contents of file `~/.local/privacy.tar.gpg` (if such file exists).
	 - creates a symbolic link `~/privacy` to the ramdisk directory
 - flush - it packs the contents of the ramdisk directory to tar, encrypts it and saves in file `~/.local/privacy.tar.gpg`
 - close - it does exactly what flush does + additionally it removes the ramdisk directory and symbolic link to that file.

## Aliases

To make the work with the script easier, I have a few aliases in [.bashrc]([LinuxDotFiles/.bashrc at main · progoza/LinuxDotFiles (github.com)](https://github.com/progoza/LinuxDotFiles/blob/main/.bashrc)) file:

```shell
alias prv-open="privacy open; cd ~/privacy"
alias prv-flush="privacy flush"
alias prv-close="privacy close; cd"
```

Whenever I need to do something with my private files I run:

```
prv-open
```

And insert private key passphrase if needed.
After I am done with the work on private files, I run:

```
prv-close
```

## Remember to flush :-)

The unencrypted files are never stored on HDD (they only live in memory) and this is according to the design. But it means that the vault must be flushed or closed to save the changes in the file!
