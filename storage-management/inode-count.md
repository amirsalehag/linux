# command for counting inodes used in each directory
```
for i in /*; do echo $i; find $i |wc -l; done
```
---
