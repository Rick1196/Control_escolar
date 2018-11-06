--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: genders; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.genders (
    key integer NOT NULL,
    name character varying
);


ALTER TABLE public.genders OWNER TO ricardo;

--
-- Name: genders_key_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.genders_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genders_key_seq OWNER TO ricardo;

--
-- Name: genders_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.genders_key_seq OWNED BY public.genders.key;


--
-- Name: grades; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    value real NOT NULL,
    student integer NOT NULL,
    subject integer,
    segment integer NOT NULL
);


ALTER TABLE public.grades OWNER TO ricardo;

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_id_seq OWNER TO ricardo;

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- Name: group_period; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.group_period (
    id integer NOT NULL,
    "group" integer NOT NULL,
    period integer NOT NULL
);


ALTER TABLE public.group_period OWNER TO ricardo;

--
-- Name: group_period_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.group_period_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_period_id_seq OWNER TO ricardo;

--
-- Name: group_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.group_period_id_seq OWNED BY public.group_period.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    subject integer,
    teacher integer,
    identifier character varying
);


ALTER TABLE public.groups OWNER TO ricardo;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO ricardo;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO ricardo;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO ricardo;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO ricardo;

--
-- Name: periods; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.periods (
    id integer NOT NULL,
    starts date NOT NULL,
    ends date NOT NULL
);


ALTER TABLE public.periods OWNER TO ricardo;

--
-- Name: periods_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.periods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.periods_id_seq OWNER TO ricardo;

--
-- Name: periods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.periods_id_seq OWNED BY public.periods.id;


--
-- Name: pesrsonal_information; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.pesrsonal_information (
    key integer NOT NULL,
    name character varying NOT NULL,
    last_name character varying NOT NULL,
    age integer NOT NULL,
    address character varying NOT NULL,
    phone_number character varying NOT NULL,
    user_info integer,
    gender integer
);


ALTER TABLE public.pesrsonal_information OWNER TO ricardo;

--
-- Name: pesrsonal_information_key_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.pesrsonal_information_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pesrsonal_information_key_seq OWNER TO ricardo;

--
-- Name: pesrsonal_information_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.pesrsonal_information_key_seq OWNED BY public.pesrsonal_information.key;


--
-- Name: role_user; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.role_user (
    id integer NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_user OWNER TO ricardo;

--
-- Name: role_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.role_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_user_id_seq OWNER TO ricardo;

--
-- Name: role_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.role_user_id_seq OWNED BY public.role_user.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO ricardo;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO ricardo;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: segments; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.segments (
    id integer NOT NULL,
    starts date NOT NULL,
    ends date NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.segments OWNER TO ricardo;

--
-- Name: segments_group; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.segments_group (
    id integer NOT NULL,
    segement integer,
    "group" integer
);


ALTER TABLE public.segments_group OWNER TO ricardo;

--
-- Name: segments_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.segments_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.segments_group_id_seq OWNER TO ricardo;

--
-- Name: segments_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.segments_group_id_seq OWNED BY public.segments_group.id;


--
-- Name: segments_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.segments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.segments_id_seq OWNER TO ricardo;

--
-- Name: segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.segments_id_seq OWNED BY public.segments.id;


--
-- Name: student_group_period; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.student_group_period (
    id integer NOT NULL,
    student integer NOT NULL,
    grade real NOT NULL,
    group_period integer NOT NULL
);


ALTER TABLE public.student_group_period OWNER TO ricardo;

--
-- Name: student_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.student_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_group_id_seq OWNER TO ricardo;

--
-- Name: student_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.student_group_id_seq OWNED BY public.student_group_period.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.students (
    id integer NOT NULL,
    key character varying NOT NULL,
    curp character varying NOT NULL,
    personal_information integer NOT NULL,
    mat character varying NOT NULL
);


ALTER TABLE public.students OWNER TO ricardo;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO ricardo;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying NOT NULL,
    credits integer NOT NULL,
    key character varying NOT NULL
);


ALTER TABLE public.subjects OWNER TO ricardo;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO ricardo;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    rfc character varying NOT NULL,
    salary real NOT NULL,
    personal_information integer
);


