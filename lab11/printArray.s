.syntax unified 
    .align 2

    .section    .rodata
output:
    .asciz "%d\n"

    .text
    .global printArray
    .type printArray, %function

printArray:
    push {r5, r7, fp, lr}
    add fp, sp, #4

    mov r5, r0      // r5 = address of array
    mov r7, r1      // grabs lcv (100)
    ldr r1, [r5]    // r5 = value at top of array

topOfLoop:
    ldr r0, =output // load the address of the format string
    bl printf

    add r5, r5, #4  // increment address by 4
    ldr r1, [r5]    // load the value at the address

    sub r7, r7, #1  //decrement counter
    cmp r7, #0      
    bgt topOfLoop 


    //prologue
    mov r0, #0
    sub sp, fp, #4
    pop {r5, r7, fp, lr}
    bx lr