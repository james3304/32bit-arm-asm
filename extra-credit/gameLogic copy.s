	.syntax unified
	.align	2
	.text
	.global	gameLogic
	.type	gameLogic, %function

gameLogic:
	//prologue
    push {r5, r6, r8, r9, fp, lr}
    add fp, sp, #12	

compareLoop:
	bl	getRandom
	ldr r1, [r5]
	cmp r0, r1		//compares random number and player num
	bne gameLoss	//if not equal, send to gameLoss

pickMatched:
	add r6, r6, 1	//loop that keeps track of how many correct numbers in a row
	cmp r6, #3		//there are. if 3 matches occur, r6 sends program to gameWon
	beq gameWon		//where we reset r6 to 0 and call the gameWon value from memory
	
	add r5, r5, #4	//iterate r5 to the next pick in memory when r6 != 3
	b compareLoop

gameWon:
	mov r6, #0			// reset correct guess counter
	ldr r7, [fp, #-4]	// keeps gamesWon in memory
	add r7, r7, #1
	str r7, [fp, #-4] 	// increments and stores gamesWon
	sub r5, r5, #8		// resets the address in r5 back to the top of array
	b totalGames 		// sends to game counter

gameLoss:
	mov r6, #0			// reset correct guess counter 
	ldr r8, [fp, #-8]	// keeps gamesLoss in memory
	add r8, r8, #1
	str r8, [fp, #-8]	// increments and stores gamesLoss
	b totalGames		// sends to game counter 

totalGames:
	mov r8, #0			// makes sure r8 is 0 for math
	ldr r0, [fp, #-4]	// load games won from memory
	ldr r1, [fp, #-8]	// load games lost from memory
	ldr r9, =10000		// total amount of games we want to play
	add r8, r0, r1
	cmp r8, r9			// totalGames > 10000, branch to compare loop
	blt compareLoop
	str r8, [fp, #-12]	//if totalgames = 10000, store total at fp-12

endOfLoop:
    sub r1, fp, 12		//pass address of fp-12 (top of array) in r1 back to main
    
    sub fp, sp, #12
    pop	{r5, r6, r8, r9, fp, lr}
	bx lr