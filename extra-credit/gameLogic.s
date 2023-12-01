	.syntax unified
	.align	2
	.text
	.global	gameLogic
	.type	gameLogic, %function
//r4 = holder for top of array
//r5 = top of array
//r6 = win LCV
//r7 = win counter
//r8 = lose counter
//r9 = total counter
gameLogic:
	//prologue
    push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov r4, r5
compareLoop:
	bl	getRandom
	ldr r1, [r5]
	cmp r0, r1		//compares random number and player num
	bne gameLoss	//if not equal, send to gameLoss

gameWon:
	add r5, r5, #4
	add r6, r6, #1
	cmp r6, #3
	blt compareLoop

	mov r5, r4		//reset to top of array
	mov r6, #0		//reset win LCV
	add r7, r7, #1
	b totalGames 	//sends to game counter

gameLoss:
	mov r5, r4		//reset to top of array
	mov r6, #0		//reset win LCV
	add r8, r8, #1
	b totalGames	// sends to game counter 

totalGames:
	ldr r0, =10000		// total amount of games we want to play
	add r9, r7, r8
	cmp r9, r0		// totalGames > 10000, branch to compare loop
	blt compareLoop

endOfLoop:
	mov r0, r7			//pass wins in r0
	mov r1, r8			//pass loses in r1
	mov r2, r9			//pass total in r2
    
	//epilogue
    pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr