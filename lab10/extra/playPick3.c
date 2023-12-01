#include <stdlib.h>
#include <time.h>

int getRandom (int range);

int main () {
    time_t t;

    int pick[3];
    int ball[3];
    int gamesWon = 0;
    int gamesLost = 0;

    //Intializes random number generator
    srand((unsigned) time(&t));

    printf("enter your picks: ");
    scanf("%d %d %d", &pick[0], &pick[1], &pick[2]);

    for (int i = 0 ; i < 1000 ; i++) {

        for (int j = 0 ; j < 3; j++) {
            ball[j] = getRandom(9);
        }

        if ((pick[0] == ball[0]) && (pick[1] == ball[1]) && (pick[2] == ball[2])) {
            gamesWon += 1;
        } else {
            gamesLost += 1;
        }
    }
    printf ("games won = %d\n", gamesWon);
    printf ("games lost = %d\n", gamesLost);
    printf ("money wagered = %d\n", (gamesWon + gamesLost) * 1);
    printf ("money won = %d\n", (gamesWon *500));

    printf ("money net = %d\n", (gamesWon *500) - ((gamesWon + gamesLost) * 1));

    return 0;
}