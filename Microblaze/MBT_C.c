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
		XGpio_DiscreteWrite(&outputGpio, 1, 1);
		MB_Sleep(1);

		XGpio_DiscreteWrite(&outputGpio, 1, 0);
		MB_Sleep(1);

	}

	return XST_SUCCESS;
}
