@echo off
chcp 65001 > nul
rem ============================================================
rem  Демо 1, розв'язка. Чому -1 не менше за strlen("")
rem  і чому len - 1 < 0 хибне для DWORD. Машинний код main, рядки 10-22.
rem ============================================================
cd /d "%~dp0"
set "LST=%~dp0..\Demo1_unsigned\x64\Debug\unsigned.asm"
if not exist "%LST%" ( echo [!] Зберіть рішення в конфігурації Debug. & exit /b 1 )

echo === if (-1 ^< strlen(""))  ·  if (len - 1 ^< 0)  ·  if (n - 1 ^< 0) ===
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%LST%" main 10 22
echo.
echo   strlen повертає size_t - беззнаковий тип. -1 перетворено на 0xFFFFFFFFFFFFFFFF,
echo   і стоїть JBE - беззнаковий перехід.
echo   len - 1 для DWORD: TEST завжди скидає CF, тому JAE виконується ЗАВЖДИ.
echo   n - 1 для int: JGE - знаковий перехід, умова працює.
echo.
echo   /W4 мовчить про обидва випадки. /Wall помічає лише другий: C4296.
pause
