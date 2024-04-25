#include <REG51.h>
#include <stdio.h>
// buzzer
sbit buzzer1 = P3 ^ 0;
void delay(int count);
void main()
{
    P3 = 0x00;
    while (1)
    {
        delay(100);
        buzzer1 = 1;
    }
}
void delay(int count)
{
    int i, j;
    for (i = 0; i < count; i++)
        ;
    for (j = 0; j < 113; j++)
        ;
}
