	.align	  2
    .text				    // code section            

    .global main
    .type   main, %function

main:
    @prologue
    push  {fp, lr}
	add	  fp, sp, #4

    mov  r0, #5              
    bl   factorial          // call factorial function

    @epilogue
    pop {fp, pc}
