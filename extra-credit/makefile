all: clean extraCredit

extraCredit: playPick3Starter.s getRandom.s gameLogic.s	getNumbers.s
	gcc -g -Wall playPick3Starter.s getRandom.s gameLogic.s getNumbers.s -o extraCredit

clean:
	rm -f extraCredit