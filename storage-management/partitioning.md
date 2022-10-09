* we can resize a partitions size by using fdisk:
```
fdisk /dev/sdb
```
we need to check the partition number first, and then we remove the partition and create the same  
partition number again but with extended size and then write the changes.  

---
