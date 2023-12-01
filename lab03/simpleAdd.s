// as -g simpleAdd.s -o simpleAdd.o
// ld simpleAdd.o -o simpleAdd
// ./simpleAdd
// echo $?

.text				// code section            
.global _start			// make _start available to O/S

_start:
    nop				// no operation (helps with debugger)
    mov r0, #25     // move the value 10 to r0
    mov r1, #25      // move the value 5 to r0
    add r2, r0, r1	// add the value in r0 to the value in r1
                    // and store the resulting value in r2
    mov r0, r2      // mov r0 <- r2
    mov r7, #1 		// r7 <- 1 ( SYS_EXIT ), system call to exit
    swi 0			// software interrupt instruction3