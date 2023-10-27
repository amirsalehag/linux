# Here-Document

The redirection operators "<<" and "<<-" both allow redirection of subsequent lines read by the shell to the input of a command. The redirected lines are known as a "here-document".  
```
cat <<eof1; cat <<eof2
Hi,
how you doing?

eof1
Helene.
eof2
```
OUTPUT:
```
Hi,
how you doing?

Helene
```
