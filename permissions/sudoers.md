# adding user to sudoers
when we want to add a user as sudoer, we can use `sudo visudo` command but its not the preferred way,  
its better to edit the `/etc/sudoers.d/` instead.because if we get an update  
to the sudo package, we might loose our changes inside of it.
