	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"testSortArray.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"before sort:\000"
	.align	2
.LC1:
	.ascii	"after sort:\000"
	.text
	.align	2
	.global	main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 408
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #408
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	bl	rand
	mov	r1, r0
	ldr	r3, .L5
	smull	r2, r3, r3, r1
	asr	r2, r3, #3
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-404]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L3
	ldr	r0, .L5+4
	bl	puts
	sub	r3, fp, #408
	mov	r1, #100
	mov	r0, r3

	bl	printArray

	sub	r3, fp, #408
	mov	r1, #100
	mov	r0, r3

	bl	sortArray

	ldr	r0, .L5+8
	bl	puts
	sub	r3, fp, #408
	mov	r1, #100
	mov	r0, r3

	bl	printArray
	
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L6:
	.align	2
.L5:
	.word	1374389535
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Raspbian 10.2.1-6+rpi1) 10.2.1 20210110"
	.section	.note.GNU-stack,"",%progbits
