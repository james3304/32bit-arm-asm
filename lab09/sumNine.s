	.syntax unified
	.text
	.align	2

	.global	sumNine
	.type	sumNine, %function

sumNine:
	push {fp, lr}
	@ str	fp, [sp, #-4]!
	add	fp, sp, #4

	sub	sp, sp, #28
	str	r0, [fp, #-16]		// 'a' -> [fp, #-16]
	str	r1, [fp, #-20]		// 'b' -> [fp, #-20]
	str	r2, [fp, #-24]		// 'c' -> [fp, #-24]
	str	r3, [fp, #-28]		// 'd' -> [fp, #-28]
	
	ldr	r2, [fp, #-16]		// r2 <- 'a'
	ldr	r3, [fp, #-20]		// r3 <- 'b'
	add	r2, r2, r3			// r2 <- 'a' + 'b'
	ldr	r3, [fp, #-24]		// r3 <- 'c'
	add	r2, r2, r3			// r2 <- r2 + 'c'
	ldr	r3, [fp, #-28]		// r3 <- 'd'
	add	r2, r2, r3			// r2 <- r2 + 'd'
	ldr	r3, [fp, #4]		// 'i'
	add	r2, r2, r3
	ldr	r3, [fp, #8]		// 'h'
	add	r2, r2, r3
	ldr	r3, [fp, #12]		// 'g'
	add	r2, r2, r3
	ldr	r3, [fp, #16]		// 'f'
	add	r3, r2, r3
	ldr	r2, [fp, #20]		// 'e'
	add	r3, r2, r3
	str	r3, [fp, #-8]		// 'sum' -> [fp, #-8]

	ldr	r3, [fp, #-8]
	mov	r0, r3

	add	sp, sp, #28

	// prologue
	sub	sp, fp, #4
	pop {fp, lr}
	bx	lr
