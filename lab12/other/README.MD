<!-- COSC2425 : Lab12 - Array Searching

For this - the FINAL lab - you will be building a array search application. one of the most important and time consuming operations computer perform are searches. So, this is a very important topic to study. 

For this application, we will be writing a binary search algorithm - that is faster and more effiicent than what your compiler will produce. In other words, we will be writing an optimized assembler search function - one that will improve upon the assembler code that a c compiler would produce.

We'll accomplish this by doing most of the search/selection code on the CPU, thus avoiding thousands of trips up and down the address / data busses. In other words, our code well be better than c compiler produced code.  

Specifically: -->

The lab includes a list of 5,195 5 character words used as a dictionary for the popular WORDL game. The list of words - found in the file wordlSorted.txt is pre-sorted, which is needed to perform a proper binary search of a target word in the lists of words.

There is also a file binarySearchpseudocode.txt which present a common algorithm to perform binary search. You should pattern your algorithm in ARM32 assembler after this algorithm.

You also provided a "tester/driver" program, written in c that will load the words into an array that your search algorithm will search.

Additionally, you are provided with a makefile that assumes that you will provide 2 pieces of source code - both written in ARM32 assembler. 

The first is a toLower function. Since all of the words in the list are lower case, but the could enter an uppercase search word, you should convert and uppercase characters to lowercase - so that the search word is 'normalized'.

The second function you are to write is the actual search algorithm - in ARM32 assembler. You should strive to make this algorithm as fast and as effiicent as possible. Binary Search is a very efficient search algorithm to be used here.

Good Luck !
