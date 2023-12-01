.syntax unified 
    .text
    .align 2

    .global maxArray
    .type maxArray, %function

maxArray:
    push {fp, lr}
    add fp, sp, #4

    mov r2, r0      //array 'pointer'
    sub r1, r1, #1  //decrement counter
    ldr r0, [r0]

topOfLoop:
    add r2, r2, #4 // increment address to next element of array

    ldr r3, [r2]    // load newly incremented address into r3 
    cmp r3, r0   // compare r3 and r0
    movgt r0, r3 // if r3 > r0, r0 = r3

    sub r1, r1, #1  //decrement counter
    cmp r1, #0      
    bgt topOfLoop   

    //prologue
    sub sp, fp, #4
    pop {fp, lr}
    bx lr