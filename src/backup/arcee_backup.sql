--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    email character varying(64) NOT NULL,
    password_hash text NOT NULL,
    verified_account boolean,
    verified_user boolean,
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    num_id character varying(32) NOT NULL,
    nick_name character varying(16) NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    birth_date date,
    home_address character varying(64),
    postal_code character varying(8),
    cell_phone character varying(16),
    home_phone character varying(16),
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: businesses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.businesses (
    id integer NOT NULL,
    account_id integer NOT NULL,
    country_id integer NOT NULL,
    state_id integer NOT NULL,
    city_id integer NOT NULL,
    name character varying(20),
    vision character varying(256),
    mission character varying(256),
    motto character varying(256),
    postal_code character varying(10),
    cell_phone character varying(20),
    home_phone character varying(20),
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE public.businesses OWNER TO postgres;

--
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.businesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.businesses_id_seq OWNER TO postgres;

--
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.businesses_id_seq OWNED BY public.businesses.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    state_id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    iso3166_2 character varying(2) NOT NULL,
    iso3166_3 character varying(3) NOT NULL,
    num_code integer NOT NULL,
    phone_code character varying(8) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: genders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genders (
    id integer NOT NULL,
    name character varying(8) NOT NULL
);


ALTER TABLE public.genders OWNER TO postgres;

--
-- Name: genders_by_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genders_by_languages (
    id integer NOT NULL,
    language_id integer NOT NULL,
    genders_id integer NOT NULL,
    name character varying(16) NOT NULL
);


ALTER TABLE public.genders_by_languages OWNER TO postgres;

--
-- Name: genders_by_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genders_by_languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genders_by_languages_id_seq OWNER TO postgres;

--
-- Name: genders_by_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genders_by_languages_id_seq OWNED BY public.genders_by_languages.id;


--
-- Name: genders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genders_id_seq OWNER TO postgres;

--
-- Name: genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genders_id_seq OWNED BY public.genders.id;


--
-- Name: holidays_by_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holidays_by_countries (
    id integer NOT NULL,
    country_id integer NOT NULL,
    language_id integer NOT NULL,
    holiday_date date NOT NULL
);


ALTER TABLE public.holidays_by_countries OWNER TO postgres;

--
-- Name: holidays_by_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.holidays_by_countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.holidays_by_countries_id_seq OWNER TO postgres;

--
-- Name: holidays_by_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holidays_by_countries_id_seq OWNED BY public.holidays_by_countries.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    iso639_1 character varying(2) NOT NULL,
    iso639_2 character varying(3) NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: type_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_documents (
    id integer NOT NULL,
    country_id integer NOT NULL,
    language_id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.type_documents OWNER TO postgres;

--
-- Name: type_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_documents_id_seq OWNER TO postgres;

--
-- Name: type_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_documents_id_seq OWNED BY public.type_documents.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    account_id integer NOT NULL,
    type_document_id integer NOT NULL,
    gender_id integer NOT NULL,
    country_id integer NOT NULL,
    state_id integer NOT NULL,
    city_id integer NOT NULL,
    num_id character varying(32) NOT NULL,
    nick_name character varying(16) NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    birth_date date,
    home_address character varying(64),
    postal_code character varying(8),
    cell_phone character varying(16),
    home_phone character varying(16)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: businesses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businesses ALTER COLUMN id SET DEFAULT nextval('public.businesses_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: genders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders ALTER COLUMN id SET DEFAULT nextval('public.genders_id_seq'::regclass);


--
-- Name: genders_by_languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders_by_languages ALTER COLUMN id SET DEFAULT nextval('public.genders_by_languages_id_seq'::regclass);


--
-- Name: holidays_by_countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays_by_countries ALTER COLUMN id SET DEFAULT nextval('public.holidays_by_countries_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: type_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_documents ALTER COLUMN id SET DEFAULT nextval('public.type_documents_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, email, password_hash, verified_account, verified_user, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, num_id, nick_name, first_name, last_name, birth_date, home_address, postal_code, cell_phone, home_phone, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: businesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.businesses (id, account_id, country_id, state_id, city_id, name, vision, mission, motto, postal_code, cell_phone, home_phone, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, state_id, name) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, iso3166_2, iso3166_3, num_code, phone_code) FROM stdin;
\.


--
-- Data for Name: genders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genders (id, name) FROM stdin;
\.


--
-- Data for Name: genders_by_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genders_by_languages (id, language_id, genders_id, name) FROM stdin;
\.


--
-- Data for Name: holidays_by_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holidays_by_countries (id, country_id, language_id, holiday_date) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name, iso639_1, iso639_2) FROM stdin;
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, country_id, name) FROM stdin;
\.


--
-- Data for Name: type_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_documents (id, country_id, language_id, name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, account_id, type_document_id, gender_id, country_id, state_id, city_id, num_id, nick_name, first_name, last_name, birth_date, home_address, postal_code, cell_phone, home_phone) FROM stdin;
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 1, false);


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, false);


