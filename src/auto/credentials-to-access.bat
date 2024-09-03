@echo off
REM Define las variables con las credenciales de tu base de datos
set SERVER=localhost
set DATABASE=arcee
set PORT=5432
set USERNAME=postgres
set PASSWORD=2956939xD

REM Agrega el camino a psql.exe al PATH temporalmente
set PATH=E:\PostgreSQL\16\bin;%PATH%

REM Establece la variable de entorno PGPASSWORD para la contraseña
set PGPASSWORD=%PASSWORD%

REM Ejecuta el comando psql con las credenciales
psql -h %SERVER% -d %DATABASE% -p %PORT% -U %USERNAME%

REM Limpia la variable de entorno para mayor seguridad
set PGPASSWORD=
