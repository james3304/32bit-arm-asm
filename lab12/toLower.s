	.syntax unified
	.align	2
	.text
	.global	toLower
	.type	toLower, %function

	
toLower:
	push {r4, fp, lr}
	mov r4, r0

topOfLoop:
	ldrb r0, [r5]
	cmp r0, 0x0

	cmp r0, 'A'
	blt middleLoop
	
	cmp r0, 'Z'
	bgt middleLoop

	orr r0, r0, 0x20

middleLoop:
	add r4, r4, #1
	b topOfLoop

endOfLoop:
	pop {r4, fp, lr}