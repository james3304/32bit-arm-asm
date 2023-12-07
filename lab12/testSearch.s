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
	.file	"testSearch.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"r\000"
	.align	2
.LC1:
	.ascii	"wordlSorted.txt\000"
	.align	2
.LC2:
	.ascii	"file could not be opened\000"
	.align	2
.LC3:
	.ascii	"%s\000"
	.align	2
.LC4:
	.ascii	"enter a word to search: \000"
	.align	2
.LC5:
	.ascii	"not found\000"
	.align	2
.LC6:
	.ascii	"found\000"
	.align	2
.LC7:
	.ascii	"the word %s was %s\012\000"
	.text
	.align	2
	.global	main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 31200
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #30976
	sub	sp, sp, #224
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r1, .L7
	ldr	r0, .L7+4
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L2
	ldr	r0, .L7+8
	bl	puts
	mov	r0, #0
	bl	exit
.L2:
	mov	r3, #0
	str	r3, [fp, #-8]
.L3:
	ldr	r1, [fp, #-8]
	add	r3, r1, #1
	str	r3, [fp, #-8]
	sub	r2, fp, #30976
	sub	r2, r2, #4
	sub	r2, r2, #212
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r1, .L7+12
	ldr	r0, [fp, #-16]
	bl	__isoc99_fscanf
	ldr	r0, [fp, #-16]
	bl	feof
	mov	r3, r0
	cmp	r3, #0
	beq	.L3
	ldr	r0, [fp, #-16]
	bl	fclose
.L6:
	ldr	r0, .L7+16
	bl	printf
	sub	r3, fp, #30976
	sub	r3, r3, #4
	sub	r3, r3, #220
	mov	r1, r3
	ldr	r0, .L7+12
	bl	__isoc99_scanf
	sub	r3, fp, #30976
	sub	r3, r3, #4
	sub	r3, r3, #220
	mov	r0, r3
	bl	toLower
	sub	r2, fp, #30976
	sub	r2, r2, #4
	sub	r2, r2, #220
	sub	r3, fp, #30976
	sub	r3, r3, #4
	sub	r3, r3, #212
	ldr	r1, .L7+20
	mov	r0, r3
	@bl	searchArray
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L4
	ldr	r2, .L7+24
	b	.L5
.L4:
	ldr	r2, .L7+28
.L5:
	sub	r3, fp, #30976
	sub	r3, r3, #4
	sub	r3, r3, #220
	mov	r1, r3
	ldr	r0, .L7+32
	bl	printf
	b	.L6
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	5196
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.size	main, .-main
	.ident	"GCC: (Raspbian 10.2.1-6+rpi1) 10.2.1 20210110"
	.section	.note.GNU-stack,"",%progbits
