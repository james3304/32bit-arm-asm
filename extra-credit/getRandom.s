	.syntax unified
	.align	2

	.text

	.global	__aeabi_idivmod
	.global	getRandom
	.type	getRandom, %function

getRandom:
	push {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	
	mov	r0, #9
	str	r0, [fp, #-8]
	bl	rand

	mov	r3, r0
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	__aeabi_idivmod

	mov	r3, r1	
	mov	r0, r3	//random returned value
	mov r2, #0	//sets to 0 cuz idk why it isnt
	mov r3, #0	//same
	mov r1, #0	//same

	//prologue
	sub	sp, fp, #4
	pop	{fp, lr}
	bx lr

