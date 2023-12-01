	// functions.s
	
	.syntax unified
	.text
	.align	2

	.global	lesser
	.type	lesser, %function

lesser:
	nop
	@prologue
	sub	sp, sp, 8		@ space for fp, lr
    str fp, [sp, 0]     @ save fp    (sp + 0)
    str lr, [sp, 4]     @   and lr   (sp + 4)
    add	fp, sp, 4       @ set our frame pointer

    @store parameters to stack
	sub sp, sp, #12		@ allocate from stack memory -> 12 bytes for local storage
   	str	r0, [fp, #-8]	@ 'x' -> [fp, #-8]         
	str	r1, [fp, #-12]	@ 'y' -> [fp, #-12]
	str	r2, [fp, #-16]	@ 'z' -> [fp, #-16]      
	
	// load parameters to registers for copmparisons
	ldr	r1, [fp, #-8]	@ r1 <- 'x' ( [fp, #-8] )
	ldr	r2, [fp, #-12]	@ r1 <- 'y' ( [fp, #-12] )
	ldr	r3, [fp, #-16]	@ r1 <- 'z' ( [fp, #-16] )

    mov r0, r1          @ assume 'x' (r1) is lesser
    
compareY:				
    cmp r0, r2			@ compare r0 & r2 ( r0 - r2 ), set condition codes
    blt compareZ		@ branch if 'less than' condition codes are set
    mov r0, r2			@ else r0 <- r2, r2 is new lesser

compareZ:
    cmp r0, r3			@ compare r0 & r3 ( r0 - r3 ), set condition codes
    blt endif			@ branch if 'less than' condition codes are set
    mov r0, r3			@ else r0 <- r3, r3 is new lesser

endif:
  	add sp, sp, #12     @ deallocate 16 bytes of stack used for local storage

	@epilogue
	ldr	fp, [sp, 0]     @ restore caller fp
    ldr	lr, [sp, 4]     @ lr
    add	sp, sp, 8       @ and sp

	bx	lr				@ branch/exchange to caller

