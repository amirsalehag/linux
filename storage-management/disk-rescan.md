# added disk from vcenter
* We can use the command bellow to rescan the disks after adding it from esxi or other methods:  
```
for host in $(ls /sys/class/scsi_host) ; do echo ${host}; echo "- - -" > /sys/class/scsi_host/${host}/scan ; done
```
---
