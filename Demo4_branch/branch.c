/* Демо 4. Як процесор виконує if: CMP + умовний перехід.
   classify - звичайний if-else; less_s і less_u - та сама умова
   для знакових і беззнакових чисел. */
#include <stdio.h>
#include <stdlib.h>

int classify(int x)
{
    int r;
    if (x > 10)
        r = 1;
    else
        r = 2;
    return r;
}

int less_s(int a, int b)            { if (a < b) return 1; return 0; }
int less_u(unsigned a, unsigned b)  { if (a < b) return 1; return 0; }

int main(int argc, char *argv[])
{
    int x = argc > 1 ? atoi(argv[1]) : 5;
    printf("classify(%d) = %d\n", x, classify(x));
    printf("less_s(-1, 0) = %d, less_u(-1, 0) = %d\n",
           less_s(-1, 0), less_u((unsigned)-1, 0));
    return 0;
}
