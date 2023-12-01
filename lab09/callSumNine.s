	.syntax unified

	.section	.rodata
	.align	2

sumFormat:
	.ascii	"The sum is %i\012\000"

	.text

	.global	main
	.type	main, %function
main:
	push {fp, lr}
	add	fp, sp, #4

	sub	sp, sp, #64			// why 64 ??
	
	mov	r3, #1
	str	r3, [fp, #-8]		// 'a'
	mov	r3, #2
	str	r3, [fp, #-12]		// 'b'
	mov	r3, #3
	str	r3, [fp, #-16]		// 'c'
	mov	r3, #4
	str	r3, [fp, #-20]		// 'd'
	mov	r3, #5
	str	r3, [fp, #-24]		// 'e'
	mov	r3, #6
	str	r3, [fp, #-28]		// 'f'
	mov	r3, #7
	str	r3, [fp, #-32]		// 'g'
	mov	r3, #8
	str	r3, [fp, #-36]		// 'h'
	mov	r3, #9
	str	r3, [fp, #-40]		// 'i'

	ldr	r3, [fp, #-40]		// 'i' -> [sp +16]
	str	r3, [sp, #16]

	ldr	r3, [fp, #-36]		// 'h' -> [sp +12]
	str	r3, [sp, #12]

	ldr	r3, [fp, #-32]		// 'g' -> [sp +8]
	str	r3, [sp, #8]

	ldr	r3, [fp, #-28]		// 'f' -> [sp +4]
	str	r3, [sp, #4]

	ldr	r3, [fp, #-24]		// 'd' -> [sp + 0]
	str	r3, [sp]

	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sumNine
	str	r0, [fp, #-44]
	
	ldr	r1, [fp, #-44]
	ldr	r0, =sumFormat
	bl	printf
	mov	r3, #0
	mov	r0, r3

	sub	sp, fp, #4
	
	pop	{fp, lr}
	bx lr
