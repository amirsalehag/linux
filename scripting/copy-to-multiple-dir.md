```
find /<directory>/ -maxdepth 1 -mindepth 1 | while read -r DIR || [[ -n $DIR ]]; do cp file $DIR ; done
```
* this will input each found directory line by line and put it in the DIR variable and copies the file into that directory.

---
