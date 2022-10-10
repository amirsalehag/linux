# using `SSH`
```
ssh <username>@<ip or hostname> < -p <port number> >
```
---
# SSH without password
For connecting to another host via SSH without password, we first need to generate ssh keygen with `ssh-keygen` command.  
after that we should copy id-rsa.pub to the destination host with `ssh-copy-id -i ~/.ssh/id_rsa.pub <username>@<ip or hostname>`.

---
