# copy only changed files
```
rsync -ur newdir root@host:~
```
with -u option we only copy over only the changed files.

---

# solution for rsync disconnection
```
rsync -P file root@host:~
```
with -P ( --parallel ) we say that if the connection breaks, the incomplete file on the other side stays there and by the second time running the command again, its going to resume uploading the rest of the file.  

---
* its also good to use -a option because it enables alot of other options like archives and recurses into the directories of the directory mentioned and uses the same permissions and more.  

---