ALTER TABLE public.teachers OWNER TO ricardo;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO ricardo;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO ricardo;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO ricardo;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: genders key; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.genders ALTER COLUMN key SET DEFAULT nextval('public.genders_key_seq'::regclass);


--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Name: group_period id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.group_period ALTER COLUMN id SET DEFAULT nextval('public.group_period_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: periods id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.periods ALTER COLUMN id SET DEFAULT nextval('public.periods_id_seq'::regclass);


--
-- Name: pesrsonal_information key; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.pesrsonal_information ALTER COLUMN key SET DEFAULT nextval('public.pesrsonal_information_key_seq'::regclass);


--
-- Name: role_user id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.role_user ALTER COLUMN id SET DEFAULT nextval('public.role_user_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: segments id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.segments ALTER COLUMN id SET DEFAULT nextval('public.segments_id_seq'::regclass);


--
-- Name: segments_group id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.segments_group ALTER COLUMN id SET DEFAULT nextval('public.segments_group_id_seq'::regclass);


--
-- Name: student_group_period id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.student_group_period ALTER COLUMN id SET DEFAULT nextval('public.student_group_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: genders; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.genders (key, name) FROM stdin;
1	Hombre
2	Mujer
3	Otro
\.


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.grades (id, value, student, subject, segment) FROM stdin;
\.


--
-- Data for Name: group_period; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.group_period (id, "group", period) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.groups (id, subject, teacher, identifier) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.migrations (id, migration, batch) FROM stdin;
3	2014_10_12_000000_create_users_table	1
4	2014_10_12_100000_create_password_resets_table	1
5	2018_10_13_151124_create_roles_table	1
6	2018_10_13_151223_create_role_user_table	1
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: periods; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.periods (id, starts, ends) FROM stdin;
\.


--
-- Data for Name: pesrsonal_information; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.pesrsonal_information (key, name, last_name, age, address, phone_number, user_info, gender) FROM stdin;
\.


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.role_user (id, role_id, user_id, created_at, updated_at) FROM stdin;
1	6	1	2018-11-05 22:20:31	2018-11-05 22:20:31
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.roles (id, name, description, created_at, updated_at) FROM stdin;
3	admin	Administrador	2018-10-26 06:05:14	2018-10-26 06:05:14
4	alumno	Alumno	2018-10-26 06:05:15	2018-10-26 06:05:15
5	directivo	Directivo	2018-10-26 06:05:15	2018-10-26 06:05:15
6	profesor	Profesor	2018-10-26 06:05:15	2018-10-26 06:05:15
7	administrativo	Administrativo	2018-10-26 06:05:15	2018-10-26 06:05:15
\.


--
-- Data for Name: segments; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.segments (id, starts, ends, description) FROM stdin;
\.


--
-- Data for Name: segments_group; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.segments_group (id, segement, "group") FROM stdin;
\.


--
-- Data for Name: student_group_period; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.student_group_period (id, student, grade, group_period) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.students (id, key, curp, personal_information, mat) FROM stdin;
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.subjects (id, name, credits, key) FROM stdin;
1	CALCULO I	9	CLI9
2	INTRODUCCION AL CALCULO	6	ICL6
57	ALGEBRA	6	ALEA
58	FILOSOFIA I	7	FIOI
59	COMPUTACION BASICA	10	COPA
60	INGLES I	10	INLI
61	EXPRESION ORAL Y ESCRITA I	8	EXRI
62	DESARROLLO DE HABILIDADES DEL PENSAMIENTO	10	DEAO
63	HISTORIA DE MEXICO CONTEMPORANEO I	7	HITI
64	DESARROLLO PERSONAL 	5	DEA
65	ORIENTACION JUVENIL Y PROFESIONAL	7	OREL
66	GEOMETRIA Y TRIGONOMETRIA	9	GEMA
67	FILOFIA II	5	FIOI
68	COMPUTACION BASICA II	8	COPI
69	INGLES II	9	INLI
70	EXPRESION ORAL Y ESCRITA II	6	EXRI
71	BIOLOGIA BASICA	7	BILA
72	HISTORIA DE MEXICO CONTEMPORANEO II	9	HITI
73	ORIENTACION JUVENIL Y PROFESIONAL II	6	OREI
74	OPTATIVA I	9	OPAI
75	GEOMETRIA ANALITICA	5	GEMA
76	FISICA I	8	FIII
77	QUIMICA I	9	QUMI
78	INGLES III	5	INLI
79	COMUNICACION CIENTIFICA	7	COUA
80	CONTABILIDAD I	10	COTI
81	ENTORNO SOCIECONOMICO DE MEXICO	9	ENOO
82	CALCULOS FINANCIEROS I	8	CACI
83	HERRAMIENTAS DE PROGRAMACION	6	HERN
84	ENSAMBLADO Y MANTENIMIENTO DE PCS	8	ENAS
85	CALCULO DIFERENCIAL	8	CACL
86	FISICA II	8	FIII
87	QUIMICA II	5	QUMI
88	INGLES IV	7	INLV
89	DERECHO	10	DEEO
90	CONTABILIDAD II	8	COTI
91	CALCULOS FINANCIEROS II	7	CACI
92	PROGRAMACION ESTRUCTURADA	10	PRGA
93	OPTATIVA 2	7	OPA2
94	CALCULO INTEGRAL	7	CACL
95	MICROECONOMIA	9	MIRA
96	INGLES V	9	INLV
97	DERECHO MERCANTIL	7	DEEL
98	CONTABILIDAD II	8	COTI
99	ORIENTACION JUVENIL Y PROFESIONAL III	6	OREI
100	PROGRAMACION ORIENTADA A OBJETOS	7	PRGS
101	BASE DE DATOS	6	BAES
102	OPTATIVA 3	10	OPA3
103	PROBABILIDAD Y ESTADISTICA	6	PRBA
104	MACROECONOMIA	8	MARA
105	INGLES V1	7	INL1
106	ORIENTACION JUVENIL Y PROFESIONAL IV	6	OREV
107	PROGRAMACION AVANZADA	7	PRGA
108	DESARROLLO WEB Y MULTIMEDIA	9	DEAA
109	LEFEINFORMATICA	9	LEEA
110	OPTATIVA 4	5	OPA4
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.teachers (id, rfc, salary, personal_information) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	user1	user1@test.com	\N	$2y$10$YM7QnI4Jf3PRSoeSQ8ekA.68qmWqIwJ10dgRQBzu8x43dB6kdgvuG	\N	2018-11-05 22:20:31	2018-11-05 22:20:31
\.


--
-- Name: genders_key_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.genders_key_seq', 3, true);


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.grades_id_seq', 1, false);


--
-- Name: group_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.group_period_id_seq', 1, false);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- Name: periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.periods_id_seq', 1, false);


--
-- Name: pesrsonal_information_key_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.pesrsonal_information_key_seq', 1, false);


--
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.role_user_id_seq', 1, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Name: segments_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.segments_group_id_seq', 1, false);


--
-- Name: segments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.segments_id_seq', 1, false);


--
-- Name: student_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.student_group_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.students_id_seq', 1, false);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.subjects_id_seq', 110, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.teachers_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: genders genders_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (key);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: group_period group_period_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.group_period
    ADD CONSTRAINT group_period_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: periods periods_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);


