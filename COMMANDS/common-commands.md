# *source command*
#### `Source` command reads the contents of the files given as argument, and then executes it on the current shell.  
* ### Using `source` command for reloading the .bashrc file after editing:  

#### Add .bashrc file:  
* First you need to create a .bashrc file in your main user directory.  
* Copy the content of [this](https://gist.github.com/marioBonales/1637696#file-bashrc) file in your .bashrc file.  
* and then use this command for it to be applied:
( be sure to be in the same directory the file is in. )
```
source .bashrc
```
---
# *glances command*
`glances` is like  `top , atop , htop` monitoring commands,but it has more of a userfriendly interface and more information about the system.

---
# *sensors command*
#### `sensors` command shows the values of the sensor chips available like temperatures, voltage, humidity, and fans.  
* Installing `sensors` command:  

centos:  
```
sudo yum install lm_sensors
```
ubuntu:  
```
sudo apt install lm_sensors
```
---
# *checking cpu architecture
* You can use this command for checking which binary type to download:
```
dpkg --print-architecture
```
---
# *apropos command*
* You can use `apropos` to search for commands if you dont know the command itself.

---
# *watch command*
* Use `watch` command before any command to update that command each 2s.  

---
# *setfacl command*
* If we needed to ssh to another server and remove a file in there but its created by root user and we couldnt use sudo in ssh command,  
we can set the files directories permission for the user that we specified for ssh, for it to be able to modify the directory or remove the  
files in it:  
```
sudo setfacl -Rm u:<user>:rwx /directory
```
and then we can remove its content.  

---
# *rsync command*
* You can `rsync`with another port like this:  
```
rsync -e 'ssh -p<port number>' <username>@<ip>:~/file ./
```
---
# *scp command*
* Copying a directory from local through an jump server, to another server:  
```
scp -oProxyCommand="ssh -W %h:%p <username on jumpserver>@<jumpserver ip> -p <port>" -r <directory name> <username>@<servers ip>:<destination>
```
# *nmap command*
* Using nmap for scanning a range of network to see what ip and ports are being used:
```
nmap -v -n -p- 192.168.178.0/24
```
