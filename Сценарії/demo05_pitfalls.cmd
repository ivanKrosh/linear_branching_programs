@echo off
chcp 65001 > nul
rem ============================================================
rem  Демо 5. Скорочене обчислення і типові помилки в if.
rem  Дві частини з паузою між ними - відповідь на 5б
rem  не з'являється на екрані, доки не зібрано прогноз.
rem ============================================================
cd /d "%~dp0"
set "EXE="
if exist "%~dp0..\x64\Release\Demo5_pitfalls.exe" set "EXE=%~dp0..\x64\Release\Demo5_pitfalls.exe"
if exist "%~dp0..\x64\Debug\Demo5_pitfalls.exe" set "EXE=%~dp0..\x64\Debug\Demo5_pitfalls.exe"
if not defined EXE ( echo [!] Demo5_pitfalls.exe не знайдено. Зберіть рішення: Build - Build Solution. & exit /b 1 )

echo === 5а. ^&^& і ^|^|: скільки разів буде викликано check? ===
echo.
echo ^> Demo5_pitfalls.exe logic
"%EXE%" logic
echo.
echo   check B не викликалась жодного разу - результат був відомий уже з A.
echo   Це правило мови, а не оптимізація.
pause
echo.
echo === 5б. Три помилки, які компілюються ===
echo   Прогноз: що надрукує кожен із трьох блоків?
pause
echo.
echo ^> Demo5_pitfalls.exe errors
"%EXE%" errors
echo.
echo   1: x = 0 - присвоєння. x зіпсовано, гілка не виконалась ніколи.
echo      Компілятор попередив: C4706 (рівень /W4).
echo   2: ; після if - порожня гілка, printf виконується завжди. Попередження немає.
echo   3: else належить до НАЙБЛИЖЧОГО if. Відступи компілятор не читає. Попередження немає.
pause
