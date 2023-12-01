all: clean searchArray

searchArray: testSearch.c searchArray.s toLower.s
	gcc -g -Wall testSearch.c searchArray.s toLower.s -o testSearch

clean:
	rm -f searchArray
