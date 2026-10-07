@echo off
chcp 65001 > nul
rem ============================================================
rem  Демо 7. Як компілятор реалізує switch.
rem  До показу спрогнозуйте: чи однаковий машинний код у двох функцій
rem  з однаковою будовою, але різними значеннями case?
rem ============================================================
cd /d "%~dp0"
set "EXE="
if exist "%~dp0..\x64\Release\Demo7_jumptable.exe" set "EXE=%~dp0..\x64\Release\Demo7_jumptable.exe"
if exist "%~dp0..\x64\Debug\Demo7_jumptable.exe" set "EXE=%~dp0..\x64\Debug\Demo7_jumptable.exe"
if not defined EXE ( echo [!] Demo7_jumptable.exe не знайдено. Зберіть рішення: Build - Build Solution. & exit /b 1 )
set "DBG=%~dp0..\Demo7_jumptable\x64\Debug\jumptable.asm"
set "REL=%~dp0..\Demo7_jumptable\x64\Release\jumptable.asm"
if not exist "%REL%" set "REL=%DBG%"

echo ^> Demo7_jumptable.exe 3 / 5 / 32
echo.
"%EXE%" 3
"%EXE%" 5
"%EXE%" 32
echo.
pause
echo.
echo === 7а. day_name: case 0..6 - як вибирається гілка ===
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%REL%" day_name 9 9
echo.
echo   Одна перевірка діапазону (JA відсікає і від'ємні числа) і один непрямий JMP
echo   за адресою з таблиці. Час вибору не залежить від кількості case.
pause
echo.
echo === 7б. code_name: case 2, 5, 32, 112, 1223 ===
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%REL%" code_name 23 23
echo.
echo   Таблиця на 1224 елементи заради п'яти гілок - марнотратство.
echo   Тому тут ланцюжок CMP / JE - такий самий, як для if - else if.
pause
echo.
echo === 7в. day_name у збірці Debug (/Od) ===
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%DBG%" day_name 9 9
echo.
echo   Таблиця переходів є навіть без оптимізації: спосіб залежить від значень case.
pause
