/* Демо 7. Як компілятор реалізує switch.
   day_name  - щільні значення 0..6: таблиця переходів;
   code_name - розріджені значення (коди помилок Windows): ланцюжок порівнянь. */
#include <stdio.h>
#include <stdlib.h>

const char *day_name(int d)           /* щільні значення 0..6 */
{
    switch (d) {
    case 0: return "Mon";
    case 1: return "Tue";
    case 2: return "Wed";
    case 3: return "Thu";
    case 4: return "Fri";
    case 5: return "Sat";
    case 6: return "Sun";
    default: return "?";
    }
}

const char *code_name(int c)          /* розріджені значення */
{
    switch (c) {
    case 2:    return "FILE_NOT_FOUND";
    case 5:    return "ACCESS_DENIED";
    case 32:   return "SHARING_VIOLATION";
    case 112:  return "DISK_FULL";
    case 1223: return "CANCELLED";
    default:   return "?";
    }
}

int main(int argc, char *argv[])
{
    int v = argc > 1 ? atoi(argv[1]) : 3;
    printf("day_name(%d) = %s, code_name(%d) = %s\n", v, day_name(v), v, code_name(v));
    return 0;
}
