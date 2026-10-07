/* Демо 6. switch на значенні, яке повертає функція WinAPI.
   Demo6_drive C:          - тип диска
   Demo6_drive C: nobreak  - той самий switch без break (прохід крізь case) */
#include <stdio.h>
#include <string.h>
#include <windows.h>

int main(int argc, char *argv[])
{
    if (argc < 2) {
        fprintf(stderr, "usage: Demo6_drive C: [nobreak]\n");
        return 2;
    }
    char root[4] = { argv[1][0], ':', '\\', 0 };
    UINT type = GetDriveTypeA(root);
    printf("%s  type = %u  ", root, type);

    if (argc > 2 && strcmp(argv[2], "nobreak") == 0) {
        switch (type) {                   /* break пропущено навмисно */
        case DRIVE_REMOVABLE: printf("removable ");
        case DRIVE_FIXED:     printf("fixed ");
        case DRIVE_REMOTE:    printf("network ");
        case DRIVE_CDROM:     printf("cd-rom ");
        default:              printf("unknown ");
        }
        printf("\n");
        return 0;
    }

    switch (type) {
    case DRIVE_REMOVABLE: printf("removable (USB)\n"); break;
    case DRIVE_FIXED:     printf("fixed disk\n");      break;
    case DRIVE_REMOTE:    printf("network drive\n");   break;
    case DRIVE_CDROM:     printf("CD/DVD\n");          break;
    case DRIVE_RAMDISK:   printf("RAM disk\n");        break;
    case DRIVE_NO_ROOT_DIR:
    case DRIVE_UNKNOWN:
    default:              printf("no such drive\n");   return 1;
    }
    return 0;
}
