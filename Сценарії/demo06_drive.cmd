@echo off
chcp 65001 > nul
rem ============================================================
rem  Демо 6. switch на значенні, яке повертає GetDriveTypeA.
rem  До запуску спрогнозуйте: що поверне функція для диска, якого немає?
rem ============================================================
cd /d "%~dp0"
set "EXE="
if exist "%~dp0..\x64\Release\Demo6_drive.exe" set "EXE=%~dp0..\x64\Release\Demo6_drive.exe"
if exist "%~dp0..\x64\Debug\Demo6_drive.exe" set "EXE=%~dp0..\x64\Debug\Demo6_drive.exe"
if not defined EXE ( echo [!] Demo6_drive.exe не знайдено. Зберіть рішення: Build - Build Solution. & exit /b 1 )

rem перша вільна літера диска - щоб показ не залежав від машини
set "FREE="
for %%L in (Q R S T U V W X Y Z) do if not defined FREE if not exist %%L:\ set "FREE=%%L"

echo === 6а. Звичайний switch ===
echo.
echo ^> Demo6_drive.exe C:
"%EXE%" C:
echo   ERRORLEVEL = %ERRORLEVEL%
echo.
echo ^> Demo6_drive.exe %FREE%:
"%EXE%" %FREE%:
echo   ERRORLEVEL = %ERRORLEVEL%
echo.
echo   Диска немає - але функція не повідомляє про помилку: вона повертає DRIVE_NO_ROOT_DIR (1).
echo   Три мітки поруч (NO_ROOT_DIR, UNKNOWN, default) - навмисний прохід в одну гілку.
pause
echo.
echo === 6б. Той самий switch без break ===
echo   Прогноз: що надрукує програма для C: ?
pause
echo.
echo ^> Demo6_drive.exe C: nobreak
"%EXE%" C: nobreak
echo ^> Demo6_drive.exe %FREE%: nobreak
"%EXE%" %FREE%: nobreak
echo.
echo   case - лише мітка входу. Виконання почалось з DRIVE_FIXED
echo   і пройшло всі наступні гілки до кінця switch.
pause
