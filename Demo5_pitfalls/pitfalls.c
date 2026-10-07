/* Демо 5. Скорочене обчислення && та || і типові помилки в if.
   Перш ніж запускати, спрогнозуйте вивід кожного блоку.
   Demo5_pitfalls         - усі чотири блоки
   Demo5_pitfalls logic   - лише блок 4: && і ||
   Demo5_pitfalls errors  - лише блоки 1-3: помилки в if */
#include <stdio.h>
#include <string.h>

static int check(const char *name, int result)
{
    printf("  check %s -> %d\n", name, result);
    return result;
}

static void logic(void)
{
    printf("4: && with first = 0\n");
    if (check("A", 0) && check("B", 1))
        printf("  both true\n");
    printf("4: || with first = 1\n");
    if (check("A", 1) || check("B", 1))
        printf("  at least one true\n");
}

static void errors(void)
{
    int x = 7;

    if (x = 0)                         /* 1: присвоєння замість порівняння */
        printf("1: x is zero\n");
    printf("1: x = %d\n", x);

    x = 3;
    if (x > 5);                        /* 2: крапка з комою після умови */
        printf("2: x > 5 ?\n");

    int a = 1, b = 0;
    if (a)                             /* 3: до якого if належить else? */
        if (b)
            printf("3: a and b\n");
    else
        printf("3: else branch\n");
}

int main(int argc, char *argv[])
{
    const char *part = argc > 1 ? argv[1] : "";
    if (strcmp(part, "logic") != 0)
        errors();
    if (strcmp(part, "errors") != 0)
        logic();
    return 0;
}
