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
