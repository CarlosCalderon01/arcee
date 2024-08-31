
CREATE TABLE "accounts" (
  "id" integer PRIMARY KEY NOT NULL,
  "email" "character varying(64)" UNIQUE NOT NULL,
  "password_hash" text NOT NULL,
  "verified_account" boolean,
  "verified_user" boolean,
  "updated_at" timestamp,
  "created_at" timestamp
);

CREATE TABLE "admins" (
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

CREATE TABLE "businesses" (
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

CREATE TABLE "countries" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" "character varying(32)" UNIQUE NOT NULL,
  "iso3166_2" "character varying(2)" UNIQUE NOT NULL,
  "iso3166_3" "character varying(3)" UNIQUE NOT NULL,
  "num_code" integer UNIQUE NOT NULL,
  "phone_code" "character varying(8)" NOT NULL
);

CREATE TABLE "states" (
  "id" integer PRIMARY KEY NOT NULL,
  "country_id" integer NOT NULL,
  "name" "character varying(32)" NOT NULL
);

CREATE TABLE "cities" (
  "id" integer PRIMARY KEY NOT NULL,
  "state_id" integer NOT NULL,
  "name" "character varying(64)" NOT NULL
);

CREATE TABLE "genders" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" "character varying(8)" UNIQUE NOT NULL
);

CREATE TABLE "genders_by_languages" (
  "id" integer PRIMARY KEY NOT NULL,
  "language_id" integer NOT NULL,
  "genders_id" integer NOT NULL,
  "name" "character varying(16)" NOT NULL
);

CREATE TABLE "holidays_by_countries" (
  "id" integer PRIMARY KEY NOT NULL,
  "country_id" integer NOT NULL,
  "language_id" integer NOT NULL,
  "holiday_date" date NOT NULL
);

CREATE TABLE "languages" (
  "id" integer PRIMARY KEY NOT NULL,
  "name" "character varying(32)" UNIQUE NOT NULL,
  "iso639_1" "character varying(2)" UNIQUE NOT NULL,
  "iso639_2" "character varying(3)" UNIQUE NOT NULL
);

CREATE TABLE "type_documents" (
  "id" integer PRIMARY KEY NOT NULL,
  "country_id" integer NOT NULL,
  "language_id" integer NOT NULL,
  "name" "character varying(64)" NOT NULL
);

CREATE TABLE "users" (
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

CREATE INDEX "idx_accounts_email" ON "accounts" ("email");

CREATE INDEX "idx_businesses_city_id" ON "businesses" ("city_id");

CREATE INDEX "idx_businesses_country_id" ON "businesses" ("country_id");

CREATE INDEX "idx_businesses_state_id" ON "businesses" ("state_id");

CREATE UNIQUE INDEX "unique_city_name_per_state" ON "cities" ("state_id", "name");

CREATE INDEX "idx_cities_state_id" ON "cities" ("state_id");

CREATE INDEX "idx_genders_by_languages_genders_id" ON "genders_by_languages" ("genders_id");

CREATE INDEX "idx_genders_by_languages_language_id" ON "genders_by_languages" ("language_id");

CREATE UNIQUE INDEX "unique_holiday_per_country_language" ON "holidays_by_countries" ("country_id", "language_id", "holiday_date");

CREATE INDEX "idx_holidays_by_countries_country_id" ON "holidays_by_countries" ("country_id");

CREATE INDEX "idx_holidays_by_countries_language_id" ON "holidays_by_countries" ("language_id");

CREATE UNIQUE INDEX "unique_state_name_per_country" ON "states" ("country_id", "name");

CREATE INDEX "idx_states_country_id" ON "states" ("country_id");

CREATE UNIQUE INDEX "unique_type_document_per_country_language" ON "type_documents" ("country_id", "language_id", "name");

CREATE INDEX "idx_type_documents_country_id" ON "type_documents" ("country_id");

CREATE INDEX "idx_type_documents_language_id" ON "type_documents" ("language_id");

CREATE INDEX "idx_users_city_id" ON "users" ("city_id");

CREATE INDEX "idx_users_country_id" ON "users" ("country_id");

CREATE INDEX "idx_users_state_id" ON "users" ("state_id");

-- Aquí no se necesita cambio, ya que SQLite soporta esta sintaxis de claves foráneas
ALTER TABLE "businesses" ADD CONSTRAINT "businesses_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "businesses" ADD CONSTRAINT "businesses_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities" ("id");

ALTER TABLE "businesses" ADD CONSTRAINT "businesses_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "businesses" ADD CONSTRAINT "businesses_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id");

ALTER TABLE "genders_by_languages" ADD CONSTRAINT "genders_by_languages_genders_id_fkey" FOREIGN KEY ("genders_id") REFERENCES "genders" ("id");

ALTER TABLE "genders_by_languages" ADD CONSTRAINT "genders_by_languages_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id");

ALTER TABLE "holidays_by_countries" ADD CONSTRAINT "holidays_by_countries_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "holidays_by_countries" ADD CONSTRAINT "holidays_by_countries_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id");

ALTER TABLE "states" ADD CONSTRAINT "states_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "type_documents" ADD CONSTRAINT "type_documents_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "type_documents" ADD CONSTRAINT "type_documents_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id");

ALTER TABLE "users" ADD CONSTRAINT "users_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "users" ADD CONSTRAINT "users_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities" ("id");

ALTER TABLE "users" ADD CONSTRAINT "users_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "users" ADD CONSTRAINT "users_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "genders_by_languages" ("id");

ALTER TABLE "users" ADD CONSTRAINT "users_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id");

ALTER TABLE "users" ADD CONSTRAINT "users_type_document_id_fkey" FOREIGN KEY ("type_document_id") REFERENCES "type_documents" ("id");
