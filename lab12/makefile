all: clean searchArray

searchArray: testSearch.s searchArray.s toLower.s
	gcc -g -Wall testSearch.s searchArray.s toLower.s -o testSearch

clean:
	rm -f searchArray
