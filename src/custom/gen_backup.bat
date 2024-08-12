@echo off
REM Configuración de la base de datos
set SERVER=localhost
set DATABASE=arcee
set PORT=5432
set USERNAME=postgres
set PASSWORD=2956939xD

REM Ruta de la copia de seguridad
set BACKUP_PATH=src\backup\arcee_backup.sql

REM Exportar la base de datos a un archivo SQL
echo Realizando copia de seguridad de la base de datos %DATABASE%...
set PGPASSWORD=%PASSWORD%
"E:\PostgreSQL\16\bin\pg_dump.exe" -h %SERVER% -p %PORT% -U %USERNAME% -F p -d %DATABASE% -f %BACKUP_PATH%

if %ERRORLEVEL% equ 0 (
    echo Copia de seguridad completada exitosamente.
) else (
    echo Error al realizar la copia de seguridad.
)

REM Limpiar la variable de la contraseña
set PGPASSWORD=

pause
