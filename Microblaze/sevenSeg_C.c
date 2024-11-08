#include "xparameters.h"
#include "xgpio.h"
#define OUTPUT_DEVICE_ID XPAR_AXI_GPIO_0_DEVICE_ID

XGpio outputGpio;
int main()
{
	int outputStatus;
	outputStatus = XGpio_Initialize(&outputGpio, OUTPUT_DEVICE_ID);

	// Set the direction of the GPIO channels
	XGpio_SetDataDirection (&outputGpio, 1, 0x00000000); // Set output channel as output (32-bit width)
	XGpio_DiscreteWrite(&outputGpio, 1, 1);

	while (1)
	{
		for (int i = 0; i < 10; i ++)
		{
		     switch (i)
		      {
		         case 0:
				 XGpio_DiscreteWrite(&outputGpio, 1, 0b11111100);
				 MB_Sleep(1);
		         break;

		         case 1:
				 XGpio_DiscreteWrite(&outputGpio, 1, 0b01100000);
				 MB_Sleep(1);
		         break;

		         case 2:
				 XGpio_DiscreteWrite(&outputGpio, 1, 0b11011010);
				 MB_Sleep(1);
		         break;

		         case 3:
				 XGpio_DiscreteWrite(&outputGpio, 1, 0b11110010);
				 MB_Sleep(1);
		         break;

		         case 4:
				 XGpio_DiscreteWrite(&outputGpio, 1, 0b01100110);
				 MB_Sleep(1);
		         break;

		         case 5:
			     XGpio_DiscreteWrite(&outputGpio, 1, 0b10110110);
				 MB_Sleep(1);
		         break;

		         case 6:
				 XGpio_DiscreteWrite(&outputGpio, 1, 0b10111110);
				 MB_Sleep(1);
		         break;

		         case 7:
			     XGpio_DiscreteWrite(&outputGpio, 1, 0b11100000);
			     MB_Sleep(1);
		         break;

		         case 8:
			     XGpio_DiscreteWrite(&outputGpio, 1, 0b11111110);
			     MB_Sleep(1);
		         break;

		         case 9:
		         XGpio_DiscreteWrite(&outputGpio, 1, 0b11110110);
		         MB_Sleep(1);
		         break;
		      }

		}

	}

	return XST_SUCCESS;
}



