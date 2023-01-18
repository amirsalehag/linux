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
