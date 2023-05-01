// Author: Elton Chang
// A program that reads a series of positive integers from stdin and prints out a histogram. 

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BINS 16

int main() {
    int bins[MAX_BINS] = {0}; // initialize bins to zero
    int bin_size = 1;
    int range = 16;
    int num;

    printf("%d bins of size %d for range [0,%d)\n", MAX_BINS, bin_size, range);

    while (scanf("%d", &num) != EOF) {
        // ignore negative numbers
        if (num < 0) {
            continue;
        }

        // check if number is within range
        while (num >= range) {
            // double bin size and range
            bin_size *= 2;
            range *= 2;

            // print new histogram details
            if (bin_size * MAX_BINS > range) {
                // reduce the number of bins if we exceed MAX_BINS
                bin_size *= 2;
            }
            printf("%d bins of size %d for range [0,%d)\n", MAX_BINS, bin_size, range);

            // compress current 16 bins into first 8 bins
            for (int i = 0; i < MAX_BINS / 2; i++) {
                bins[i] = bins[i*2] + bins[i*2 + 1];
                bins[i*2 + 1] = 0;
            }
        }

        // find the bin the number belongs to
        int bin = num / bin_size;

        // increment the bin count
        bins[bin]++;
    }

    // print the histogram
    for (int i = 0; i < MAX_BINS; i++) {
        int low = i * bin_size;
        int high = low + bin_size - 1;
        printf("[%3d:%3d] ", low, high);

        // print the histogram bar
        for (int j = 0; j < bins[i]; j++) {
            printf("*");
        }
        printf("\n");
    }

    return 0;
}

