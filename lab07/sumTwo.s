	// functions.s
	
	.syntax unified
	.text
	.align	2

	.global	sumTwo
	.type	sumTwo, %function

sumTwo:
	nop
	@prologue
	sub	sp, sp, 8		@ space for fp, lr
    str fp, [sp, 0]     @ save fp    (sp + 0)
    str lr, [sp, 4]     @   and lr   (sp + 4)
    add	fp, sp, 4       @ set our frame pointer

    add r0, r0, r1

	@epilogue
	ldr	fp, [sp, 0]     @ restore caller fp
    ldr	lr, [sp, 4]     @ lr
    add	sp, sp, 8       @ and sp

	bx	lr				@ branch/exchange to caller
