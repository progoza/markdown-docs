# pass

`pass` is a password store - very simple, but powerful. It stores the passwords encrypted with [gpg](gpg.md) keys. It comes with a `dmenu` script which allows to grab the passwords whenever they are needed. There is also `rofi` script (which is usable for filling-in credentials in browsers).

Pass stores the passwords in plain files (with .gpg extension), which may be organized in directories. Running pass with no command shows the contents of the store (same as `pass ls`). To add the password, run `pass add` or `pass insert`, remove password - `pass rm`, etc.  To grab the password from cmdline simply type `pass <name-of-the-credential` and unlock your private key

Best way for me to use pass is with [rofi-pass](https://github.com/carnager/rofi-pass) scripts, as I like using rofi. `rofi-pass` stores (except of the password) some additional data - URL to webpage and username (similarly like all well-known password managers).

The biggest advantage of using pass instead of any password managers like 1password or lastpass is that you keep all your passwords securely on your hardware. No risk of leaking the passwords. 

You can easily synchronize the passwords store using `rsync`

Pass also supports OTP passwords, however I never used it so far.