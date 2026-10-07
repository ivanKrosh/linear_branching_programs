/* Демо 2. Лінійна програма: покрокове виконання і вікно Disassembly.
   Поставте точку зупину (F9) на рядку з total і йдіть кроками F10. */
#include <stdio.h>

int main(void)
{
    int total = 10000;             /* секунд роботи процесу */
    int h = total / 3600;
    int m = total % 3600 / 60;
    int s = total % 60;
    printf("Uptime: %d s\n", total);
    printf("= %02d:%02d:%02d\n", h, m, s);
    return 0;
}