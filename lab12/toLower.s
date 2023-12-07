	.syntax unified
	.align	2
	.text
	.global	toLower
	.type	toLower, %function

	
toLower:
	push {r4, fp, lr}
	add fp, sp, #12
	mov r4, r0		//address of first letter 

topOfLoop:
	ldrb r0, [r4]
	cmp r0, 0x0
	beq endOfLoop

	cmp r0, 'A'
	blt middleLoop
	
	cmp r0, 'Z'
	bgt middleLoop

	orr r0, r0, 0x20
	str r0, [r4]

middleLoop:
	add r4, r4, #1
	bne topOfLoop

endOfLoop:
	sub fp, sp, #12
	pop {r4, fp, lr}