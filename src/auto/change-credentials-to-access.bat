@echo off
REM Define las variables con las credenciales de tu base de datos
set SERVER=localhost
set DATABASE=arcee
set PORT=5432
set USERNAME=postgres
set PASSWORD=12345

REM Agrega el camino a psql.exe al PATH temporalmente si no lo has hecho ya
set PATH=E:\PostgreSQL\16\bin;%PATH%

REM Establece la variable de entorno PGPASSWORD para la contraseña
set PGPASSWORD=%PASSWORD%

REM Ejecuta el comando psql con las credenciales actualizadas
psql -h %SERVER% -d %DATABASE% -p %PORT% -U %USERNAME%

REM Limpia la variable de entorno para mayor seguridad
set PGPASSWORD=
    