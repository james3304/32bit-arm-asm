.syntax unified 
    .text
    .align 2

    .global sumArray
    .type sumArray, %function

sumArray:
    push {fp, lr}
    add fp, sp, #4

    mov r2, r0      // top of array into r2 (fp -20)

topOfLoop:
    ldr r0, [r2]    //store 
    add r3, r3, r0
    str r3, [r2]    // store value into array
    add r2, r2, #4  // iterate to next element

    sub r1, r1, #1
    cmp r1, #0
    bgt topOfLoop

    // prologue
    sub sp, fp, #4
    pop {fp, lr}
    bx lr