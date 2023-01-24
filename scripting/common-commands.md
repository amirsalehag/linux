# script output to a file
* We can save the outputs of a whole script with this command on top of the scripts:  
```
exec >> output.log 2>&1
```
---
# removing quotes from around a string
```
echo '"hi"' | sed -e 's/^"//' -e 's/"$//'
```
without `sed` it would have echo'd `"hi"`

---
# if statement with multiple values
```
[[ $databases == @(gwc|map) ]] && echo $databases
```
this means that if the `databases` value is one of the values mentioned above, then that statement is correct.  

---
# finding the files in a directory without its parent
```
find /data/db-backup-daily/platform/ -mindepth 1 -printf "%f\n"
```
mindepth will discount the parent directory and printf will only output the last file found in that directory.

---
# set
```
set -eu
```
with -e option we specified that if a command in the shell script fails, the script would exit out, and with -u option, the shell also exit out if a variable is undifined.  

---
