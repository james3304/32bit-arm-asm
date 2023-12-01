COSC2425 : Fall 2023
Lab04 : simpleAdd1 Load and Store modifications

Introduction:

In this lab, you are provided a starter application - simpleAdd.s. As provided, this application does addition ( 10 + 12 + 8) and returns the resulting value as a result code to the operating system.

The application, as written, returns the resulting value directly from the 'accumulating' register r0.

Requirements:

1) modify the source code file ( simpleAdd1.s ) to reserve 4 additional bytes from the stack - to be used to store the sum of the additions 

2) modify the source code file ( simpleAdd1.s ) to then save the sum to the newly allocated memory location

3) retrieve the sum from the newly allocated memory location

4) return the retrieved value in r0

5) modify the source code file ( simpleAdd1.s ) to deallocate all allocated memory



