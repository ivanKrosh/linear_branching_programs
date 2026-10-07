@echo off
chcp 65001 > nul
rem ============================================================
rem  Демо 3. Програма знає про налагоджувач.
rem  Тут - запуск без налагоджувача. Потім у Visual Studio:
rem  Demo3_debugger - Set as Startup Project - F5.
rem ============================================================
cd /d "%~dp0"
set "EXE="
if exist "%~dp0..\x64\Release\Demo3_debugger.exe" set "EXE=%~dp0..\x64\Release\Demo3_debugger.exe"
if exist "%~dp0..\x64\Debug\Demo3_debugger.exe" set "EXE=%~dp0..\x64\Debug\Demo3_debugger.exe"
if not defined EXE ( echo [!] Demo3_debugger.exe не знайдено. Зберіть рішення: Build - Build Solution. & exit /b 1 )

echo ^> Demo3_debugger.exe
echo.
"%EXE%"
echo.
echo   Тепер запустіть той самий проєкт у Visual Studio клавішею F5
echo   Якщо вікно консолі закривається одразу - поставте точку зупину (F9) на return 0.
echo   Перший рядок буде інший: IsDebuggerPresent поверне TRUE.
pause
