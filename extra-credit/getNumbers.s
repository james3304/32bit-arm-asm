	.syntax unified
	.align	2
    .section    .rodata

numberPrompt:
    .asciz "\nEnter a number from 0-9. (%d of %d)? \n"

inputFormat:
    .asciz "%d"

outOfRange:
    .asciz "number must be between %d and %d"

	.text
	.global	getNumbers
	.type	getNumbers, %function

//r4 = amt of numbers left to give
//r2 = amt we need total 
//r5 = stores picks in memory
getNumbers:
    push {r4, r5, fp, lr}
    add fp, sp, #8          //idk

    mov r4, #3              //sets lcv for entering #s
    sub r5, fp, 16          //loads r5 with top of address

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
    add r5, r5, #4          //plan is to store in -16, -12, -8

    cmp r0, #0              //checks if number is valid 0-9
    blt invalidNum
    cmp r0, #9
    bgt invalidNum
    b validNum              //if neither, good job!

validNum:
    sub r4, r4, #1          //decrements asked for amt of #s
    cmp r4, #1
    bge topOfLoop           //need more #s? back to the top
    cmp r4, #1
    blt epilogue            //got all 3, go to end

invalidNum:
    mov r2, #9              //max valid 
    mov r1, #0              //min valid 
    ldr r0, =outOfRange     
    bl printf
    b topOfLoop             //takes you back to prompt
    
epilogue:
    ldr r0, [fp, #-8]       //pass 3rd value in r0
    ldr r1, [fp, #-12]      //2nd value in r1
    ldr r2, [fp, #-16]      //3rd value in r2
    
    sub fp, sp, #8
    pop {r4, r5, fp, lr}
    bx lr