--
-- Name: pesrsonal_information pesrsonal_information_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.pesrsonal_information
    ADD CONSTRAINT pesrsonal_information_pkey PRIMARY KEY (key);


--
-- Name: role_user role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: segments_group segments_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.segments_group
    ADD CONSTRAINT segments_group_pkey PRIMARY KEY (id);


--
-- Name: segments segments_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.segments
    ADD CONSTRAINT segments_pkey PRIMARY KEY (id);


--
-- Name: student_group_period student_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.student_group_period
    ADD CONSTRAINT student_group_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: genders_key_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX genders_key_uindex ON public.genders USING btree (key);


--
-- Name: grades_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX grades_id_uindex ON public.grades USING btree (id);


--
-- Name: group_period_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX group_period_id_uindex ON public.group_period USING btree (id);


--
-- Name: groups_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX groups_id_uindex ON public.groups USING btree (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: periods_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX periods_id_uindex ON public.periods USING btree (id);


--
-- Name: pesrsonal_information_key_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX pesrsonal_information_key_uindex ON public.pesrsonal_information USING btree (key);


--
-- Name: segments_group_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX segments_group_id_uindex ON public.segments_group USING btree (id);


--
-- Name: segments_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX segments_id_uindex ON public.segments USING btree (id);


--
-- Name: student_group_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX student_group_id_uindex ON public.student_group_period USING btree (id);


--
-- Name: students_curp_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX students_curp_uindex ON public.students USING btree (curp);


--
-- Name: students_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX students_id_uindex ON public.students USING btree (id);


--
-- Name: students_key_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX students_key_uindex ON public.students USING btree (key);


--
-- Name: students_mat_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX students_mat_uindex ON public.students USING btree (mat);


--
-- Name: subjects_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX subjects_id_uindex ON public.subjects USING btree (id);


--
-- Name: teachers_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX teachers_id_uindex ON public.teachers USING btree (id);


--
-- Name: teachers_rfc_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX teachers_rfc_uindex ON public.teachers USING btree (rfc);


--
-- Name: grades grades_segments_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_segments_id_fk FOREIGN KEY (segment) REFERENCES public.segments(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: grades grades_students_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_students_id_fk FOREIGN KEY (student) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: grades grades_subjects_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_subjects_id_fk FOREIGN KEY (subject) REFERENCES public.subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_period group_period_groups_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.group_period
    ADD CONSTRAINT group_period_groups_id_fk FOREIGN KEY ("group") REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_period group_period_periods_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.group_period
    ADD CONSTRAINT group_period_periods_id_fk FOREIGN KEY (period) REFERENCES public.periods(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: groups groups_subjects_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_subjects_id_fk FOREIGN KEY (subject) REFERENCES public.subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: groups groups_teachers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_teachers_id_fk FOREIGN KEY (teacher) REFERENCES public.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pesrsonal_information pesrsonal_information_genders_key_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.pesrsonal_information
    ADD CONSTRAINT pesrsonal_information_genders_key_fk FOREIGN KEY (gender) REFERENCES public.genders(key) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pesrsonal_information pesrsonal_information_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.pesrsonal_information
    ADD CONSTRAINT pesrsonal_information_users_id_fk FOREIGN KEY (user_info) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: segments_group segments_group_groups_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.segments_group
    ADD CONSTRAINT segments_group_groups_id_fk FOREIGN KEY ("group") REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: segments_group segments_group_segments_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.segments_group
    ADD CONSTRAINT segments_group_segments_id_fk FOREIGN KEY (segement) REFERENCES public.segments(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_group_period student_group_group_period_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.student_group_period
    ADD CONSTRAINT student_group_group_period_id_fk FOREIGN KEY (group_period) REFERENCES public.group_period(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_group_period student_group_students_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.student_group_period
    ADD CONSTRAINT student_group_students_id_fk FOREIGN KEY (student) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: students students_pesrsonal_information_key_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pesrsonal_information_key_fk FOREIGN KEY (personal_information) REFERENCES public.pesrsonal_information(key) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teachers teachers_pesrsonal_information_key_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pesrsonal_information_key_fk FOREIGN KEY (personal_information) REFERENCES public.pesrsonal_information(key) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

