# *easily creating an LVM*
* First if you want to patition your disk, we can use fdisk, gdisk, parted or even gparted(gui version).  
We use fdisk just for this test:
```
sudo fdisk /dev/sdb # or any block device
```
then we create a partition , doesnt matter if its `gpt` or `dos/mbr`.  
(but remember if we set the disks label as `gpt` we cant use its whole device for lvm, tho if we do partitioning, we can use its partitions.)

---
* Then we have to label the devices or the partitions as PVs:
```
sudo pvcreate /dev/sdb1 /dev/sdb2 /dev/sdc
```
* We can remove the labels from them with `pvremove` command.
* We then create a volume group for the PVs to join:
```
sudo vgcreate vgtest /dev/sdb1 /dev/sdb2 /dev/sdc
```
* We can remove the volume group created with `vgremove vgtest` command.
* Then we need to create logical volumes out of the created VGs:
```
sudo lvcreate -L 1G -n lvtest vgtest
```
* We can remove the LV created by `lvremove /dev/vgtest/lvtest` command.
* We can verify all these commands and infos by `display` command.(pvdisplay,vgdisplay,lvdisplay)
* Now that the logical volume is ready, we can format and mount the logical volume like any other EXT2/3/4 partition.
```
mkfs.ext4 /dev/vgtest/lvtest
mkdir /lvm-mount
mount /dev/vgtest/lvtest /lvm-mount/
```
we can unmount any block device or partition using `umount` command.

---
# *Other information*
* expanding the LV:
(Note that after resizing a logical volume, we also need to resize the file system to match.)
* First, we unmount the volume.
```
umount /lv-mount
```
* Then we set the size of the volume to be 2G.
```
lvresize -L 2G /dev/volume-group1/lv1
```
* Next, we check the disk for errors.(we use `e2fsck` because we used ext4 type filesystem.)
```
# e2fsck -f /dev/vgtest/lvtest
```
* After that, we update the ext4 filesystem.
```
resize2fs /dev/vgtest/lvtest
```
And then we mount it back.
* You can even reduce the size back down but we have to reduce the filesystems size before LV.`resize2fs /dev/vgtest/lvtest 100M`
---
we can expand the VG by adding a new partition or a disk. we first label the new part as PV and then use this command:
```
vgextend vgtest /dev/sdd2
```
* creating an LV with all free space:
```
lvcreate -l 100%FREE -n yourlv testvg
```
* extending all the free space for lvcreate:  
```
lvextend -l +100%FREE /dev/VolGroup00/lv_root
```
---
# *Mount filesystem on boot*
* Always remember to do this section.
Run `blkid` command to find UUID of our block devices to use for `/etc/fstab`, and then copy the LVs uuid and use it in the file:
```
UUID=10092fa9-43f5-421e-a0a1-ca96323c6388  /lvm-mount       ext4        defaults        0 2
```
---
# *Using RAID*
* We can specify a RAID type for out lvm.
Click on this [link](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_logical_volumes/assembly_configure-mange-raid-configuring-and-managing-logical-volumes#ref_creating-raid-volume-configure-manage-raid) for more information.
