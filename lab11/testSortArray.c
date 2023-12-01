#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
int printArray(int *array, int n);
int sortArray(int *array, int n);

int main() {
    int array[100];
    
    /* 'seed' the random number generator */
    srand((unsigned) time(0));

    for (int i = 0; i < 100; i++) {
        array[i] = rand() % 25;
    }
   
    puts("before sort:");
    printArray(array, 100);
 
    sortArray(array, 100);

    puts("after sort:");
    printArray(array, 100);

    return (0);
}