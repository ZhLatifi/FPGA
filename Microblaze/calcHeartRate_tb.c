#include <stdio.h>
#include "calcHeartRate.h"

int main()
{

	int peaks = 0x00200082;
	int fs = 20;

	int heartRate = calcHeartRate(peaks, fs);

    printf("Heart rate: %d BPM\n", heartRate);

    return 0;
}
