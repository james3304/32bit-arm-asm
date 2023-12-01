// as helloWorld.s -o helloWorld.o
// ld helloWorld.o -o helloWorld

.text                    // code section            
.global _start            // make _start available to O/S

_start:
    mov r0, #1            // send message to stdout ( #1 )
    ldr r1, =message    // load r1 with label name
    ldr r2, =12         // length of messsage
    mov r7, #4            // system call to exit, r7 <- 4 ( SYS_WRITE )
    swi 0                // software interrupt instuction 

mov r7, #1                 // system call to exit, r7 <- 1 ( SYS_EXIT )
    swi 0                // software interrupt instuction

.data                    // data section

message:
    .asciz "Hello World\n"