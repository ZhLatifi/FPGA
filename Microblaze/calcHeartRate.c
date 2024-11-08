#include "calcHeartRate.h"
#include <math.h>

int calcHeartRate(int peaks, int fs) {
    int rSum = 0;
    int i, k;
    int j = 0;
    int rPeaks[2];
    int num = peaks & 0x0000000F;

    for(i = 1; i < 19; i++)
    {
    	if(((int)peaks & (int)pow(2, (4 + i))) != 0)
    	{
    		rPeaks[j] = i;
    		j++;
    	}
    }

    for (k = 1; k < num; k++) {
        rSum += rPeaks[k] - rPeaks[k - 1];
    }

    float avgRRInterval = (float)rSum / (num - 1);
    int heartRate = fs / avgRRInterval * 60;

    return heartRate;
}
