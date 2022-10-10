### (its important to say that its better to use parted for specially gpt formated partitioning)
* we can resize a partitions size by using fdisk:
```
fdisk /dev/sdb
```
we need to check the partition number first, and then we remove the partition and create the same  
partition number again but with extended size and then write the changes.  

---
# Changing partition size while in use of LVM
For example we have `sdb` with 10G storage, we had`sdb1` partition with 5G storage and we where using it with lvm.  
We then decided to extend `sdb1` size to 10G.  
we need to first, `umount` the partition, and then we resize the partition ,and then use `partprobe` for our block devices to be  
updated in kernels partition table, and after that, we update the filesystem using for example `e2fsck` for ext4 filesystems  
and then we mount it back to its directory.  

---
* You can read this [article](https://oracle-base.com/articles/linux/linux-disk-partitioning) for more info.

---
