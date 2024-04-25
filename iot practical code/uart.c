#include <reg51.h> /* Include x51 header file */

void UART_Init()
{
    TMOD = 0x20;
    TH1 = 0xFD;
    SCON = 0x50;
    TR1 = 1;
}

void Transmit_data(char tx_data)
{
    SBUF = tx_data;
    while (TI == 0)
        ;
    TI = 0;
}

void String(char *str)
{
    int i;
    for (i = 0; str[i] != 0; i++)
    {
        Transmit_data(str[i]);
    }
}

void main()
{
    UART_Init();
    String("test");
    while (1)
        ;
}
