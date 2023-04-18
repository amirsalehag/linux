# Prerequisite
* first we use a second block device just for gluster (/dev/sdb).  
* we can use LVM to partition it which is recommended.  
* we make an xfs filesystem on top of the device:  
```
mkfs.xfs -i size=512 /dev/mapper/...
```
* we then edit the fstab file:
```
echo '/dev/mapper/... /data/... xfs defaults 0 2' >> /etc/fstab
mount -a
```
* For best practice reasons we can configure TCP keepalive settings on all server nodes so that any failed connections are detected quickly and automatically re-established, you’ll need to edit the /etc/sysctl.conf file and add the following lines:  
```
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_keepalive_intvl = 60
net.ipv4.tcp_keepalive_probes = 5

sysctl -p
```
* making Dispersed Volumes  
```
gluster volume create gv1 disperse 3 redundancy 1 gluster{1..3}:/data/brick0
```
