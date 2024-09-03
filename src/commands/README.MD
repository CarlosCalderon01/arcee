# Command list outSide PostgreSQL

| Command | Description |
| :-----: | :-----: |
| \! cls                        | Clear shell |
| \! echo %CD%                  | Actualy path |
| \! cd %USERPROFILE%\Desktop   | Change path |

# Command list inSide PostgreSQL

| Command | Description |
| :-----: | :-----: |
| \l            | list DataBase |
| \c myappstore | Select db |


# Restore & Backup

## How to create a backup:

    pg_dump -h localhost -U your_user -d nameDB > backup.sql
    
## How to create a backup and send a specific path

    \! pg_dump -h localhost -U your_user -d nameDB > %USERPROFILE%\Desktop\nameDB_backup.sql

# Comamnd for Manage PostgreSQL

## How to create a user
    
    - CREATE USER nameUser WITH PASSWORD 'passWord';

    - ALTER USER nameUser WITH PASSWORD 'newPassWord';

    - DROP USER nameUser;

## How to alter privileges

    - REVOKE ALL PRIVILEGES ON DATABASE nameDB FROM userBefore; DROP USER userBefore;

    - psql -U userAdmin -d nameDB -h localhost

## How to specific backup

    - pg_dump -h localhost -U postgres -d arcee --schema-only > src\backup\arcee_backup.sql

# Fin

# Notas para diagram.io sobre la graficación de bases de datos

## Parte 1

- **type**: tipo de índice (btree, gin, gist, hash dependiendo de la base de datos). Por ahora, solo se aceptan los tipos `btree` y `hash`.
- **name**: nombre del índice.
- **unique**: índice único.
- **pk**: clave primaria.

## Parte 2

- `<`: uno a muchos. Ejemplo: `users.id < posts.user_id`
- `>`: muchos a uno. Ejemplo: `posts.user_id > users.id`
- `-`: uno a uno. Ejemplo: `users.id - user_infos.user_id`
- `<>`: muchos a muchos. Ejemplo: `authors.id <> books.id`

## Parte 3

### Lista de configuraciones de columna que puedes usar

- **note**: `'string to add notes'`: añade una nota de metadatos a esta columna.
- **primary key** o **pk**: marca una columna como clave primaria. Para claves primarias compuestas, consulta la sección 'Índices'.
- **null** o **not null**: marca una columna como permitiendo valores nulos o no.
- **unique**: marca la columna como única.
- **default: some_value**: establece un valor predeterminado para la columna, consulta la sección 'Valor Predeterminado' a continuación.
- **increment**: marca la columna como autoincrementable.

### Nota

- Puedes usar un método alternativo para configuraciones no soportadas añadiendo el nombre de la configuración al nombre del tipo de columna, como en: 

```plaintext
id "bigint unsigned" [pk]
```
