## `${}` and `$()`
`$(command)` or `` `command` `` they run the command that is inside and also they run the output of their commands.  
but when assigned to a variable, like `var=$(command)` they just assign the commands output as the `var` value.  
`${parameter}` is a parameter substitution.  
for more info check out this [link](https://tldp.org/LDP/abs/html/parameter-substitution.html).

---
# some common issues
* Variables should always be referred to in the ${var} form (as opposed to $var.  
* Variables should always be quoted, especially if their value may contain a whitespace or separator character: "${var}".  
* Always use $(cmd) for command substitution (as opposed to backquotes).  

---
