.syntax unified 
    .align 2
    .text
    .global sortArray
    .type sortArray, %function

sortArray:
    push {r4, r5, r6, r7, fp, lr}
    add fp, sp, #4
    mov r5, r0      @ r5 = top of array
    mov r6, r1      @ r6 = lcv (100)
    mov r4, r1      @ r0 = outer LCV

    @   primer
    ldr r0, [r5]    @ load 1st element
    add r5, r5, #4  @ increment array
    ldr r1, [r5]    @ load 2nd element
    b compareElements

arrayLoop:
    sub r6, r6, #1  @ decrement lcv
    cmp r6, #1
    blt outerLoop

    ldr r0, [r5]    @ load value (r0)

    add r5, r5, #4  @ increment past last element
    ldr r1, [r5]    @ load value (r1)

    cmp r0, r1
    bne compareElements @ r0 != r1, branch to compare

    cmp r0, r1
    b saveElements

compareElements:
    cmp r0, r1          @ compare r0 and r1
    bgt swapElements    @ if r0 > r1, swap elements

    cmp r0, r1          @ 2nd compared
    blt arrayLoop       @ if r0 < r1, move to next values

swapElements:
    mov r7, r0     @ greater number into r7
    mov r0, r1     @ lesser number into r0
    mov r1, r7     @ put greater number into r1
    b saveElements

saveElements:
    sub r5, r5, #4
    str r0, [r5]
    add r5, r5, #4
    str r1, [r5]
    b arrayLoop

outerLoop:
    add r6, r6, #99
    mov r5, r3
    sub r4, r4, #1
    cmp r4, #1
    bgt arrayLoop

endOfLoop:
    mov r0, #0
    sub fp, sp, #12
    pop { r4, r5, r6, r7, fp, lr}