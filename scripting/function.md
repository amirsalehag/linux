# functions
```
<function name> () {
  < commands >
}
```
for calling this function we just specify its name and thats it.  
```
test () {
  echo hiii
}

test
```
---
* For using variables inside a function, it recommanded to use `local <option> <name=value>` and it make the variable with the defined value even from outside of the function.  
```
testing () {
  local number=$1
  echo "my number is $number"
}
testing
```
---
