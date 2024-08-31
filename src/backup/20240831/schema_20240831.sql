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
