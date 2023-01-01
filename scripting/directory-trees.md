* If we want to make a hosts directory hierarchy on another host, but dont need the datas and files in them, we can use this command:
```
find . -type d -print | cpio -oO directory.cpio
```
and then we copy this file on the needed host and run this command:
```
cpio -iI dirs.cpio < --no-absolute-filenames  (if we want it to be extracted to the corrent directory) >
```
---
