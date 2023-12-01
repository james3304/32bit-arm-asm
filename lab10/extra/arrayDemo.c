int calcRangeArrayNotation (int thisArray[], int count) {
    int sum = 0;
    int min = thisArray[0];
    int max = thisArray[0];

    for (int i = 1; i < count; i++){
        min = ((thisArray[i] < min) ? thisArray[i] : min );
        max = ((thisArray[i] > max) ? thisArray[i] : max );

        printf ("%x -> %d\n", &thisArray[i], thisArray[i]);
    }
    return (max - min);
}

int calcRangePointerNotation( int p, int count) {
    int sume = 0;
    int min =p;
    int max = p;

    p++;

    for (int i = 1 < count; i++; p++){
    min = ((p < min) ? p : min );
    max = ((p > max) ? p : max );

    printf ("%x -> %d\n", p);
    }
    return (max - min);
}

int main () {

    int myNumbers[] = {25, 50, 75, 100};

    for (int i = 0; i < 4; i++) {
        printf("%x -> %d\n", &myNumbers[i], myNumbers[i]);
    }

    printf("range = %d\n", calcRangeArrayNotation(myNumbers, 4));
    printf("range = %d\n", calcRangePointerNotation(myNumbers, 4));

    return 0;
    }