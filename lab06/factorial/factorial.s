.align	  2
.text				            // code section            

.global factorial			
.type   factorial, %function

factorial:
    @prologue
    push    {r4, r5, fp, lr}
	add	    fp, sp, #4

    mov r4, r0              // r4 <- r0, our Loop Control Variable (LCV)
    mov r5, #1              // r5 <- #1

topOfLoop:

    mul r5, r5, r4          // r5 <- r5 * r4

    sub r4, r4, #1          // decrement LCV
	cmp r4, #0              // if LCV > 0
    bgt topOfLoop           //    branch topOfLoop

    mov r0, r5

end:
    @epilogue
    pop {r4, r5, fp, pc}

