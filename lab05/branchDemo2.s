// branchDemo2.s
// gcc -g branchDemo2.s functions.s -o branchDemo2
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

	sub sp, sp, #16		@ allocate from stack memory -> 12 bytes for local storage
	
    mov	r3, #4          @ r3 <- #10
   	str	r3, [fp, #-8]   @ r3 -> to fp address with offset -8         
	mov r3, #6			@ r3 <- #12
	str	r3, [fp, #-12]  @ r3 -> to fp address fp with offset -12
	mov r3, #2			@ r3 <- #8
	str	r3, [fp, #-16]  @ r3 -> to fp with offset -16      
	
	@ call lesser, store result at [fp, #-14]
	ldr	r0, [fp, #-8]   @ r0 <- 'x'
	ldr	r1, [fp, #-12]  @ r1 <- 'y'
	ldr	r2, [fp, #-16]  @ r2 <- 'z'
	bl	lesser          @ branch/link to lesser
	bl	greater
	str	r0, [fp, #-20]	@ r0 -> [fp, #-20]

	@ load result from stack
    ldr	r0, [fp, #-20]	@ r0 <- [fp, #-4]	

   	add sp, sp, #16     @ deallocate 16 bytes of stack used for local storage

	@ epilogue
	ldr	fp, [sp, 0]		@ restore caller fp
	ldr	lr, [sp, 4]		@       lr
	add	sp, sp, 8		@   and sp

	bx	lr      		@ branch/exchange to address on lr (return)
