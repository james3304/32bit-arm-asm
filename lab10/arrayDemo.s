.syntax unified
    .align 2

    .section    .rodata
outputMax:
    .ascii "max = %d\012\000"
outputMin:
    .ascii "min = %d\012\000"
outputSum:
    .ascii "sum = %d\012\000"

    .text
    .global main
    .type main, %function

main:
    push {r6, fp, lr}
    add fp, sp, #4

    sub sp, sp, #24

    mov r0, #2
    str r0, [fp, #-8]

    mov r0, #3
    str r0, [fp, #-12]

    mov r0, #4
    str r0, [fp, #-16]

    mov r0, #5
    str r0, [fp, #-20]

    sub r0, fp, #20     // r0 <- 'address' of array
    bl printArray

    mov r1, #4          //r1 <- count of 'elements' of array
    sub r0, fp, #20     //r0 <- 'address' of array
    bl doubleValues

    sub r0, fp, #20     //r0 <- 'address' of array
    bl printArray

    // print value of max element
    mov r1, #4          //r1 <- count of 'elements' of array
    sub r0, fp, #20     //r0 <- 'address' of array
    bl maxArray

    //print max value
    mov r1, r0
    ldr r0, =outputMax
    bl printf

    // get value of min element
    mov r1, #4          //r1 <- count of 'elements' of array
    sub r0, fp, #20     //r0 <- 'address' of array
    bl minArray

    //print min value
    mov r1, r0
    ldr r0, =outputMin
    bl printf

    mov r1, #4          //r1 <- count of 'elements' of array
    sub r0, fp, #20     //r0 <- 'address' of array
    bl sumArray

    mov r1, r0
    ldr r0, =outputSum
    bl printf

    add sp, sp, #24

    sub sp, fp, #4
    pop {r6, fp, lr}
    bx lr