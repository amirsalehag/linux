# Find files with matching checksum
We can use this command to find duplicate files with matching checksums on a specific path:  
```bash
find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD
```
it only outputs the checksum and its file name, we can then delete them if needed.
