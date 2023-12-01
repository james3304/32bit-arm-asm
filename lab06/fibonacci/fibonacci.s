.syntax unified    
    .align 2
    .text

    .global fibonacci
    .type fibonacci, %function

fibonacci:
    @r4 <- sequence req
    @r5 <- LCV
    @r6 <- fib
    @r7 <- f0
    @r8 <- f1
    push {r4, r5, r6, r7, r8, fp, lr}
    add fp, sp, #4       

    mov r4, r0          
    mov r5, #0          
    mov r6, #0         
    mov r7, #0          
    mov r8, #0          

topOfLoop:

case0:
    cmp  r5, #0
    bne case1
    mov r6, #0     
    b endif

case1:
    cmp r5, #1
    bne else
    mov r6, #1
    b endif

else:
    add r6, r7, r8
    b endif

endif:
    mov r8, r7
    mov r7, r6

    add r5, r5, #1      
    cmp r5, r4          
    blt topOfLoop                 

    mov r0, r6          

    sub fp, sp, #4      
    pop {r4, r5, r6, r7, r8, fp, lr}
    bx lr
    