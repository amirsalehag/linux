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
