#include "xparameters.h"

#include "xgpio.h"

#define OUTPUT_DEVICE_ID XPAR_AXI_GPIO_0_DEVICE_ID



XGpio outputGpio;

int main()

{

      int outputStatus;
      outputStatus = XGpio_Initialize(&outputGpio, OUTPUT_DEVICE_ID);

     int counter_ones = 0;
     int counter_tens = 0;
     int control = 0;
     int delay_counter = 0;



      // Set the direction of the GPIO channels

      XGpio_SetDataDirection(&outputGpio, 1, 0x00000000); // Set output channel as output (32-bit width)

      XGpio_DiscreteWrite(&outputGpio, 1, 1);



      while (1)

      {
        if (counter_ones == 10)
        {
            counter_ones = 0;
            counter_tens ++;
        }

        if (control == 0)
        {
            seven_seg_update(counter_ones, control);
            control = 1;
        }
        else
        {
            seven_seg_update(counter_tens, control);
            control = 0;
        }

        MB_Sleep(1);
        delay_counter ++;

        if (delay_counter > 1)
        {
            counter_ones ++;
            delay_counter = 0;
        }

      }

      return XST_SUCCESS;

}

void seven_seg_update (int i, int control)
{
if (control == 0)
{
   switch (i)

                 {

                    case 0:

                      XGpio_DiscreteWrite(&outputGpio, 1, 0b0111111100);
                    break;

                    case 1:

                      XGpio_DiscreteWrite(&outputGpio, 1, 0b0101100000);
                    break;

                    case 2:

                      XGpio_DiscreteWrite(&outputGpio, 1, 0b0111011010);
                    break;

                    case 3:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b0111110010);
                    break;

                    case 4:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b0101100110);
                    break;

                    case 5:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b0110110110);
                    break;

                    case 6:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b0110111110);
                    break;

                    case 7:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b0111100000);
                    break;

                    case 8:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b0111111110);
                    break;

                    case 9:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b0111110110);
                    break;

                 }
}
else
{
   switch (i)

                 {

                    case 0:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1011111100);
                    break;

                    case 1:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1001100000);
                    break;

                    case 2:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1011011010);
                    break;

                    case 3:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1011110010);
                    break;

                    case 4:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1001100110);
                    break;

                    case 5:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1010110110);
                    break;

                    case 6:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1010111110);
                    break;

                    case 7:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1011100000);
                    break;

                    case 8:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1011111110);
                    break;

                    case 9:

                     XGpio_DiscreteWrite(&outputGpio, 1, 0b1011110110);
                    break;

                 }
}

}
