# Costom storage management
---
## LVM

first we need to specify a boot partition for our system,  
(remember that boot and swap partition should be out of lvm becauce when the system boots, it should first detect  
the physical disks, and then the software itself, therefore its impossible to detect the software partitioning first.)  
we create an GPT partition and choose the size we want to allocate for `/boot` (which is better to be 1G).  
after that we can do the same for swap partition, but after that, because we want to use lvm,  we select the remaining  
space and create a GPT partition but with the remaining size, and choose unformatted for filesystem type and create the partition,  
and then we can choose to create LVM on that partition which we first create the vg and then its lv's.  

---
