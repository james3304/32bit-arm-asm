.syntax unified
    .align      2
    .section  .rodata   

outputMsg:
    .ascii "fib(%d) = %d\012\000"  

    .text                    // Code
    .global main
    .type   main, %function

main:
    @prologue
    push  {r4, fp, lr} 
    add      fp, sp, #4

    mov  r4, #1     @r4, <- #0, r4 

topOfLoop:
    mov r0, r4          @sequence request
    bl fibonacci        @branch/link to function

    mov r2, r0              @ r1 <- fibonacci
    mov r1, r4              @ r1 <- lcv
    ldr r0, = outputMsg     @ r0 <- address
    bl printf               @ give r4 back

    add r4, r4, #1          @increment LCV
    cmp r4, #10           
    ble topOfLoop

    @epilogue
    sub sp, fp, #4
    pop {r4, fp, lr}

    mov r0, #0
    bx lr