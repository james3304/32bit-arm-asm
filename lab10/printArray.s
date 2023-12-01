.syntax unified 
    .align 2

    .section    .rodata
output:
    .asciz "%d\n"

    .text
    .global printArray
    .type printArray, %function

printArray:
    push {fp, lr}
    add fp, sp, #4

    mov r5, r0  // r5 = address of array
    add r7, r7, #4 // new loop control variable 
    ldr r1, [r5]    // r0 = value at top of array

topOfLoop:
    ldr r0, =output // load the address of the format string
    bl printf

    add r5, r5, #4  // increment address by 4
    ldr r1, [r5]    // load the value at the address

    sub r7, r7, #1  //decrement counter
    cmp r7, #0      
    bgt topOfLoop 


    //prologue
    sub sp, fp, #4
    pop {fp, lr}
    bx lr





//no brackets
@ r5 = 0xfffef270 [fp, #-20]
@ 0xfffef270 has the value 5
@ [r5] = 5

@ add r5, r5, #4

@ r5 = 0xfffef274 [fp, #-16]
@ 0xfffef274 has the value 4
@ [r5] = 4

@ r5 = 0xfffef278 [fp, #-12]
@ 0xfffef278 has the value 3
@ [r5] = 3