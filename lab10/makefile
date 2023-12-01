all: clean arrayDemo

arrayDemo: arrayDemo.s maxArray.s minArray.s sumArray.s printArray.s doubleValues.s
	gcc -g -Wall arrayDemo.s maxArray.s minArray.s sumArray.s printArray.s doubleValues.s -o arrayDemo

clean:
	rm -f arrayDemo