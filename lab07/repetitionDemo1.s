// 	gcc -g repetitionDemo1.s sumTwo.s -o repetitionDemo
	.syntax unified
	.text
	.align	2
	.global	main
	.type	main, %function

main:
	nop

	@ prologue
	sub	sp, sp, 8       @ space for fp, lr
	str	fp, [sp, 0]     @ save fp     sp + 0
	str	lr, [sp, 4]		@   and lr    sp + 4
	add	fp, sp, 4		@ set our frame pointer

	sub sp, sp, #12		@ 12 bytes for r4, r5, r6

	@ store current values of r4, r5, r6 to stack
	str	r4, [fp, #-8]
	str	r5, [fp, #-12]
	str	r6, [fp, #-16]
	
	// initialize our 'variables'
	mov r4, #0      	@ r4 <- #0 -> cumulative sum
    mov	r5, #0         	@ r5 <- #0 -> loop control variable
	mov r6, #10      	@ r6 <- #10 -> max repetitions 

topOfLoop:   
	mov r0, r4			@ r0 <- r4 (cumulative sum)
	mov r1, r5			@ r1 <- loop control variable
	bl 	sumTwo			@ branch/link to sumTwo function
	mov r4, r0			@ r4 <- result of sumTwo 

    add r5, r5, #1		@ increment loop control varaible
    cmp r5, r6			@ compare loop count and LCV
	blt topOfLoop		@ if les than or equal, branch to topOfLoop 

	mov r0, r4			@ r0 <- r4 (cumulative sum)

	@ restore r4, r5, r6
	ldr	r4, [fp, #-8]
	ldr	r5, [fp, #-12]
	ldr	r6, [fp, #-16]

	add sp, sp, #12

	@ epilogue
	ldr	fp, [sp, 0]		@ restore caller fp
	ldr	lr, [sp, 4]		@       lr
	add	sp, sp, 8		@   and sp

	bx	lr      		@ branch/exchange to address on lr (return)

