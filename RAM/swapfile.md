# what is swapspace
swapspace is a volume on a hard disk, which does a job like ram but because  
its on the hard disk, its performs slower but its very necessary to have it.  
swapspace can be allocated to a partition or a file which you can click this [link](https://linuxize.com/post/create-a-linux-swap-file/) to make  
swapfile and also read what swappiness is or you can click on this [link](https://docs.oracle.com/cd/E37670_01/E41138/html/ch17s02s03.html) to make swap partition.

---
* removing swapspace without deleting its data  
for this scenario, lets say you have an almost full ram and a working swapspace , but you might want to make a change like deleting or resizing the swapspaces size,  
you can check the amount of the swapspace being used and how much free RAM we have, you can also do this test , run `htop` and see the results live,  
if the data inside swapspace fits in our RAM , or if not, you can stop some process to free up some memory, and then you have to disable (not to remove immediately)  
```
sudo swapoff <path to swapfile>
```
and then you can see from `htop`that its pouring its content in RAM, and then after changing it, you can turn it on.
