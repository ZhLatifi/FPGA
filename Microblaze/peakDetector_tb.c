#include <stdio.h>
#include "peakDetector.h"
#include "stdint.h"

int main()
{
	uint8_t s1=52, s2=27, s3=167, s4=252, s5=8, s6=74,
		s7=1, s8=24, s9=0, s10=19, s11=18, s12=30,
		s13=17, s14=32, s15=19, s16=9, s17=85, s18=255, s19=18, s20=18;
	uint8_t threshold = 127;

	int peaks = detectPeaks(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12,
							s13, s14, s15, s16, s17, s18, s19, s20, threshold);

	printf("Peaks' report: %d\n" , peaks);

	return 0;
}
