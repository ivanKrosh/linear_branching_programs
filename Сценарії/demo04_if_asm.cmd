@echo off
chcp 65001 > nul
rem ============================================================
rem  Демо 4. Як процесор виконує if.
rem  До показу спрогнозуйте: для умови x > 10 компілятор поставить
rem  команду JG («більше») чи якусь іншу?
rem ============================================================
cd /d "%~dp0"
set "EXE="
if exist "%~dp0..\x64\Release\Demo4_branch.exe" set "EXE=%~dp0..\x64\Release\Demo4_branch.exe"
if exist "%~dp0..\x64\Debug\Demo4_branch.exe" set "EXE=%~dp0..\x64\Debug\Demo4_branch.exe"
if not defined EXE ( echo [!] Demo4_branch.exe не знайдено. Зберіть рішення: Build - Build Solution. & exit /b 1 )
set "DBG=%~dp0..\Demo4_branch\x64\Debug\branch.asm"
set "REL=%~dp0..\Demo4_branch\x64\Release\branch.asm"

echo ^> Demo4_branch.exe 5
"%EXE%" 5
echo ^> Demo4_branch.exe 42
"%EXE%" 42
echo.
pause
echo.
echo === 4а. classify: if (x ^> 10) r = 1; else r = 2;   (Debug, /Od) ===
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%DBG%" classify
echo.
echo   Умова інвертована: у коді x ^> 10, у машинному коді JLE.
echo   Компілятор ПЕРЕСТРИБУЄ гілку if, коли умова хибна. else коштує ще одного JMP.
pause
echo.
echo === 4б. less_s (int) і less_u (unsigned): та сама умова a ^< b ===
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%DBG%" less_s
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%DBG%" less_u
echo.
echo   int - JGE (знаковий перехід), unsigned - JAE (беззнаковий).
echo   Для процесора -1 і 4294967295 - ті самі біти FFFFFFFF. Різницю робить лише команда.
pause
echo.
echo === 4в. classify у збірці Release (/O2) ===
echo.
if not exist "%REL%" ( echo [!] Зберіть рішення в конфігурації Release. & pause & exit /b 0 )
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%REL%" classify
echo.
echo   Жодного переходу: SETLE записує результат умови в AL, INC робить з нього 1 або 2.
echo   if у коді - це опис логіки, а не наказ процесору «перейди».
pause
