	.syntax unified
	.align	2
    .section    .rodata

	.text
	.global	getNumbers
	.type	getNumbers, %function
numberPrompt:
    .asciz "\nEnter a number from 0-9. (%d of %d) ?"

inputFormat:
    .asciz "%d"

outOfRange:
    .asciz "number must be between %d and %d"


//r4 = amt of numbers left to give
//r2 = amt we need total 
//r5 = stores picks in memory
getNumbers:
    push {r4, r5, fp, lr}
    add fp, sp, #20          //idk
    sub sp, sp, #4          //idk

    mov r4, #3              //sets lcv for entering #s
    ldr r5, [fp, #-16]       //loads r5 with inputted number

topOfLoop:
    mov r2, #3              //sets lcv for checking #s
    mov r1, r4              //sets r1 to amt of numbers left to give
    ldr r0, =numberPrompt   //loads prompt
    bl printf            

    sub r1, fp, #4
    ldr r0, =inputFormat    //loads input format
    bl scanf

    ldr r0, [fp, #-4]       //loads r5 with inputted number
    str r0, [r5]            //stores pick in memory (starting at fp-16)
    sub r5, r5, #4          //decrements

    cmp r0, #0              //checks if number is valid 0-9
    blt invalidNum
    cmp r0, #9
    bgt invalidNum
    b validNum

validNum:
    subs r4, r4, #1
    bgt topOfLoop

invalidNum:
    mov r2, #9
    mov r1, #0
    ldr r0, =outOfRange
    bl printf
    b topOfLoop
    
epilogue:
    sub fp, sp, #4
    pop {r4, r5, fp, lr}