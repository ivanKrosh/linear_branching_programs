@echo off
chcp 65001 > nul
rem ============================================================
rem  Демо 2. Лінійна програма очима процесора.
rem  Покроково - у Visual Studio: F9 на рядку int total, F5, далі F10.
rem  Тут - вивід програми і машинні команди рядків 8-10.
rem ============================================================
cd /d "%~dp0"
set "EXE="
if exist "%~dp0..\x64\Release\Demo2_linear.exe" set "EXE=%~dp0..\x64\Release\Demo2_linear.exe"
if exist "%~dp0..\x64\Debug\Demo2_linear.exe" set "EXE=%~dp0..\x64\Debug\Demo2_linear.exe"
if not defined EXE ( echo [!] Demo2_linear.exe не знайдено. Зберіть рішення: Build - Build Solution. & exit /b 1 )
set "LST=%~dp0..\Demo2_linear\x64\Debug\linear.asm"

echo ^> Demo2_linear.exe
echo.
"%EXE%"
echo.
pause
echo.
echo === Рядки 8-10: h, m, s  (збірка Debug, /Od) ===
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0show_asm.ps1" "%LST%" main 8 10
echo.
echo   Один рядок C - кілька команд. Частку і остачу дає ОДНА команда IDIV:
echo   частка - в EAX, остача - в EDX. Жодного переходу: команди йдуть підряд.
pause
