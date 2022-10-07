# *What is LVM*
LVM stands for Logical Volume Management. It is a system of managing logical volumes, or filesystems, that is much more advanced and  
flexible than the traditional method of partitioning a disk into one or more segments and formatting that partition with a filesystem.

---
* The benefits of lvm shows itself more on large system with many storage disks.we can easily manipulate the storage space on each  
partition, logical volumes, add or remove physical volumes to or from logical volumes and even more.  

---
An overview of lvm architecture:  
<pre>  sda1  sdc   hdc2      (PV:s on partitions or whole disks)  
     \   |   /  
      \  |  /  
       diskvg          (VG)  
       /  |  \  
      /   |   \  
  usrlv rootlv varlv   (LV:s)  
   |      |      |  
 ext2  reiserfs  xfs   (filesystems)  </pre>

---
# *physical volume (PV)*
Physical volumes are hard disks or even a partition of a hard disk, but they should be labeled as PV by its command.

---
# *volume group (VG)*
The Volume Group is the highest level abstraction used within the LVM. We define one or more PVs with 100G each , into one , for example  
600G VG (like one big partition).

---
# *logical volume (LV)*
The volume groups can be divided into logical volumes, which are assigned mount points, such as /home and / and file system types, such as  
ext2 or ext3. When "partitions" reach their full capacity, free space from the volume group can be added to the logical volume to increase  
the size of the partition. When a new hard drive is added to the system, it can be added to the volume group, and partitions that are  
logical volumes can be increased in size.

---
# *Physical extents and logical extents (PE,LE)*
PEs are chunks of data available on each physical volume called PE, which is by default set to 4M ,  
LEs are the same and its better to be the same size as its PEs.

---
* When creating logical volumes, we can specify how the data to be spread across the volume group, we can even consider a RAID level  
to be performed while writing data on disks which is delt with, by the extent size of the extents (which might be 4Mb), and the extents  
are for example if we chose raid 0 (or stripe) each block of data (extents) are spread across the PVs one by one as round robin algorithm.  
* Or istead use Linear mapping, that will assign a range of PEs to an area of LV in order. LE 1-99 map to PV1 and LE 100-347 map onto PV2.
