/* Демо 1. Знакові й беззнакові числа в умові.
   Гачок заняття: дві умови, які «очевидно» істинні, виявляються хибними.
   Розв'язка - у вікні Disassembly або в demo01_answer.cmd. */
#include <stdio.h>
#include <string.h>
#include <windows.h>

int main(void)
{
    if (-1 < strlen(""))
        printf("-1 < strlen(\"\"): yes\n");
    else
        printf("-1 < strlen(\"\"): no\n");

    DWORD len = 0;                 /* скільки байт прочитано */
    if (len - 1 < 0)
        printf("DWORD: len - 1 < 0\n");
    else
        printf("DWORD: len - 1 = %lu\n", len - 1);

    int n = 0;
    if (n - 1 < 0)
        printf("int:   n - 1 < 0\n");
    return 0;
}
