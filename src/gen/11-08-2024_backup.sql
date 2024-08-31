
-- Table countries
CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL,
    iso3166_2 VARCHAR(2) UNIQUE NOT NULL,
    iso3166_3 VARCHAR(3) UNIQUE NOT NULL,
    num_code INTEGER UNIQUE NOT NULL,  -- Cambiado a INTEGER para reflejar el estándar ISO numérico
    phone_code VARCHAR(8) NOT NULL -- Si es numérico, considerar cambiar a INTEGER
);

-- Table states
CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    country_id INTEGER NOT NULL REFERENCES countries(id),
    name VARCHAR(32) NOT NULL,
    
    -- Restricción de unicidad para evitar duplicación de nombres de estados dentro de un país
    CONSTRAINT unique_state_name_per_country UNIQUE (country_id, name)
);

-- Índice para mejorar el rendimiento de las consultas basadas en country_id
CREATE INDEX idx_states_country_id ON states(country_id);

-- Table cities
CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    state_id INTEGER NOT NULL REFERENCES states(id),
    name VARCHAR(64) NOT NULL,
    
    -- Restricción de unicidad para evitar duplicación de nombres de ciudades dentro de un estado
    CONSTRAINT unique_city_name_per_state UNIQUE (state_id, name)
);

-- Índice para mejorar el rendimiento de las consultas basadas en state_id
CREATE INDEX idx_cities_state_id ON cities(state_id);

-- Table languages
CREATE TABLE languages (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL,
    iso639_1 VARCHAR(2) UNIQUE NOT NULL,
    iso639_2 VARCHAR(3) UNIQUE NOT NULL
);

-- Table genders
CREATE TABLE genders (
    id SERIAL PRIMARY KEY,  -- Cambiado a SERIAL para permitir la expansión y escalabilidad
    name VARCHAR(8) NOT NULL UNIQUE
);

-- Table genders_by_languages
CREATE TABLE genders_by_languages (
    id SERIAL PRIMARY KEY,
    language_id INTEGER NOT NULL REFERENCES languages(id),
    genders_id INTEGER NOT NULL REFERENCES genders(id),  -- Cambiado a INTEGER para referenciar a la clave primaria de genders
    name VARCHAR(16) NOT NULL
);

-- Opcionalmente, puedes agregar índices para mejorar el rendimiento de consultas
CREATE INDEX idx_genders_by_languages_language_id ON genders_by_languages(language_id);
CREATE INDEX idx_genders_by_languages_genders_id ON genders_by_languages(genders_id);

-- Table holidays_by_countries
CREATE TABLE holidays_by_countries (
    id SERIAL PRIMARY KEY,
    country_id INTEGER NOT NULL REFERENCES countries(id),
    language_id INTEGER NOT NULL REFERENCES languages(id),
    holiday_date DATE NOT NULL,

    -- Restricción de unicidad compuesta para evitar duplicados de feriados en el mismo país, idioma y fecha
    CONSTRAINT unique_holiday_per_country_language UNIQUE (country_id, language_id, holiday_date)
);

-- Índices para mejorar el rendimiento
CREATE INDEX idx_holidays_by_countries_country_id ON holidays_by_countries(country_id);
CREATE INDEX idx_holidays_by_countries_language_id ON holidays_by_countries(language_id);

-- Table type_documents
CREATE TABLE type_documents (
    id SERIAL PRIMARY KEY,
    country_id INTEGER NOT NULL REFERENCES countries(id),
    language_id INTEGER NOT NULL REFERENCES languages(id),
    name VARCHAR(64) NOT NULL,

    -- Restricción de unicidad compuesta para evitar duplicados de tipos de documentos en el mismo país e idioma
    CONSTRAINT unique_type_document_per_country_language UNIQUE (country_id, language_id, name)
);

-- Índices para mejorar el rendimiento
CREATE INDEX idx_type_documents_country_id ON type_documents(country_id);
CREATE INDEX idx_type_documents_language_id ON type_documents(language_id);

-- Table accounts
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    email VARCHAR(64) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,  -- Asegúrate de que está encriptado correctamente
    verified_account BOOLEAN,
    verified_user BOOLEAN,
    updated_at TIMESTAMP,  -- Cambiado a TIMESTAMP para mayor precisión
    created_at TIMESTAMP   -- Cambiado a TIMESTAMP para mayor precisión
);

-- Opcionalmente, puedes agregar un índice en email para mejorar la búsqueda de cuentas
CREATE INDEX idx_accounts_email ON accounts(email);

-- Table users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    account_id INTEGER NOT NULL UNIQUE REFERENCES accounts(id),  -- Relación uno a uno
    type_document_id INTEGER NOT NULL REFERENCES type_documents(id),
    gender_id INTEGER NOT NULL REFERENCES genders_by_languages(id),
    country_id INTEGER NOT NULL REFERENCES countries(id),
    state_id INTEGER NOT NULL REFERENCES states(id),
    city_id INTEGER NOT NULL REFERENCES cities(id),
    num_id VARCHAR(32) NOT NULL UNIQUE,
    nick_name VARCHAR(16) NOT NULL UNIQUE,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    birth_date DATE,
    home_address VARCHAR(64),
    postal_code VARCHAR(8),
    cell_phone VARCHAR(16),
    home_phone VARCHAR(16)
);

-- Índices para mejorar el rendimiento de consultas por localización
CREATE INDEX idx_users_country_id ON users(country_id);
CREATE INDEX idx_users_state_id ON users(state_id);
CREATE INDEX idx_users_city_id ON users(city_id);

-- Table businesses
CREATE TABLE businesses (
    id SERIAL PRIMARY KEY,
    account_id INTEGER NOT NULL REFERENCES accounts(id),
    country_id INTEGER NOT NULL REFERENCES countries(id),
    state_id INTEGER NOT NULL REFERENCES states(id),
    city_id INTEGER NOT NULL REFERENCES cities(id),
    name VARCHAR(20),
    vision VARCHAR(256),
    mission VARCHAR(256),
    motto VARCHAR(256),
    postal_code VARCHAR(10),
    cell_phone VARCHAR(20),
    home_phone VARCHAR(20),
    updated_at TIMESTAMP,  -- Cambiado a TIMESTAMP para mayor precisión
    created_at TIMESTAMP   -- Cambiado a TIMESTAMP para mayor precisión
);

-- Índices para mejorar el rendimiento de consultas por localización
CREATE INDEX idx_businesses_country_id ON businesses(country_id);
CREATE INDEX idx_businesses_state_id ON businesses(state_id);
CREATE INDEX idx_businesses_city_id ON businesses(city_id);


-- Table admins
CREATE TABLE admins (
    id SERIAL PRIMARY KEY,
    num_id VARCHAR(32) NOT NULL UNIQUE,
    nick_name VARCHAR(16) NOT NULL UNIQUE,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    birth_date DATE,
    home_address VARCHAR(64),
    postal_code VARCHAR(8),
    cell_phone VARCHAR(16),
    home_phone VARCHAR(16),
    updated_at TIMESTAMP,  -- Cambiado a TIMESTAMP para mayor precisión
    created_at TIMESTAMP   -- Cambiado a TIMESTAMP para mayor precisión
);

-- Si decides que los admins deben estar relacionados con accounts
-- puedes agregar la siguiente columna a la tabla admins:
-- ALTER TABLE admins ADD COLUMN account_id INTEGER REFERENCES accounts(id);

