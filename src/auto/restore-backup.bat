@echo off
REM Configuración de la base de datos
set SERVER=localhost
set DATABASE=arcee
set PORT=5432
set USERNAME=postgres
set PASSWORD=2956939xD

REM Ruta de la copia de seguridad
set BACKUP_PATH=src\backup\arcee_backup.sql

REM Crear la base de datos si no existe
REM Default_Paht: C:\Program Files\PostgreSQL\15\bin\psql.exe"
REM special_Paht: E:\PostgreSQL\16\bin\pg_dump.exe
echo Creando la base de datos %DATABASE% si no existe...
set PGPASSWORD=%PASSWORD%
"C:\Program Files\PostgreSQL\15\bin\psql.exe" -h %SERVER% -p %PORT% -U %USERNAME% -c "CREATE DATABASE %DATABASE%"


if %ERRORLEVEL% equ 0 (
    echo Base de datos %DATABASE% creada exitosamente.
) else (
    echo Error al crear la base de datos o la base de datos ya existe.
)

REM Restaurar la base de datos desde la copia de seguridad
echo Restaurando la base de datos desde %BACKUP_PATH%...
"C:\Program Files\PostgreSQL\15\bin\psql.exe" -h %SERVER% -p %PORT% -U %USERNAME% -d %DATABASE% -f %BACKUP_PATH%

if %ERRORLEVEL% equ 0 (
    echo Base de datos restaurada exitosamente.
) else (
    echo Error al restaurar la base de datos.
)

REM Limpiar la variable de la contraseña
set PGPASSWORD=

pause
