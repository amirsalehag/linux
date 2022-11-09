# ssh tunneling
SSH tunneling is a method of transporting arbitrary networking data over an encrypted SSH connection. It can also be used to implement VPNs (Virtual Private Networks) and access intranet services across firewalls.  
# Local ssh Port Forwarding 
You can use a local ssh tunnel when you want to get to a resource that you can’t get to directly, but a ssh server that you have access to can. Here are some scenarios.  
![image](https://www.tunnelsup.com/images/ssh-local2.png)  
In the image above, the blue host cannot reach `http://192.168.0.3` but can ssh to `192.168.0.2`.   
The following ssh command executed on the blue host will allow the blue host to reach the red host.  
```
ssh -L 8080:192.168.0.3:80 reduser@192.168.0.2
```
Now the blue host can open a browser, and go to `http://localhost:8080` and be presented with the webpage hosted on `192.168.0.3`.

---
# Remote SSH Port Forwarding
In this scenario we are creating a reverse ssh tunnel. Here we can initiate an ssh tunnel in one direction, then use that tunnel to create an ssh tunnel back the other way.  
![image](https://www.tunnelsup.com/images/ssh-remote.png)  
We are on the green host and want to ssh to the blue host. However, the firewall blocks this connection directly. Because the blue host can ssh to the green host, we can connect using that, and when the green host wants to ssh back to the blue host, it can ride along this previously established tunnel.  
Blue host initiates ssh tunnel like this:  
```
ssh -R 2222:localhost:22 greenuser@192.168.0.2
```
This opens port 2222 on the green host, which is then port forwarding that to port 22 on the blue host. So if the green host were to ssh to itself on port 2222 it would then reach the blue host.  
Green host can now ssh to blue host like this:
```
ssh -p 2222 blueuser@localhost
```
# Using the -N Option
When using ssh, you can specify the -N flag which tells ssh you don’t need to send any commands over the ssh connection when it’s established. This option is often used when making tunnels since often we don’t need to actually get a prompt.  

---
# killing ssh tunneling
To kill an ssh port forwarding process:  
```
ps aux | grep ssh
kill <pid>
```
---
