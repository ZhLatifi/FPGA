#include "peakDetector.h"
#include <math.h>
#include "stdint.h"

int detectPeaks(uint8_t s1, uint8_t s2, uint8_t s3, uint8_t s4, uint8_t s5, uint8_t s6,
				uint8_t s7, uint8_t s8, uint8_t s9, uint8_t s10, uint8_t s11, uint8_t s12,
				uint8_t s13, uint8_t s14, uint8_t s15, uint8_t s16, uint8_t s17, uint8_t s18,
				uint8_t s19, uint8_t s20, uint8_t threshold)
{
	uint8_t signal[20] ={s1, s2, s3, s4, s5, s6,
					 s7, s8, s9, s10, s11, s12,
					 s13, s14, s15, s16, s17, s18, s19, s20};
	int peaks = 0x00000000;

	for(int i = 1; i < 19; i++)
	{
		if(signal[i] > threshold && signal[i] > signal[i-1] && signal[i] > signal[i+1])
		{
			peaks++;
			peaks = peaks + pow(2, (4+i));
		}
	}

	return peaks;
}
