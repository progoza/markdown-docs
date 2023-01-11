To login with SSH without needing to insert username and password you need to store client-machine's public SSH key on server-machine ssh store.

1. Generate SSH key pair

```
ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"
```

Note - it is a good idea to check if ssh key-pair is already generated on the client machine - no need to create new one then. Just run

```
ls -al ~/.ssh/id_*.pub
```

2. Copy the *public* key (e.g. id_rsa.pub) from client to server. Use handy cmd that is now available in Linux distros for that:

```
ssh-copy-id remote_username@server_ip_address
```

That's it, SSH login without passwords should work now (from client to server).

## From Windows client

Surprisingly now this can also be done from Windows client to Linux server.
- generate ssh key pair (same like on Linux),
- scp the `C:\Users\<username>\.ssh\id_rsa.pub` to the Linux server (to home dir),
- append the contents on the file to `~/.ssh/authorized_keys`,
- If `~/.ssh/authorized_keys` does not exist, create it:

```
mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat ~/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
rm ~/id_rsa.pub
```