--
-- Name: businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.businesses_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: genders_by_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genders_by_languages_id_seq', 1, false);


--
-- Name: genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genders_id_seq', 1, false);


--
-- Name: holidays_by_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holidays_by_countries_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 1, false);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- Name: type_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_documents_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: admins admins_nick_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_nick_name_key UNIQUE (nick_name);


--
-- Name: admins admins_num_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_num_id_key UNIQUE (num_id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: businesses businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: countries countries_iso3166_2_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_iso3166_2_key UNIQUE (iso3166_2);


--
-- Name: countries countries_iso3166_3_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_iso3166_3_key UNIQUE (iso3166_3);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: countries countries_num_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_num_code_key UNIQUE (num_code);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: genders_by_languages genders_by_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders_by_languages
    ADD CONSTRAINT genders_by_languages_pkey PRIMARY KEY (id);


--
-- Name: genders genders_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_name_key UNIQUE (name);


--
-- Name: genders genders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (id);


--
-- Name: holidays_by_countries holidays_by_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays_by_countries
    ADD CONSTRAINT holidays_by_countries_pkey PRIMARY KEY (id);


--
-- Name: languages languages_iso639_1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_iso639_1_key UNIQUE (iso639_1);


--
-- Name: languages languages_iso639_2_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_iso639_2_key UNIQUE (iso639_2);


--
-- Name: languages languages_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: type_documents type_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_documents
    ADD CONSTRAINT type_documents_pkey PRIMARY KEY (id);


--
-- Name: cities unique_city_name_per_state; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT unique_city_name_per_state UNIQUE (state_id, name);


--
-- Name: holidays_by_countries unique_holiday_per_country_language; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays_by_countries
    ADD CONSTRAINT unique_holiday_per_country_language UNIQUE (country_id, language_id, holiday_date);


--
-- Name: states unique_state_name_per_country; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT unique_state_name_per_country UNIQUE (country_id, name);


--
-- Name: type_documents unique_type_document_per_country_language; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_documents
    ADD CONSTRAINT unique_type_document_per_country_language UNIQUE (country_id, language_id, name);


--
-- Name: users users_account_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_account_id_key UNIQUE (account_id);


--
-- Name: users users_nick_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nick_name_key UNIQUE (nick_name);


--
-- Name: users users_num_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_num_id_key UNIQUE (num_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_accounts_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_accounts_email ON public.accounts USING btree (email);


--
-- Name: idx_businesses_city_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_businesses_city_id ON public.businesses USING btree (city_id);


--
-- Name: idx_businesses_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_businesses_country_id ON public.businesses USING btree (country_id);


--
-- Name: idx_businesses_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_businesses_state_id ON public.businesses USING btree (state_id);


--
-- Name: idx_cities_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cities_state_id ON public.cities USING btree (state_id);


--
-- Name: idx_genders_by_languages_genders_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_genders_by_languages_genders_id ON public.genders_by_languages USING btree (genders_id);


--
-- Name: idx_genders_by_languages_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_genders_by_languages_language_id ON public.genders_by_languages USING btree (language_id);


--
-- Name: idx_holidays_by_countries_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_holidays_by_countries_country_id ON public.holidays_by_countries USING btree (country_id);


--
-- Name: idx_holidays_by_countries_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_holidays_by_countries_language_id ON public.holidays_by_countries USING btree (language_id);


--
-- Name: idx_states_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_states_country_id ON public.states USING btree (country_id);


--
-- Name: idx_type_documents_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_type_documents_country_id ON public.type_documents USING btree (country_id);


--
-- Name: idx_type_documents_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_type_documents_language_id ON public.type_documents USING btree (language_id);


--
-- Name: idx_users_city_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_city_id ON public.users USING btree (city_id);


--
-- Name: idx_users_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_country_id ON public.users USING btree (country_id);


--
-- Name: idx_users_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_state_id ON public.users USING btree (state_id);


--
-- Name: businesses businesses_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: businesses businesses_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: businesses businesses_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: businesses businesses_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: cities cities_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: genders_by_languages genders_by_languages_genders_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders_by_languages
    ADD CONSTRAINT genders_by_languages_genders_id_fkey FOREIGN KEY (genders_id) REFERENCES public.genders(id);


--
-- Name: genders_by_languages genders_by_languages_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders_by_languages
    ADD CONSTRAINT genders_by_languages_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: holidays_by_countries holidays_by_countries_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays_by_countries
    ADD CONSTRAINT holidays_by_countries_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: holidays_by_countries holidays_by_countries_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays_by_countries
    ADD CONSTRAINT holidays_by_countries_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: states states_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: type_documents type_documents_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_documents
    ADD CONSTRAINT type_documents_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: type_documents type_documents_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_documents
    ADD CONSTRAINT type_documents_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: users users_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: users users_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: users users_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: users users_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES public.genders_by_languages(id);


--
-- Name: users users_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: users users_type_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_type_document_id_fkey FOREIGN KEY (type_document_id) REFERENCES public.type_documents(id);


--
-- PostgreSQL database dump complete
--

