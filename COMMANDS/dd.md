# simple write speed test with dd
```
dd if=/dev/zero of=test bs=4M count=32 oflag=direct
```
# read speed test on the file created
```
dd if=test of=/dev/null bs=4M
```
* if the read speed suddenly increases , it means its the servers cache system making that boost.
---
