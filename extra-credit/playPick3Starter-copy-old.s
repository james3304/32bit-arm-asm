	.syntax unified
	.align	2
    .section    .rodata
totalWon:
    .asciz "Total Won: %d\n"

totalLost:
    .asciz "Total Lost: %d\n"

totalPlayed:
    .asciz "Total played: %d\n"

moneyWon:
    .asciz "Money won: $%d\n"

moneyLost:
    .asciz "Money lost: $%d\n Not worth it."
	.text
	.global	main
	.type	main, %function

main:
	//prologue
    push {fp, lr}
	add fp, sp, #20

	mov r0, #1
	str r0, [fp, #-4]	//first pick

	mov r0, #5
	str r0, [fp, #-8]	//second pick

	mov r0, #3
	str r0, [fp, #-12]	//thrid pick

	sub r5, fp, 12		//store top of array in r5

	mov r0, #0		//seed for time function
	bl	time        //make sure mov r0, #0 comes before time
	bl	srand
	
	bl gameLogic 	// returns fp -12 in r1, which is the top of the array
	mov r7, r0
	mov r8, r1
	mov r9, r2

	mov r1, r7
	ldr r0, =totalWon	//prints (games won)
	bl printf
	
	mov r1, r8
	ldr r0, =totalLost	//prints (games lost)
	bl printf

	mov r1, r9
	ldr r0, =totalPlayed//print (total games)
	bl printf

	mov r1, r7
	ldr r2, =499
	mul r1, r1, r2
	ldr r0, =moneyWon
	bl printf

	mov r1, r8
	ldr r0, =moneyLost
	bl printf

	//prologue
	sub fp, sp, #20
	pop	{fp, lr}
    bx  lr