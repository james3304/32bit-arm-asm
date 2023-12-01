    .syntax unified
    .align 2
    .section  .rodata   @newAssembly directive

thePrizeMsg:
    .asciz "prize = %d\012"  // %d is the first parameter

guessPrompt:
    .asciz "guess between 1 and 20 (%d of %d) ?"

inputFormat:
    .asciz "%d"

debugScanf:
    .asciz "scanf stored %d\n"

tooLow:
    .asciz "your guess is too low"
tooHigh:
    .asciz "your guess is too high"

youLoseMsg:
    .asciz "you lose. the number was %d"
youWinMsg:
    .asciz "congratulations, you win!"  // %d is the first parameter    

    .text
    .global main
    .type   main, %function

main:
    @prologue
    push  {r4, r5, r6, fp, lr} 
    add fp, sp, #4

    sub sp, sp, #4

    mov r6, #7

    bl getRandom
    mov  r4, r0     @r4, <- #0, r4 is

    //output the 'cheat'
    mov r1, r4                  @'the prize'
    ldr r0, =thePrizeMsg
    bl printf

topOfLoop:
    //output the prompt
    mov r2, #7
    mov r1, r6
    ldr r0, =guessPrompt
    bl printf

    // get guess from user
    sub r1, fp, #8
    ldr r0, =inputFormat
    bl scanf

    ldr r5, [fp, #-8]

    mov r1, r5
    ldr r0, =debugScanf
    bl printf
    
    //output correct prompt of too high, too low, or correct
    cmp r5, r4          //compare prize r5 with guess r4
    ldrlt r0, = tooLow
    ldrgt r0, = tooHigh
    ldreq r0, = youWinMsg
    bl puts @printf

    cmp r5, r4
    beq epilogue

    subs r6, r6, #1
    bgt topOfLoop

    mov r1, r4          //prize
    ldr r0, =youLoseMsg
    bl printf

epilogue:

    @epilogue
    add sp, sp, #4

    sub sp, fp, #4
    pop {r4, r5, r6, fp, lr}

    mov r0, #0
    bx lr