
# GNU Privacy Guard

Generate private/public key pair:

```shell
gpg --quick-generate-key
```

List keys:

```shell
gpg --list-secret-keys --keyid-format=long
```

to export public key:

```shell
gpg --armor --export users-email@domain.org >> pubkey.gpg
```

Import public key (having someone's public key imported we can encrypt messages):

1st thing is to import the key:

```shell
gpg --import pubkey.gpg
```

2nd thing is to check the fingerprint of the key and signing the key. For that we need to edit the imported key:

```
gpg --edit-key users-email@domain.org

sec  rsa2048/C101CE8F876B7189
     utworzono: 2016-10-26  wygasa: nigdy       użycie: SC
     zaufanie: nieznany      poprawność: nieznany

gpg> **fpr**

### this will print the fingerprint
```

This fingerprint needs to be validated with the person who provided the key.
If it is ok, then we can sign the key and mark it as trusted:

```
gpg> sign

gpg> trust
1 = I don't know or won't say
2 = I do NOT trust
3 = I trust marginally
4 = I trust fully
5 = I trust ultimately
m = back to the main menu

Your decision? 5
Do you really want to set this key to ultimate trust? (y/N) y
```

Now we can encrypt the messages. For instance:

```shell
gpg --encrypt --recipient pawel.rogoza@gmail.com  .\file.txt
```

Will create the file `file.txt.gpg` (note: original file.txt will not be removed).
The recipient of the file can decrpt it with their private key:

```shell
gpg --decrupt file.txt.gpg
```

By default will be printed to stdout, orignial gpg file will not be removed.

