@echo off
title Menú de Scripts
:inicio
cls
echo ===============================
echo          Menú de Scripts
echo ===============================
echo.
echo 1. Ejecutar Script (connection) 1
echo 2. Ejecutar Script (backup of arcee) 2
echo 3. Ejecutar Script (do nothing) 3
echo 4. Salir
echo.
set /p opcion=Selecciona una opción (1-4): 

if "%opcion%"=="1" goto ejecutar1
if "%opcion%"=="2" goto ejecutar2
if "%opcion%"=="3" goto ejecutar3
if "%opcion%"=="4" goto salir

echo Opción no válida. Inténtalo de nuevo.
pause
goto inicio

:ejecutar1
echo Ejecutando Script 1...
call src\custom\1_connection.bat
pause
goto inicio

:ejecutar2
echo Ejecutando Script 2...
call src\custom\gen_backup.bat
pause
goto inicio

:ejecutar3
echo Ejecutando Script 3...
REM Aquí puedes colocar el comando para ejecutar tu script 3
REM Por ejemplo: call script3.bat
pause
goto inicio

:salir
echo Saliendo...
pause
exit
