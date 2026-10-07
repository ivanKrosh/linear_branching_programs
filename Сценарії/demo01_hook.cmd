@echo off
chcp 65001 > nul
rem ============================================================
rem  Демо 1. Гачок заняття: дві «очевидні» умови.
rem  До запуску подивіться код і спрогнозуйте:
rem  чи менше -1 за довжину порожнього рядка? чи менше 0 - 1 за нуль?
rem ============================================================
cd /d "%~dp0"
set "EXE="
if exist "%~dp0..\x64\Release\Demo1_unsigned.exe" set "EXE=%~dp0..\x64\Release\Demo1_unsigned.exe"
if exist "%~dp0..\x64\Debug\Demo1_unsigned.exe" set "EXE=%~dp0..\x64\Debug\Demo1_unsigned.exe"
if not defined EXE ( echo [!] Demo1_unsigned.exe не знайдено. Зберіть рішення: Build - Build Solution. & exit /b 1 )

echo ^> Demo1_unsigned.exe
echo.
"%EXE%"
echo.
echo   Для int усе гаразд. Для strlen і DWORD - обидві умови хибні.
echo   Чому - наприкінці заняття, у demo01_answer.cmd.
pause
