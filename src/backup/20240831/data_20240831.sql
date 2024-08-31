PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "_prisma_migrations" (
    "id"                    TEXT PRIMARY KEY NOT NULL,
    "checksum"              TEXT NOT NULL,
    "finished_at"           DATETIME,
    "migration_name"        TEXT NOT NULL,
    "logs"                  TEXT,
    "rolled_back_at"        DATETIME,
    "started_at"            DATETIME NOT NULL DEFAULT current_timestamp,
    "applied_steps_count"   INTEGER UNSIGNED NOT NULL DEFAULT 0
);
INSERT INTO _prisma_migrations VALUES('ee132e46-b575-4234-946b-1281e1f4e859','89420a3af6347379aca556d600f9a0a54f7e337828279a8d86ddcf9bf0c4c20f',1724826051331,'20240828021904_init',NULL,NULL,1724826050893,1);
INSERT INTO _prisma_migrations VALUES('289ee446-4ff5-435b-bb4c-0a93bf68549c','f1f355f2820f0c14ab1d16267a17729bd2aedf8dfe701c58338b13c25eefc13a',1724826053449,'20240828062051_init',NULL,NULL,1724826051659,1);
CREATE TABLE IF NOT EXISTS "accounts" (
  "id" integer PRIMARY KEY NOT NULL,
  "email" "character varying(64)" UNIQUE NOT NULL,
  "password_hash" text NOT NULL,
  "verified_account" boolean,
  "verified_user" boolean,
  "updated_at" timestamp,
  "created_at" timestamp
);
CREATE TABLE IF NOT EXISTS "admins" (
  "id" integer PRIMARY KEY NOT NULL,
  "num_id" "character varying(32)" UNIQUE NOT NULL,
  "nick_name" "character varying(16)" UNIQUE NOT NULL,
  "first_name" "character varying(32)" NOT NULL,
  "last_name" "character varying(32)" NOT NULL,
  "birth_date" date,
  "home_address" "character varying(64)",
  "postal_code" "character varying(8)",
  "cell_phone" "character varying(16)",
  "home_phone" "character varying(16)",
  "updated_at" timestamp,
  "created_at" timestamp
);
CREATE TABLE IF NOT EXISTS "businesses" (
  "id" integer PRIMARY KEY NOT NULL,
  "account_id" integer NOT NULL,
  "country_id" integer NOT NULL,
  "state_id" integer NOT NULL,
  "city_id" integer NOT NULL,
  "name" "character varying(20)",
  "vision" "character varying(256)",
  "mission" "character varying(256)",
  "motto" "character varying(256)",
  "postal_code" "character varying(10)",
  "cell_phone" "character varying(20)",
  "home_phone" "character varying(20)",
  "updated_at" timestamp,
  "created_at" timestamp
);
CREATE TABLE IF NOT EXISTS "countries" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" "character varying(32)" UNIQUE NOT NULL,
  "iso3166_2" "character varying(2)" UNIQUE NOT NULL,
  "iso3166_3" "character varying(3)" UNIQUE NOT NULL,
  "num_code" integer UNIQUE NOT NULL,
  "phone_code" "character varying(8)" NOT NULL
);
CREATE TABLE IF NOT EXISTS "states" (
  "id" integer PRIMARY KEY NOT NULL,
  "country_id" integer NOT NULL,
  "name" "character varying(32)" NOT NULL
);
CREATE TABLE IF NOT EXISTS "cities" (
  "id" integer PRIMARY KEY NOT NULL,
  "state_id" integer NOT NULL,
  "name" "character varying(64)" NOT NULL
);
CREATE TABLE IF NOT EXISTS "genders" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" "character varying(8)" UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS "genders_by_languages" (
  "id" integer PRIMARY KEY NOT NULL,
  "language_id" integer NOT NULL,
  "genders_id" integer NOT NULL,
  "name" "character varying(16)" NOT NULL
);
CREATE TABLE IF NOT EXISTS "holidays_by_countries" (
  "id" integer PRIMARY KEY NOT NULL,
  "country_id" integer NOT NULL,
  "language_id" integer NOT NULL,
  "holiday_date" date NOT NULL
);
CREATE TABLE IF NOT EXISTS "languages" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" "character varying(32)" UNIQUE NOT NULL,
  "iso639_1" "character varying(2)" UNIQUE NOT NULL,
  "iso639_2" "character varying(3)" UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS "type_documents" (
  "id" integer PRIMARY KEY NOT NULL,
  "country_id" integer NOT NULL,
  "language_id" integer NOT NULL,
  "name" "character varying(64)" NOT NULL
);
CREATE TABLE IF NOT EXISTS "users" (
  "id" integer PRIMARY KEY NOT NULL,
  "account_id" integer UNIQUE NOT NULL,
  "type_document_id" integer NOT NULL,
  "gender_id" integer NOT NULL,
  "country_id" integer NOT NULL,
  "state_id" integer NOT NULL,
  "city_id" integer NOT NULL,
  "num_id" "character varying(32)" UNIQUE NOT NULL,
  "nick_name" "character varying(16)" UNIQUE NOT NULL,
  "first_name" "character varying(32)" NOT NULL,
  "last_name" "character varying(32)" NOT NULL,
  "birth_date" date,
  "home_address" "character varying(64)",
  "postal_code" "character varying(8)",
  "cell_phone" "character varying(16)",
  "home_phone" "character varying(16)"
);
COMMIT;
