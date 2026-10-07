/* Демо 3. 1) Ctrl+F5 і F5: програма знає про налагоджувач.
   2) Умовна точка зупину: F9 на рядку sum += ..., Conditions: i == 7.
   3) Set Next Statement: F9 на рядку 9, F5, стрілку - на рядок 12. */
#include <stdio.h>
#include <windows.h>

int main(void)
{
    if (IsDebuggerPresent())
        printf("Debugger found: verbose mode\n");
    else
        printf("No debugger: normal mode\n");

    int sum = 0;
    for (int i = 1; i <= 10; i++)
        sum += i * i;
    printf("sum = %d\n", sum);
    return 0;
}
