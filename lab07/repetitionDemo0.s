// 	gcc -g repetitionDemo0.s doNothing.s -o repetitionDemo
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

    mov r2, #0          @ r2 <- #0  -> loop control variable
    mov	r3, #10         @ r3 <- #10 -> max repetitions

topOfLoop:   

	bl doNothing

    // very dangerous assumption here - what is it 
	add r2, r2, #1
    cmp r2, r3
    bne topOfLoop

	@ epilogue
	ldr	fp, [sp, 0]		@ restore caller fp
	ldr	lr, [sp, 4]		@       lr
	add	sp, sp, 8		@   and sp

	bx	lr      		@ branch/exchange to address on lr (return)
