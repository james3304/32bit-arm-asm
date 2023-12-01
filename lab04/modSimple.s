	.syntax unified
	.text
	.align	2
	.global	main
	.type	main, %function

main:
	@ prologue
	sub     sp, sp, 8       @ space for fp, lr 
    str     fp, [sp, 0]     @ save fp     sp + 0
    str     lr, [sp, 4]     @   and lr      sp + 4
    add     fp, sp, 4       @ set our frame pointer

	sub     sp, sp, #16		@ allocate from stack memory -> 16 bytes for local storage

	@ initialize 'local' variables
	mov		r3, #10			@ r3 <- #10
   	str		r3, [fp, #-8]   @ r3 -> to fp address with offset -8         
	mov 	r3, #12			@ r3 <- #12
	str		r3, [fp, #-12]  @ r3 -> to fp address fp with offset -12
	mov 	r3, #8			@ r3 <- #8
	str		r3, [fp, #-16] 	@ r3 -> to fp with offset -16      

	@ 'assignments'
	ldr     r1, [fp, #-8]	@ r1 <- value at address fp with offset -8
	ldr     r2, [fp, #-12]	@ r2 <- value at address fp with offset -12
	ldr     r3, [fp, #-16]  @ r3 <- value at address fp with offset -16

	@ do the addition(s)
	add     r4, r1, r2		@ r0 <- r1(10) + r2(12)
	add		r4, r4, r3		@ r0 <- r4(22) + r1(8)
	ldr 	r0, [r4]

	@ send r4 to memory
	str r4, [fp, #-20] 		@ r4 (sum) -> to fp address fp with offset -20
	ldr r0, [fp, #-20]		@ loads memory offset 

    add     sp, sp, #16 	@ deallocate 16 bytes of stack used for local storage

	@ epilogue
	ldr     fp, [sp, 0]     @ restore caller fp
    ldr     lr, [sp, 4]     @   lr
    add     sp, sp, 8       @   and sp
    bx      lr              @ return
