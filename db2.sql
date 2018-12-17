--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Debian 11.1-1.pgdg90+1)
-- Dumped by pg_dump version 11.1 (Debian 11.1-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: mensajes; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.mensajes (
    id integer NOT NULL,
    titulo character varying,
    mensaje character varying,
    origen integer,
    destinatario integer,
    fecha timestamp without time zone
);


ALTER TABLE public.mensajes OWNER TO ricardo;

--
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.mensajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensajes_id_seq OWNER TO ricardo;

--
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.mensajes_id_seq OWNED BY public.mensajes.id;


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
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.notificaciones (
    id integer NOT NULL,
    titulo character varying,
    texto character varying,
    fecha timestamp without time zone
);


ALTER TABLE public.notificaciones OWNER TO ricardo;

--
-- Name: notifaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.notifaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifaciones_id_seq OWNER TO ricardo;

--
-- Name: notifaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.notifaciones_id_seq OWNED BY public.notificaciones.id;


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
    ends date NOT NULL,
    "desc" character varying
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
-- Name: personal_information; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.personal_information (
    key integer NOT NULL,
    name character varying NOT NULL,
    last_name character varying NOT NULL,
    age integer NOT NULL,
    address character varying NOT NULL,
    phone_number character varying NOT NULL,
    user_info integer,
    gender integer
);


ALTER TABLE public.personal_information OWNER TO ricardo;

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

ALTER SEQUENCE public.pesrsonal_information_key_seq OWNED BY public.personal_information.key;


--
-- Name: role_user; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.role_user (
    id integer NOT NULL,
    role_id integer,
    user_id integer,
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
    segment integer,
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
    curp character varying NOT NULL,
    mat character varying NOT NULL,
    user_info integer
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
    worker_id integer
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
-- Name: workers; Type: TABLE; Schema: public; Owner: ricardo
--

CREATE TABLE public.workers (
    id integer NOT NULL,
    rfc character varying,
    salary real,
    user_info integer
);


ALTER TABLE public.workers OWNER TO ricardo;

--
-- Name: workers_id_seq; Type: SEQUENCE; Schema: public; Owner: ricardo
--

CREATE SEQUENCE public.workers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workers_id_seq OWNER TO ricardo;

--
-- Name: workers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ricardo
--

ALTER SEQUENCE public.workers_id_seq OWNED BY public.workers.id;


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
-- Name: mensajes id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.mensajes ALTER COLUMN id SET DEFAULT nextval('public.mensajes_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: notificaciones id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id SET DEFAULT nextval('public.notifaciones_id_seq'::regclass);


--
-- Name: periods id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.periods ALTER COLUMN id SET DEFAULT nextval('public.periods_id_seq'::regclass);


--
-- Name: personal_information key; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.personal_information ALTER COLUMN key SET DEFAULT nextval('public.pesrsonal_information_key_seq'::regclass);


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
-- Name: workers id; Type: DEFAULT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.workers ALTER COLUMN id SET DEFAULT nextval('public.workers_id_seq'::regclass);


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
1	2	1
2	3	1
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.groups (id, subject, teacher, identifier) FROM stdin;
2	1	2	G02
3	2	3	G01
\.


--
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.mensajes (id, titulo, mensaje, origen, destinatario, fecha) FROM stdin;
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
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.notificaciones (id, titulo, texto, fecha) FROM stdin;
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: periods; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.periods (id, starts, ends, "desc") FROM stdin;
1	2018-08-01	2019-01-21	2018B
\.


--
-- Data for Name: personal_information; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.personal_information (key, name, last_name, age, address, phone_number, user_info, gender) FROM stdin;
\.


--
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.role_user (id, role_id, user_id, created_at, updated_at) FROM stdin;
14	3	15	2018-12-06 20:09:56	2018-12-06 20:09:56
15	6	16	2018-12-06 20:09:56	2018-12-06 20:09:56
16	7	17	2018-12-06 20:09:56	2018-12-06 20:09:56
17	7	18	2018-12-06 20:09:56	2018-12-06 20:09:56
18	4	19	2018-12-06 20:09:56	2018-12-06 20:09:56
19	3	20	2018-12-06 20:09:56	2018-12-06 20:09:56
20	6	21	2018-12-06 20:09:56	2018-12-06 20:09:56
21	4	22	2018-12-06 20:09:57	2018-12-06 20:09:57
22	6	25	2018-12-06 20:31:39	2018-12-06 20:31:39
23	6	26	2018-12-06 20:31:39	2018-12-06 20:31:39
24	6	27	2018-12-06 20:31:39	2018-12-06 20:31:39
25	6	28	2018-12-06 20:31:39	2018-12-06 20:31:39
26	6	29	2018-12-06 20:31:39	2018-12-06 20:31:39
27	6	30	2018-12-06 20:31:39	2018-12-06 20:31:39
28	6	31	2018-12-06 20:31:39	2018-12-06 20:31:39
29	6	32	2018-12-06 20:31:39	2018-12-06 20:31:39
30	6	33	2018-12-06 20:31:39	2018-12-06 20:31:39
31	6	34	2018-12-06 20:31:39	2018-12-06 20:31:39
32	6	35	2018-12-06 20:31:39	2018-12-06 20:31:39
33	6	36	2018-12-06 20:31:40	2018-12-06 20:31:40
34	6	37	2018-12-06 20:31:40	2018-12-06 20:31:40
35	6	38	2018-12-06 20:31:40	2018-12-06 20:31:40
36	6	39	2018-12-06 20:31:40	2018-12-06 20:31:40
37	6	40	2018-12-06 20:31:40	2018-12-06 20:31:40
38	6	41	2018-12-06 20:31:40	2018-12-06 20:31:40
39	6	42	2018-12-06 20:31:40	2018-12-06 20:31:40
40	6	43	2018-12-06 20:31:40	2018-12-06 20:31:40
41	6	44	2018-12-06 20:31:40	2018-12-06 20:31:40
42	6	45	2018-12-06 20:31:40	2018-12-06 20:31:40
43	6	46	2018-12-06 20:31:40	2018-12-06 20:31:40
44	6	47	2018-12-06 20:31:40	2018-12-06 20:31:40
45	6	48	2018-12-06 20:31:41	2018-12-06 20:31:41
46	6	49	2018-12-06 20:31:41	2018-12-06 20:31:41
47	6	50	2018-12-06 20:31:41	2018-12-06 20:31:41
48	6	51	2018-12-06 20:31:41	2018-12-06 20:31:41
49	6	52	2018-12-06 20:31:41	2018-12-06 20:31:41
50	6	53	2018-12-06 20:31:41	2018-12-06 20:31:41
51	6	54	2018-12-06 20:31:41	2018-12-06 20:31:41
52	6	55	2018-12-06 20:31:41	2018-12-06 20:31:41
53	6	56	2018-12-06 20:31:41	2018-12-06 20:31:41
54	6	57	2018-12-06 20:31:41	2018-12-06 20:31:41
55	6	58	2018-12-06 20:31:41	2018-12-06 20:31:41
56	6	59	2018-12-06 20:31:42	2018-12-06 20:31:42
57	6	60	2018-12-06 20:31:42	2018-12-06 20:31:42
58	6	61	2018-12-06 20:31:42	2018-12-06 20:31:42
59	6	62	2018-12-06 20:31:42	2018-12-06 20:31:42
60	6	63	2018-12-06 20:31:42	2018-12-06 20:31:42
61	6	64	2018-12-06 20:31:42	2018-12-06 20:31:42
62	6	65	2018-12-06 20:31:42	2018-12-06 20:31:42
63	6	66	2018-12-06 20:31:42	2018-12-06 20:31:42
64	6	67	2018-12-06 20:31:42	2018-12-06 20:31:42
65	6	68	2018-12-06 20:31:42	2018-12-06 20:31:42
66	6	69	2018-12-06 20:31:43	2018-12-06 20:31:43
67	6	70	2018-12-06 20:31:43	2018-12-06 20:31:43
68	6	71	2018-12-06 20:31:43	2018-12-06 20:31:43
69	6	72	2018-12-06 20:31:43	2018-12-06 20:31:43
70	6	73	2018-12-06 20:31:43	2018-12-06 20:31:43
71	6	74	2018-12-06 20:31:43	2018-12-06 20:31:43
72	4	75	2018-12-06 20:31:43	2018-12-06 20:31:43
73	4	76	2018-12-06 20:31:43	2018-12-06 20:31:43
74	4	77	2018-12-06 20:31:43	2018-12-06 20:31:43
75	4	78	2018-12-06 20:31:43	2018-12-06 20:31:43
76	4	79	2018-12-06 20:31:44	2018-12-06 20:31:44
77	4	80	2018-12-06 20:31:44	2018-12-06 20:31:44
78	4	81	2018-12-06 20:31:44	2018-12-06 20:31:44
79	4	82	2018-12-06 20:31:44	2018-12-06 20:31:44
80	4	83	2018-12-06 20:31:44	2018-12-06 20:31:44
81	4	84	2018-12-06 20:31:44	2018-12-06 20:31:44
82	4	85	2018-12-06 20:31:44	2018-12-06 20:31:44
83	4	86	2018-12-06 20:31:44	2018-12-06 20:31:44
84	4	87	2018-12-06 20:31:44	2018-12-06 20:31:44
85	4	88	2018-12-06 20:31:44	2018-12-06 20:31:44
86	4	89	2018-12-06 20:31:44	2018-12-06 20:31:44
87	4	90	2018-12-06 20:31:45	2018-12-06 20:31:45
88	4	91	2018-12-06 20:31:45	2018-12-06 20:31:45
89	4	92	2018-12-06 20:31:45	2018-12-06 20:31:45
90	4	93	2018-12-06 20:31:45	2018-12-06 20:31:45
91	4	94	2018-12-06 20:31:45	2018-12-06 20:31:45
92	4	95	2018-12-06 20:31:45	2018-12-06 20:31:45
93	4	96	2018-12-06 20:31:45	2018-12-06 20:31:45
94	4	97	2018-12-06 20:31:45	2018-12-06 20:31:45
95	4	98	2018-12-06 20:31:45	2018-12-06 20:31:45
96	4	99	2018-12-06 20:31:45	2018-12-06 20:31:45
97	4	100	2018-12-06 20:31:46	2018-12-06 20:31:46
98	4	101	2018-12-06 20:31:46	2018-12-06 20:31:46
99	4	102	2018-12-06 20:31:46	2018-12-06 20:31:46
100	4	103	2018-12-06 20:31:46	2018-12-06 20:31:46
101	4	104	2018-12-06 20:31:46	2018-12-06 20:31:46
102	4	105	2018-12-06 20:31:46	2018-12-06 20:31:46
103	4	106	2018-12-06 20:31:46	2018-12-06 20:31:46
104	4	107	2018-12-06 20:31:46	2018-12-06 20:31:46
105	4	108	2018-12-06 20:31:46	2018-12-06 20:31:46
106	4	109	2018-12-06 20:31:46	2018-12-06 20:31:46
107	4	110	2018-12-06 20:31:46	2018-12-06 20:31:46
108	4	111	2018-12-06 20:31:47	2018-12-06 20:31:47
109	4	112	2018-12-06 20:31:47	2018-12-06 20:31:47
110	4	113	2018-12-06 20:31:47	2018-12-06 20:31:47
111	4	114	2018-12-06 20:31:47	2018-12-06 20:31:47
112	4	115	2018-12-06 20:31:47	2018-12-06 20:31:47
113	4	116	2018-12-06 20:31:47	2018-12-06 20:31:47
114	4	117	2018-12-06 20:31:47	2018-12-06 20:31:47
115	4	118	2018-12-06 20:31:47	2018-12-06 20:31:47
116	4	119	2018-12-06 20:31:47	2018-12-06 20:31:47
117	4	120	2018-12-06 20:31:47	2018-12-06 20:31:47
118	4	121	2018-12-06 20:31:47	2018-12-06 20:31:47
119	4	122	2018-12-06 20:31:48	2018-12-06 20:31:48
120	4	123	2018-12-06 20:31:48	2018-12-06 20:31:48
121	4	124	2018-12-06 20:31:48	2018-12-06 20:31:48
122	4	125	2018-12-06 20:31:48	2018-12-06 20:31:48
123	4	126	2018-12-06 20:31:48	2018-12-06 20:31:48
124	4	127	2018-12-06 20:31:48	2018-12-06 20:31:48
125	4	128	2018-12-06 20:31:48	2018-12-06 20:31:48
126	4	129	2018-12-06 20:31:48	2018-12-06 20:31:48
127	4	130	2018-12-06 20:31:48	2018-12-06 20:31:48
128	4	131	2018-12-06 20:31:48	2018-12-06 20:31:48
129	4	132	2018-12-06 20:31:48	2018-12-06 20:31:48
130	4	133	2018-12-06 20:31:49	2018-12-06 20:31:49
131	4	134	2018-12-06 20:31:49	2018-12-06 20:31:49
132	4	135	2018-12-06 20:31:49	2018-12-06 20:31:49
133	4	136	2018-12-06 20:31:49	2018-12-06 20:31:49
134	4	137	2018-12-06 20:31:49	2018-12-06 20:31:49
135	4	138	2018-12-06 20:31:49	2018-12-06 20:31:49
136	4	139	2018-12-06 20:31:49	2018-12-06 20:31:49
137	4	140	2018-12-06 20:31:49	2018-12-06 20:31:49
138	4	141	2018-12-06 20:31:49	2018-12-06 20:31:49
139	4	142	2018-12-06 20:31:49	2018-12-06 20:31:49
140	4	143	2018-12-06 20:31:49	2018-12-06 20:31:49
141	4	144	2018-12-06 20:31:50	2018-12-06 20:31:50
142	4	145	2018-12-06 20:31:50	2018-12-06 20:31:50
143	4	146	2018-12-06 20:31:50	2018-12-06 20:31:50
144	4	147	2018-12-06 20:31:50	2018-12-06 20:31:50
145	4	148	2018-12-06 20:31:50	2018-12-06 20:31:50
146	4	149	2018-12-06 20:31:50	2018-12-06 20:31:50
147	4	150	2018-12-06 20:31:50	2018-12-06 20:31:50
148	4	151	2018-12-06 20:31:50	2018-12-06 20:31:50
149	4	152	2018-12-06 20:31:50	2018-12-06 20:31:50
150	4	153	2018-12-06 20:31:50	2018-12-06 20:31:50
151	4	154	2018-12-06 20:31:51	2018-12-06 20:31:51
152	4	155	2018-12-06 20:31:51	2018-12-06 20:31:51
153	4	156	2018-12-06 20:31:51	2018-12-06 20:31:51
154	4	157	2018-12-06 20:31:51	2018-12-06 20:31:51
155	4	158	2018-12-06 20:31:51	2018-12-06 20:31:51
156	4	159	2018-12-06 20:31:51	2018-12-06 20:31:51
157	4	160	2018-12-06 20:31:51	2018-12-06 20:31:51
158	4	161	2018-12-06 20:31:51	2018-12-06 20:31:51
159	4	162	2018-12-06 20:31:51	2018-12-06 20:31:51
160	4	163	2018-12-06 20:31:51	2018-12-06 20:31:51
161	4	164	2018-12-06 20:31:51	2018-12-06 20:31:51
162	4	165	2018-12-06 20:31:51	2018-12-06 20:31:51
163	4	166	2018-12-06 20:31:52	2018-12-06 20:31:52
164	4	167	2018-12-06 20:31:52	2018-12-06 20:31:52
165	4	168	2018-12-06 20:31:52	2018-12-06 20:31:52
166	4	169	2018-12-06 20:31:52	2018-12-06 20:31:52
167	4	170	2018-12-06 20:31:52	2018-12-06 20:31:52
168	4	171	2018-12-06 20:31:52	2018-12-06 20:31:52
169	4	172	2018-12-06 20:31:52	2018-12-06 20:31:52
170	4	173	2018-12-06 20:31:52	2018-12-06 20:31:52
171	4	174	2018-12-06 20:31:52	2018-12-06 20:31:52
172	4	175	2018-12-06 20:31:52	2018-12-06 20:31:52
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

COPY public.segments_group (id, segment, "group") FROM stdin;
\.


--
-- Data for Name: student_group_period; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.student_group_period (id, student, grade, group_period) FROM stdin;
1	5	0	1
2	5	0	2
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.students (id, curp, mat, user_info) FROM stdin;
5	curpricardo123	201812061	19
6	curpabril12345	201812062	22
7	curp2018120675	2018120675	75
8	curp2018120676	2018120676	76
9	curp2018120677	2018120677	77
10	curp2018120678	2018120678	78
11	curp2018120679	2018120679	79
12	curp2018120680	2018120680	80
13	curp2018120681	2018120681	81
14	curp2018120682	2018120682	82
15	curp2018120683	2018120683	83
16	curp2018120684	2018120684	84
17	curp2018120685	2018120685	85
18	curp2018120686	2018120686	86
19	curp2018120687	2018120687	87
20	curp2018120688	2018120688	88
21	curp2018120689	2018120689	89
22	curp2018120690	2018120690	90
23	curp2018120691	2018120691	91
24	curp2018120692	2018120692	92
25	curp2018120693	2018120693	93
26	curp2018120694	2018120694	94
27	curp2018120695	2018120695	95
28	curp2018120696	2018120696	96
29	curp2018120697	2018120697	97
30	curp2018120698	2018120698	98
31	curp2018120699	2018120699	99
32	curp20181206100	20181206100	100
33	curp20181206101	20181206101	101
34	curp20181206102	20181206102	102
35	curp20181206103	20181206103	103
36	curp20181206104	20181206104	104
37	curp20181206105	20181206105	105
38	curp20181206106	20181206106	106
39	curp20181206107	20181206107	107
40	curp20181206108	20181206108	108
41	curp20181206109	20181206109	109
42	curp20181206110	20181206110	110
43	curp20181206111	20181206111	111
44	curp20181206112	20181206112	112
45	curp20181206113	20181206113	113
46	curp20181206114	20181206114	114
47	curp20181206115	20181206115	115
48	curp20181206116	20181206116	116
49	curp20181206117	20181206117	117
50	curp20181206118	20181206118	118
51	curp20181206119	20181206119	119
52	curp20181206120	20181206120	120
53	curp20181206121	20181206121	121
54	curp20181206122	20181206122	122
55	curp20181206123	20181206123	123
56	curp20181206124	20181206124	124
57	curp20181206125	20181206125	125
58	curp20181206126	20181206126	126
59	curp20181206127	20181206127	127
60	curp20181206128	20181206128	128
61	curp20181206129	20181206129	129
62	curp20181206130	20181206130	130
63	curp20181206131	20181206131	131
64	curp20181206132	20181206132	132
65	curp20181206133	20181206133	133
66	curp20181206134	20181206134	134
67	curp20181206135	20181206135	135
68	curp20181206136	20181206136	136
69	curp20181206137	20181206137	137
70	curp20181206138	20181206138	138
71	curp20181206139	20181206139	139
72	curp20181206140	20181206140	140
73	curp20181206141	20181206141	141
74	curp20181206142	20181206142	142
75	curp20181206143	20181206143	143
76	curp20181206144	20181206144	144
77	curp20181206145	20181206145	145
78	curp20181206146	20181206146	146
79	curp20181206147	20181206147	147
80	curp20181206148	20181206148	148
81	curp20181206149	20181206149	149
82	curp20181206150	20181206150	150
83	curp20181206151	20181206151	151
84	curp20181206152	20181206152	152
85	curp20181206153	20181206153	153
86	curp20181206154	20181206154	154
87	curp20181206155	20181206155	155
88	curp20181206156	20181206156	156
89	curp20181206157	20181206157	157
90	curp20181206158	20181206158	158
91	curp20181206159	20181206159	159
92	curp20181206160	20181206160	160
93	curp20181206161	20181206161	161
94	curp20181206162	20181206162	162
95	curp20181206163	20181206163	163
96	curp20181206164	20181206164	164
97	curp20181206165	20181206165	165
98	curp20181206166	20181206166	166
99	curp20181206167	20181206167	167
100	curp20181206168	20181206168	168
101	curp20181206169	20181206169	169
102	curp20181206170	20181206170	170
103	curp20181206171	20181206171	171
104	curp20181206172	20181206172	172
105	curp20181206173	20181206173	173
106	curp20181206174	20181206174	174
107	curp20181206175	20181206175	175
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

COPY public.teachers (id, worker_id) FROM stdin;
2	2
3	3
4	307
5	308
6	309
7	310
8	311
9	312
10	313
11	314
12	315
13	316
14	317
15	318
16	319
17	320
18	321
19	322
20	323
21	324
22	325
23	326
24	327
25	328
26	329
27	330
28	331
29	332
30	333
31	334
32	335
33	336
34	337
35	338
36	339
37	340
38	341
39	342
40	343
41	344
42	345
43	346
44	347
45	348
46	349
47	350
48	351
49	352
50	353
51	354
52	355
53	356
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
47	profesor72	profesor72@gmail.com	\N	$2y$10$rdvMNwr7IoU1LXJvu5tc3.INCYovHd81QxxUcLMUhIlHtrjEjOGqW	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
15	ricardo.admin	ricardo.admin@gmail.com	\N	$2y$10$7mO6bWbKpQLfoexLIyrpw.7q8u/TZ9OHh8qEDA4NPPrYfwuPpUfYu	\N	2018-12-06 20:09:56	2018-12-06 20:09:56
18	abril.adminis	abril.adminis@gmail.com	\N	$2y$10$3DQenlGpwBNPX9B4EgWvbOQG1Rvmiwo.gLHU.96UiVbYhiexscT22	\N	2018-12-06 20:09:56	2018-12-06 20:09:56
19	ricardo.alumno	ricardo.alumno@gmail.com	\N	$2y$10$UbRa7z02NFIOA6rB.Y3GaexUJ./cOXOtVWHVALQLmqoKZeDfrmLpW	\N	2018-12-06 20:09:56	2018-12-06 20:09:56
20	abril.admin	abril.admin@gmail.com	\N	$2y$10$stx16qh1hlfpTeBHv0acMeCHZ9PhC6Y/LM5J92CmW3IoFRRkxmW1K	\N	2018-12-06 20:09:56	2018-12-06 20:09:56
21	abril.profesor	abril.profesor@gmail.com	\N	$2y$10$75M6vh5NQBvPHXJ0KoYI7eGzjPF5KSGJk8diy3o7T4W6cZnDAA4DC	\N	2018-12-06 20:09:56	2018-12-06 20:09:56
22	abril.alumno	abril.alumno@gmail.com	\N	$2y$10$nfKmyxMtnD7MFfXGMNxflOAT0fKUXdE8CWrk.cpKpf8YfuQkRT4eG	\N	2018-12-06 20:09:57	2018-12-06 20:09:57
17	ricardo.adminis	ricardo.adminis@gmail.com	\N	$2y$10$mz8dhfUTR7ZeaxaB12wa/eq8rSJmv1YE7lGHDC2dD1VjeZTfgRCae	bQi5cpm64hSoqPAwJwWw5PqbvOxkJ5bM6AlLOkIGUsah3fsQQ6JC65JmusVu	2018-12-06 20:09:56	2018-12-06 20:09:56
16	ricardo.profesor	ricardo.profesor@gmail.com	\N	$2y$10$w46srgFm5RgJOJEGLWOrrOro0st2AJQJ/4ImbcFAhtgyCTHu.v5Zq	yPP7kUZKG5eEKnsLafhdzsfpdtDW8L7bNlXeVXV5dDDehvBlrW5vIaF8s7pW	2018-12-06 20:09:56	2018-12-06 20:09:56
23	profesor1	profesor1@gmail.com	\N	$2y$10$hxPFY.9jCiIYbtzdbtbDgukzdEIqdmOh7AIDfaytoLG0pi/ylD0Z.	\N	2018-12-06 20:29:10	2018-12-06 20:29:10
25	profesor50	profesor50@gmail.com	\N	$2y$10$OJrJRsPvWXkdqj0tjXsRnuWCI9ExbPzpZ9mXsQRkv1bbLRl..zJRS	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
26	profesor51	profesor51@gmail.com	\N	$2y$10$nqG2Qi7ycURC0zatYGWUUuiY/c1NOOFNCBK0iC0ehNWiy2CPVlsDO	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
27	profesor52	profesor52@gmail.com	\N	$2y$10$mwy.p7tLKLD/PpWY6SgwsukDHmy2lSF9dn3MBg61UVpVaicjglZLm	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
28	profesor53	profesor53@gmail.com	\N	$2y$10$R1cgEbzuWCDrWSkb1rz37uoVlQo6UeaPA7b/5DYOas4dkHBn0qt8u	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
29	profesor54	profesor54@gmail.com	\N	$2y$10$z4wNTqe3wDqXmYEUFnuykearhgf53F0dX/eua1ovkSzHiJAa60HDK	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
30	profesor55	profesor55@gmail.com	\N	$2y$10$vtede/oVPCkjHfjdzFUws.MGIYaaNk0eca9qTXqNynhxKByDLdrU6	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
31	profesor56	profesor56@gmail.com	\N	$2y$10$yGn/z5LL.LSq0qzrdpBjuO3lcWYs87zZrsBYaj6ZmA6PmuM4TrJt.	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
32	profesor57	profesor57@gmail.com	\N	$2y$10$MQb2CeULX.axTv3hBs84eOSUXc4.xR.NQRhc8d05P3lp9vubQnoUW	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
33	profesor58	profesor58@gmail.com	\N	$2y$10$1askEVDDbKC0VUAVx8AZDO7Xax3ikIQmtUgykn0H63/IjHt624gcu	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
34	profesor59	profesor59@gmail.com	\N	$2y$10$UtdbkbxhLAVTR5IXgWPzyuJDXioycrKzs8WBiSeG9S8234CGepv2e	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
35	profesor60	profesor60@gmail.com	\N	$2y$10$rTPh8koNEFxIadz7QJrTpuZc4r1x9bqNcv0I9ak1eR6Gh7nkxGhEe	\N	2018-12-06 20:31:39	2018-12-06 20:31:39
36	profesor61	profesor61@gmail.com	\N	$2y$10$vGpbL/4dJfCF8JoknQOCgOTsGW81EZbUaSnw5dLk84r2PROVPPSG2	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
37	profesor62	profesor62@gmail.com	\N	$2y$10$nfE8DcYGzOP543J67vCsXO0MQFAo65zUshcC.e9cx/3FEzB9sv3P6	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
38	profesor63	profesor63@gmail.com	\N	$2y$10$2UXzG6w9t7cNIkdvPA.rmOTxs7kf5lngVfJh4U68KvD/.nrINoVQ.	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
39	profesor64	profesor64@gmail.com	\N	$2y$10$4F6MqXdjfHTnIocgmzOj8uTRzKL2dR1Bim0OrRvZ5eZB6cmIlvoNW	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
40	profesor65	profesor65@gmail.com	\N	$2y$10$wxpfWl5dcYsuiq24avOcgOdnYaDI/RzpkNy6rZSJgHEY7J2rek7GS	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
41	profesor66	profesor66@gmail.com	\N	$2y$10$3yDRDuxinZYVQ9PvfDuWDerMWh5ZL9XkMzQ8Bxof1khTqu9AEB/8W	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
42	profesor67	profesor67@gmail.com	\N	$2y$10$aPdZIs3xA0P4/xio4gCwMuBzc1.4NHB799S0xIQDKM1XwM7ALBNsm	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
43	profesor68	profesor68@gmail.com	\N	$2y$10$RLjCkFmrFnd6BoykS7s6MOKq4.YlQgaQINMQt4R9ewugIPmcDnT/u	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
44	profesor69	profesor69@gmail.com	\N	$2y$10$9tMQETnytxFeZ4IK22zCH.ADLlaXgLHdp2sNBR3WPzJWNpfZFFCMe	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
45	profesor70	profesor70@gmail.com	\N	$2y$10$DbVOyDYjGylSgNJJUJ4rbeoXNFvgjme.eVEtyudUgg29NPnyji9zi	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
46	profesor71	profesor71@gmail.com	\N	$2y$10$X29eSZQt2mFsdirlm2MBO.NDJ8FZbtd3zDCS2NjYLX4qc1K4kIRN2	\N	2018-12-06 20:31:40	2018-12-06 20:31:40
48	profesor73	profesor73@gmail.com	\N	$2y$10$tMRlrFx2PtI7jVQXNQVy5uK4zJ7aulKv27ciWPe6b0NIjUsd8F5Vy	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
49	profesor74	profesor74@gmail.com	\N	$2y$10$mUDhdheQUiAWKW.AcSlvW.SEWCDmcE5jdoTNOYnnofgenSCcBv.RK	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
50	profesor75	profesor75@gmail.com	\N	$2y$10$ovoWI618U7vKxw5qpCMps.xz8aq0PmtKCRI5evXITNoSQfPDqBpu.	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
51	profesor76	profesor76@gmail.com	\N	$2y$10$/5aIa2Fo9k/YX/7uFKFSOe8ztYoNK7Jye3cTiNDM39DKtyD2emvdi	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
52	profesor77	profesor77@gmail.com	\N	$2y$10$Bb5.041fQXldR2t847NzYenzOLN.Oy0yWsJdoubRN8un5hZXHZwQ.	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
53	profesor78	profesor78@gmail.com	\N	$2y$10$KVd4KeGkSZkFW0jl78JGk.HvJXhuySdqWvMknvDYPEL4oB60Pceiu	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
54	profesor79	profesor79@gmail.com	\N	$2y$10$SrabgC91weY9etI0lu73qO7y//ZUzh5Tc9FfEK.Pth/6t1HpZKZDm	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
55	profesor80	profesor80@gmail.com	\N	$2y$10$d7D.QZPyj2lUP6IfrXYeeuhjTS9OXVG5JMuCFzM5cu08lyIq.Mm06	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
56	profesor81	profesor81@gmail.com	\N	$2y$10$U8fyRYnA28BO7uDBhqLhbuD2t/qvjcaq1HFL6QFvfJjw2sRmHISUm	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
57	profesor82	profesor82@gmail.com	\N	$2y$10$xKb1ptt2iO3kE59PyNAdteA8DvPYMBp6vZzQ2MsgWQJKEqzWyyUoC	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
58	profesor83	profesor83@gmail.com	\N	$2y$10$6DCpmSG13PaLQUfDXCXcYuQQWvQRd.Y5a758SoNk/gyLOTIk21P2i	\N	2018-12-06 20:31:41	2018-12-06 20:31:41
59	profesor84	profesor84@gmail.com	\N	$2y$10$lMUzmm6sCQmIxFphHCWX/.VI8m3mHj9dQSvW.fezXCeBT72I91ms.	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
60	profesor85	profesor85@gmail.com	\N	$2y$10$y1DXzFk9arAX.ukfslSj9e9JhU1TZ0oOCOEssykJzqqp.Pwk85.2O	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
61	profesor86	profesor86@gmail.com	\N	$2y$10$MJSBVdD5S1UD.Mh56A/BW.UtXASF5ZQnwkN8D7tmSpbN3lRF1rP/2	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
62	profesor87	profesor87@gmail.com	\N	$2y$10$.UBWNOUawjd.QxViYOKUoOgUQJ8KOMybwq2NWj58gnKkEu7h5fu9C	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
63	profesor88	profesor88@gmail.com	\N	$2y$10$/GF7KKRwN7AQnLJjGP7zY.Xm8C49bYG/v2JXHxkuRtxxjHCoiDE/S	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
64	profesor89	profesor89@gmail.com	\N	$2y$10$kvvV0hvxgX/.yWCTcG/e6ucd66sgMm/Hi1ZNmazd14N9YH834VJuK	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
65	profesor90	profesor90@gmail.com	\N	$2y$10$AMI3P2z74CGJhGHBc3GaJO4uAtscm1BU5.NzGQsNeQ.RaCokueUrK	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
66	profesor91	profesor91@gmail.com	\N	$2y$10$i1DWiJsqtb1hB.dF1PVFyulD6bJPBPQ5vRnyznSD9ucre.lwm6ShG	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
67	profesor92	profesor92@gmail.com	\N	$2y$10$Vhmhbmc/DhYU74GrUS1s3.V1XLRcuTu7ZZI3efCNcHps7SiVijEem	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
68	profesor93	profesor93@gmail.com	\N	$2y$10$/CLtOsN.fCA34BOZsClw4eu2rs//BOC.7c5uooXut4k3w3k.COH9W	\N	2018-12-06 20:31:42	2018-12-06 20:31:42
69	profesor94	profesor94@gmail.com	\N	$2y$10$rPEBfs0QCswfY2maZScmauEkF5TfY5WXHaZdDAPcifg.tDQeb5bee	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
70	profesor95	profesor95@gmail.com	\N	$2y$10$0DsteOvdnyui9Isyu2w4Rud71v8K1VsVozbbwUqeXzIBPtlFLwwdC	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
71	profesor96	profesor96@gmail.com	\N	$2y$10$5qO.3JFFdhlvVSJtLACW1uIrL5OCBvbV/mkCNHrDjT5lHHh9WEjlS	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
72	profesor97	profesor97@gmail.com	\N	$2y$10$6kzYid9ucziyTmaTIKaS5uIfVbcSbQqN6t62/e9biJvBJYvfXVAU2	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
73	profesor98	profesor98@gmail.com	\N	$2y$10$molR4PIuz0tCHX9OWg3b0.WTI67.LKax9tIK1.I.3UuJvJeuyA9Bi	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
74	profesor99	profesor99@gmail.com	\N	$2y$10$BTqNtuzMdZmQHoQB.Yb/JuPBiKDk8/Wbqd9/.RUa.B14wyPDoQ7rm	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
75	alumno50	alumno50@gmail.com	\N	$2y$10$xDcc9uNGLTS0eWN2wMwDmeSmOjmr0PI.dfEdDwkNIqgnRZnD7Ft3O	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
76	alumno51	alumno51@gmail.com	\N	$2y$10$I9d2Z7un/7HkB6RjdQLRh.x7eDHbmSA7bh2xRBRPX9CxNvVTSNev2	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
77	alumno52	alumno52@gmail.com	\N	$2y$10$8MyT6ejHfg6PnqJMHrQyte5IngsaHtx5Gsk887Z4.NvLW5jHEDZC2	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
78	alumno53	alumno53@gmail.com	\N	$2y$10$ptdAJYSY7//gECAZw1Rl2.18X56qUul/dbq2WaXfrdzLdw.tg79M2	\N	2018-12-06 20:31:43	2018-12-06 20:31:43
79	alumno54	alumno54@gmail.com	\N	$2y$10$m1lBJd32OyQkakG1uNoXq.Ycuq59kcIexJsZjhfamH2DiSsfe/CTG	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
80	alumno55	alumno55@gmail.com	\N	$2y$10$mddyKadyKGY/kRBstcBJMepcPh3/Ueh0oc3PeE/SrRlB.y7fIDsn6	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
81	alumno56	alumno56@gmail.com	\N	$2y$10$8WFzQQplUFK6r/A/l1jLY.4tfQcUw3.6DBku5svm85u5jcm2TEwwS	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
82	alumno57	alumno57@gmail.com	\N	$2y$10$qxVjbH3R53hJYynYlmZYAuH15w/XbPH5H4ZdxLP8bxPcOIsAm10hq	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
83	alumno58	alumno58@gmail.com	\N	$2y$10$Em43rXKCjlm2FBNimaCf3ONyJzzifgYx1Y1Vt9rwhfuZY8PxMXVKK	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
84	alumno59	alumno59@gmail.com	\N	$2y$10$q8tuyaHFXBeYy9W/kE4lb.npFxjEGTe4gADR/H9fiuPSZ0AbAblJu	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
85	alumno60	alumno60@gmail.com	\N	$2y$10$s6QJ2VlBeZk8n8ggNvqfxeubjswF55rFD5uH/wasu3yfA7mNgw1fG	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
86	alumno61	alumno61@gmail.com	\N	$2y$10$Ilx.KZ4K8q84oJNdLko0NetjzJgZyo88g1M4RGmEQzwwsW7d6cBpq	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
87	alumno62	alumno62@gmail.com	\N	$2y$10$C/mfxMuR3j9gNKapBcb/3OjHAtZOFpyOdxb7ufFY5afUGipJDeazm	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
88	alumno63	alumno63@gmail.com	\N	$2y$10$Jqn9mlVN7LE/o.E0Hvaz9eLqRyOHHJDFqEX8UExgen6dBtEtSxHpS	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
89	alumno64	alumno64@gmail.com	\N	$2y$10$HNa77995v3YfpO8nRGazGuKk8ycD6v4s5.vlxJ/0iBGVS.4RtAem.	\N	2018-12-06 20:31:44	2018-12-06 20:31:44
90	alumno65	alumno65@gmail.com	\N	$2y$10$h0rZRrq/5QY.O.Uhr5vMbOXOy63Rm46F1qm8Y4yZOv1uqxGQJilua	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
91	alumno66	alumno66@gmail.com	\N	$2y$10$IcIr9JnvSTnIR4/l6Vzb7e1E78lcD9tMILhzqikDXekCMjnVnIwkW	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
92	alumno67	alumno67@gmail.com	\N	$2y$10$Z374HcbxTOWY6bBmXu7WOut8HYTUIQVJic2RaeTgAFxeIRBOu5r1C	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
93	alumno68	alumno68@gmail.com	\N	$2y$10$yS2hP6L4UgKrZEh/ge12F.baFiyhi8rVWwiGVy6ZSldY1xlkW.RcO	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
94	alumno69	alumno69@gmail.com	\N	$2y$10$GeiqVVj39W8jyJEsiVUime9jSHIMFkPJHWk1y01oO0nOoxYsaV5FG	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
95	alumno70	alumno70@gmail.com	\N	$2y$10$I2mlNu2afl2UcIHUN09xVuNV2YfHPZOe.ul2S6TOCueYYKpwYCDfW	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
96	alumno71	alumno71@gmail.com	\N	$2y$10$O8AGlNFTWIVgVHzJGq1EoujXra45Qc/hnvaoXisospt2KFt8/40L6	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
97	alumno72	alumno72@gmail.com	\N	$2y$10$fvykKZjXXDAQwVpQaWG9t.mj26TMc.NqUPXhAYYwrxA7cqEaRJ5EW	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
98	alumno73	alumno73@gmail.com	\N	$2y$10$VCH2UxcGZRyrw.KacyODuuysC0wvVUKfhfbqJq6qLTUGoMNxzkZIS	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
99	alumno74	alumno74@gmail.com	\N	$2y$10$TtEqvOneLFNi/6orz0Re/OGCPgoemOV3uYATUjimn4YaTVNSUkVaS	\N	2018-12-06 20:31:45	2018-12-06 20:31:45
100	alumno75	alumno75@gmail.com	\N	$2y$10$c2n/V4J7bT3mb9LT9UhxJ.6IYeH8YObx9s/MEpBQ1qf7TTRM0Zm26	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
101	alumno76	alumno76@gmail.com	\N	$2y$10$yxjdirHRghiMF466JllYuOrxlb3M.ApkY06wtqjbO8BAEMqHanDPK	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
102	alumno77	alumno77@gmail.com	\N	$2y$10$KkwXDhk8hWChQ7csTWN2D.Gk7vGwHdjfAEwIp6mbDkAAY5MbEEkRe	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
103	alumno78	alumno78@gmail.com	\N	$2y$10$.T3tMda9nOvZ3/ukIqNIkOmUSTk.NZk20c4lZDtoXzEiJpethWnY2	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
104	alumno79	alumno79@gmail.com	\N	$2y$10$m/yqysanZQAfNOmKi.a./ese0HhjnfAvt5U/v4v8m9ndkCu80WRRC	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
105	alumno80	alumno80@gmail.com	\N	$2y$10$L9eiuj3NXcVXoJLLA3OSt.0BySc7s2D9iZRDpjaP8naQPSW1XV1hS	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
106	alumno81	alumno81@gmail.com	\N	$2y$10$7Gv5TQLsl9rz8YdpuTjDyOuNtJTwU2K1xn4oe8cCN5jwKs/wetmzK	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
107	alumno82	alumno82@gmail.com	\N	$2y$10$2ov6/vzLddGQiXc4ANEALeDrahCUXkZ2L2JRc8/4mKByJMCaDE6Ae	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
108	alumno83	alumno83@gmail.com	\N	$2y$10$mSIQ5W1G8D5AIN0IjMTpsO1.dcVyQHDJrQ/xVH2gSqaGLP.Ghh2lK	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
109	alumno84	alumno84@gmail.com	\N	$2y$10$3dXTij68L22E1Pr4yVzuPe1sRnTgFox87uxcllhrkF0Beoa5/FELK	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
110	alumno85	alumno85@gmail.com	\N	$2y$10$qDOx1zJTQmyZbAwNmjipweFBPI2SYVo8Dr8b8x2nLVA0q8KHdy/b6	\N	2018-12-06 20:31:46	2018-12-06 20:31:46
111	alumno86	alumno86@gmail.com	\N	$2y$10$tpvPW9rqDYYauWn7GwotUOe7fPkFj/nYj7lKGhe9da7flQj/s9U2i	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
112	alumno87	alumno87@gmail.com	\N	$2y$10$ZIeBlRErRbY.PUsK2TP8Au.ed6Q2.GPsIDclQEfYFI9lRAi9JcP4y	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
113	alumno88	alumno88@gmail.com	\N	$2y$10$hmP82sNmvxVnq2C9W/7pTuRrg0vQALyujsTR4ETBEXWHL4Vo4X8iO	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
114	alumno89	alumno89@gmail.com	\N	$2y$10$PWHmyPcM78GSn7g6YcsNYuYsAoC4vzAyHGLjM4HOEqMZ/p2CbAXQ.	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
115	alumno90	alumno90@gmail.com	\N	$2y$10$GLz/F28KV8bZbhi3Tb3LLe8wsXuCepJpYd3QPujKOb2hts0dXB6cK	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
116	alumno91	alumno91@gmail.com	\N	$2y$10$M3x.zB9noLsFDrAzWneSVeHXjqp8zwxo.2pexBFOa0w1MloVdRTkO	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
117	alumno92	alumno92@gmail.com	\N	$2y$10$zX55XxxEE5WckT.MU8tCZuZhaS24.7lQdSKI8y.JTphISH44R2HnS	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
118	alumno93	alumno93@gmail.com	\N	$2y$10$ufT2t8AkCFQ4Y0uh8mNA5.e0bC2vIjTeZ4jiVfbN9dYUgFKlmp9uW	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
119	alumno94	alumno94@gmail.com	\N	$2y$10$66PDPSLRQ0e6cjAp78.Gr.n0Qd4F7wF5Xk0jwj4fg4iYasKBhnT2O	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
120	alumno95	alumno95@gmail.com	\N	$2y$10$obXVVUA4ZPgy8fBd42Pcl.MlfOdK23ACsnj55swH9Pq.D4XoOYap6	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
121	alumno96	alumno96@gmail.com	\N	$2y$10$86LQXXSGChgeKseeh3ckXuHhSusAz5aBl59P9EN2XjX/KGwUWAIqW	\N	2018-12-06 20:31:47	2018-12-06 20:31:47
122	alumno97	alumno97@gmail.com	\N	$2y$10$ZwTxkJqu8wt5QJ8Qw.Ut4OdcynQkMKX22rdk8i8rY3Q8CP9J7e8Ii	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
123	alumno98	alumno98@gmail.com	\N	$2y$10$Pz57CTLsLt8L0ebgMmKQ3.RP9cc7/CZB6CyDUskvumsFudBsvG1ou	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
124	alumno99	alumno99@gmail.com	\N	$2y$10$1pNNV6R6viMGB.oJB.PPmOHpqvcn9ZOS1IXiN39gdy5gGtlSn..9O	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
125	alumno100	alumno100@gmail.com	\N	$2y$10$vcG8xJVAZBuz/2JAj2pKKuK/PasgreHrU4pvq9YQqSY2J0/BixOKG	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
126	alumno101	alumno101@gmail.com	\N	$2y$10$2KorSIRxXab9HrK9D2LYLOOgtKMh9JVmvolTM.0wzfsdOVTK2dgLy	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
127	alumno102	alumno102@gmail.com	\N	$2y$10$IA2MEs7EXecL7tHD3aCVtOToc4n.PfoTd9IBZJUqGuLHp/0KyMiGu	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
128	alumno103	alumno103@gmail.com	\N	$2y$10$IBStNLNL6/sKQ2U1i7EqXu5cpb4rH57ISXseOrBr0nl/plxPRPAXG	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
129	alumno104	alumno104@gmail.com	\N	$2y$10$hFkWiVPACnsnoNLT/hYQSOD3YDSTW.WGg9fDSsWI.5ZV7wuXntVY2	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
130	alumno105	alumno105@gmail.com	\N	$2y$10$vKCKtVtXd1gLMpVrfZZL3OmqrwwHVYM9JoV5cbJm19DIkv1Rx41H6	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
131	alumno106	alumno106@gmail.com	\N	$2y$10$TPisvKt9i2dB49vULjOuUeRYdzmJzWyIRGTC934MrAwX21rULmJ3K	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
132	alumno107	alumno107@gmail.com	\N	$2y$10$BfOSzm//WtmKjoKzxmNOY.5P2Bc7Ib1/IjtMSE3tDdRnU4QaMnD5e	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
133	alumno108	alumno108@gmail.com	\N	$2y$10$pEdjAZzeqXugrp6BQ4Wn9eDnrYfp7s3tT8.K1xlNzxLNHf5jZVjKK	\N	2018-12-06 20:31:48	2018-12-06 20:31:48
134	alumno109	alumno109@gmail.com	\N	$2y$10$Oz0ZWAr0WZGBw8bH.6lgb.6UENlazjY6tnV2HEbrk1q97VYkYNj7u	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
135	alumno110	alumno110@gmail.com	\N	$2y$10$fMQK5DoLjsWxjfUE2X5JX.qCliAfZl7AmlY5i350E6fvriFB1Gzja	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
136	alumno111	alumno111@gmail.com	\N	$2y$10$v07mY7v3OV//ynOIXcB6K.c2gPYwHk3OrGZRJ8HUk7lUbdl2hmxjS	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
137	alumno112	alumno112@gmail.com	\N	$2y$10$M2ehgYwtYEbWEdDaLarVIOOUrE6hwL4Z3Frh8OGzQciInpbzccB7m	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
138	alumno113	alumno113@gmail.com	\N	$2y$10$R0JMM3M9OAoRb9kbWg1aleFooqk5OA4XMS9gY0D8VtrQNqqdvj2ly	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
139	alumno114	alumno114@gmail.com	\N	$2y$10$YaziiD/K8oA6sf63FgvYwuIcTVsPu806Y2/QN0JE9FDTu.NaY07wS	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
140	alumno115	alumno115@gmail.com	\N	$2y$10$DtVp.kBw95.soomAk3ARZe8OaipWoEUmsRGo.2oagY8nIPbVfnZh6	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
141	alumno116	alumno116@gmail.com	\N	$2y$10$Ov2fMPfre3TPrig5H2nnnun9tPJkF6Qlmh39sFdjof6NkktpjtGa2	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
142	alumno117	alumno117@gmail.com	\N	$2y$10$JR.IJsuFI18cVjXv9ls4XeDLECbX4/dy6jLOvawzxVChELF7htr.u	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
143	alumno118	alumno118@gmail.com	\N	$2y$10$VDyR9qLU6EkWoAOqfI3eIecMJSqBNOoFvGrJyO2.QanbiKGS210p2	\N	2018-12-06 20:31:49	2018-12-06 20:31:49
144	alumno119	alumno119@gmail.com	\N	$2y$10$NuaBe0cAGXUx33kyTZWyKuuhuuElukI0jhlWyFlCcN2aaN6Pfh6Ey	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
145	alumno120	alumno120@gmail.com	\N	$2y$10$bqCnRBOpMTOUdobW5H0z2uAPuftF6GpHM3I5G5LdlVJbpPVNnbhVm	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
146	alumno121	alumno121@gmail.com	\N	$2y$10$9Te6fgY9N2vCiH0mFqHdteeio4NxRfVqSQ8GbEVf0xiYozNV0TnWC	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
147	alumno122	alumno122@gmail.com	\N	$2y$10$LtY8OYM64tzqkcYn0aSw7OdW37TD.hq0sW00CKMVnFaFkqa2dwdo2	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
148	alumno123	alumno123@gmail.com	\N	$2y$10$C0Jhj36D34qLUyThpjqnwuNPgyRvtU9cjyx2SIm/zLpncXKvl0bmO	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
149	alumno124	alumno124@gmail.com	\N	$2y$10$eNDKurh4WEDUpb4VrN45qexMeU9evfbQft0qXEk1EU7T1fI7ZXvj6	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
150	alumno125	alumno125@gmail.com	\N	$2y$10$SnztVdtZYS6g.p/Vx7D1MusYw9Hj7wP7mlL94j0BaBmZugifh9etu	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
151	alumno126	alumno126@gmail.com	\N	$2y$10$LpLGHsRCuUBD9coeeH7Tiu0C4OgY1.xYuEKs/Cg.BptVOpVqY33G2	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
152	alumno127	alumno127@gmail.com	\N	$2y$10$2NdtaxBsBP0.7/2sDirSx.EXt2.sd1fSXZaLzh4Gw2BZAlhbKfRhG	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
153	alumno128	alumno128@gmail.com	\N	$2y$10$9Ruuzjl2.u/VEwN61r/MOO6HB5zqe7wHnKTb.h0yvTCYVZD/Vw6Ey	\N	2018-12-06 20:31:50	2018-12-06 20:31:50
154	alumno129	alumno129@gmail.com	\N	$2y$10$mJAuLqRP9zR6yeQGjLv0XOZIXrdr.ZiJ9NDuHX7bMwOtDZRn/OsgC	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
155	alumno130	alumno130@gmail.com	\N	$2y$10$rpAaAH.UJsTrR8QgUJ/r/.54LRAHo65JpT9KPfUiKTK7W.sj3AuJu	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
156	alumno131	alumno131@gmail.com	\N	$2y$10$5yo.vl9WKB9tLVclQlCbbuNTGjqAIa.Q5rpIZuguoDepX5JeiXcKi	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
157	alumno132	alumno132@gmail.com	\N	$2y$10$WfQfQM2ZSxghUWPeeWlXbuvJ0fxP.JFKAe.0Z6tgRAyWOzp1bu4JO	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
158	alumno133	alumno133@gmail.com	\N	$2y$10$CvipYq/07F0P0vorOeKEG..vH6C0P8qYRaL5W9L1Ahzm7CJ0aMbAm	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
159	alumno134	alumno134@gmail.com	\N	$2y$10$iumgC9XHt/9H2SgMcvzZouXS7B05vvp88wmAMk83AzwayAehWQsKy	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
160	alumno135	alumno135@gmail.com	\N	$2y$10$IEtAFFkgKGZKtTBy8WrLbO5zmXYvWr2PDPtZxZqyFome6z0xIAZMO	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
161	alumno136	alumno136@gmail.com	\N	$2y$10$dNkli1GI9EpNl.T7FAz0iO2IjkAnl8YeJuZLo7zBBZgK2nOzu.JKu	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
162	alumno137	alumno137@gmail.com	\N	$2y$10$124Ofrdj5L43fUQOABe4n.jgr16D0scUnnaKEJrsw7ji9DdqWicd.	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
163	alumno138	alumno138@gmail.com	\N	$2y$10$VEvI82mJj5AmOt2.DHK3ZuDLnAPbXhXIA5z/ns6gGQZNLt60g/Hhm	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
164	alumno139	alumno139@gmail.com	\N	$2y$10$M5WWVJ8MJ9e2ww19HAXk2eTM8M/YBHjTM11HU7A2mvAXdZTgvFewO	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
165	alumno140	alumno140@gmail.com	\N	$2y$10$mQZ7FN0lyYC52DCrM4kCDuOHrS38nG0bljIFPnf1o7ewdjCpU71Lu	\N	2018-12-06 20:31:51	2018-12-06 20:31:51
166	alumno141	alumno141@gmail.com	\N	$2y$10$f0VldtHEDqccCX.WSeLXT.mKDhyW3zV1xjCD2Sm406sSs8ugMsHu.	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
167	alumno142	alumno142@gmail.com	\N	$2y$10$gWn8P90DZ28XG0J00vFIjeucWZ7SXmLK0PIS4Zp3hmwuilzezcvqi	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
168	alumno143	alumno143@gmail.com	\N	$2y$10$f.JPhrWcQCjn4.2j6fc27OoCig1KYOfVi1V3fpgeSuVxV6hi4TMIa	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
169	alumno144	alumno144@gmail.com	\N	$2y$10$rKevTAj7HirB7J0PimJlX.bzPqYzsM4UBNwmDUubYCtkPboB0CmXm	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
170	alumno145	alumno145@gmail.com	\N	$2y$10$uWntiPh3CbXOJtJLL.8b8uV26xYp4CMFJqoUU5nvl7vjYhEtC13am	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
171	alumno146	alumno146@gmail.com	\N	$2y$10$e4n0kCoEsj3QZ9IyAGXG/uZodVAVRlo0Psi8BDgSiO1kDDs5eENAS	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
172	alumno147	alumno147@gmail.com	\N	$2y$10$20N/GuKDOuN1jg1Y5AxZAOEjuaVxgMF4rZpMyB/4BQ0oQx04oBObu	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
173	alumno148	alumno148@gmail.com	\N	$2y$10$EtMxfmrjLdVdFjEEfgA2Xet8S8IpUEuHhMRu5ooNRTzIHAeUsBc2W	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
174	alumno149	alumno149@gmail.com	\N	$2y$10$5x5DTsZJinDM1HmVQtSUA.jlNhIrSNJgMjM3Ch93.9MoS8reXeffq	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
175	alumno150	alumno150@gmail.com	\N	$2y$10$J.ZeJpsWcSylSxgjDmV/AetvlJClg2Y8GVfjDERD0LDyRCWHHs7om	\N	2018-12-06 20:31:52	2018-12-06 20:31:52
\.


--
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: ricardo
--

COPY public.workers (id, rfc, salary, user_info) FROM stdin;
307	rfc2018120625	5340	25
2	rfcricardo123	4000	16
3	rfcabril12345	4000	21
308	rfc2018120626	8174	26
309	rfc2018120627	9254	27
310	rfc2018120628	7228	28
311	rfc2018120629	5618	29
312	rfc2018120630	6306	30
313	rfc2018120631	6379	31
314	rfc2018120632	8565	32
315	rfc2018120633	4095	33
316	rfc2018120634	6592	34
317	rfc2018120635	8515	35
318	rfc2018120636	8107	36
319	rfc2018120637	8853	37
320	rfc2018120638	9458	38
321	rfc2018120639	8774	39
322	rfc2018120640	9319	40
323	rfc2018120641	8195	41
324	rfc2018120642	5965	42
325	rfc2018120643	5069	43
326	rfc2018120644	4241	44
327	rfc2018120645	7455	45
328	rfc2018120646	5684	46
329	rfc2018120647	5224	47
330	rfc2018120648	6353	48
331	rfc2018120649	9510	49
332	rfc2018120650	8808	50
333	rfc2018120651	4899	51
334	rfc2018120652	4513	52
335	rfc2018120653	9821	53
336	rfc2018120654	4539	54
337	rfc2018120655	5323	55
338	rfc2018120656	5340	56
339	rfc2018120657	4319	57
340	rfc2018120658	7688	58
341	rfc2018120659	8472	59
342	rfc2018120660	9252	60
343	rfc2018120661	8207	61
344	rfc2018120662	6621	62
345	rfc2018120663	9938	63
346	rfc2018120664	7552	64
347	rfc2018120665	9633	65
348	rfc2018120666	8323	66
349	rfc2018120667	8839	67
350	rfc2018120668	5361	68
351	rfc2018120669	8437	69
352	rfc2018120670	8312	70
353	rfc2018120671	6091	71
354	rfc2018120672	8786	72
355	rfc2018120673	7511	73
356	rfc2018120674	6578	74
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

SELECT pg_catalog.setval('public.group_period_id_seq', 2, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.groups_id_seq', 3, true);


--
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.mensajes_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- Name: notifaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.notifaciones_id_seq', 1, true);


--
-- Name: periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.periods_id_seq', 1, true);


--
-- Name: pesrsonal_information_key_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.pesrsonal_information_key_seq', 3, true);


--
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.role_user_id_seq', 172, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.roles_id_seq', 12, true);


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

SELECT pg_catalog.setval('public.student_group_id_seq', 2, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.students_id_seq', 107, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.subjects_id_seq', 110, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.teachers_id_seq', 53, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.users_id_seq', 175, true);


--
-- Name: workers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ricardo
--

SELECT pg_catalog.setval('public.workers_id_seq', 357, true);


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
-- Name: mensajes mensajes_pk; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_pk PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: notificaciones notifaciones_pk; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notifaciones_pk PRIMARY KEY (id);


--
-- Name: periods periods_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);


--
-- Name: personal_information pesrsonal_information_pkey; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.personal_information
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
-- Name: workers workers_pk; Type: CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pk PRIMARY KEY (id);


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
-- Name: mensajes_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX mensajes_id_uindex ON public.mensajes USING btree (id);


--
-- Name: notifaciones_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX notifaciones_id_uindex ON public.notificaciones USING btree (id);


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

CREATE UNIQUE INDEX pesrsonal_information_key_uindex ON public.personal_information USING btree (key);


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
-- Name: workers_id_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX workers_id_uindex ON public.workers USING btree (id);


--
-- Name: workers_rfc_uindex; Type: INDEX; Schema: public; Owner: ricardo
--

CREATE UNIQUE INDEX workers_rfc_uindex ON public.workers USING btree (rfc);


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
-- Name: mensajes mensajes_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_users_id_fk FOREIGN KEY (origen) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mensajes mensajes_users_id_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_users_id_fk_2 FOREIGN KEY (destinatario) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personal_information pesrsonal_information_genders_key_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.personal_information
    ADD CONSTRAINT pesrsonal_information_genders_key_fk FOREIGN KEY (gender) REFERENCES public.genders(key) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personal_information pesrsonal_information_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.personal_information
    ADD CONSTRAINT pesrsonal_information_users_id_fk FOREIGN KEY (user_info) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_user role_user_roles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_roles_id_fk FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_user role_user_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: segments_group segments_group_groups_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.segments_group
    ADD CONSTRAINT segments_group_groups_id_fk FOREIGN KEY ("group") REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: segments_group segments_group_segments_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.segments_group
    ADD CONSTRAINT segments_group_segments_id_fk FOREIGN KEY (segment) REFERENCES public.segments(id) ON UPDATE CASCADE ON DELETE CASCADE;


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
-- Name: students students_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_users_id_fk FOREIGN KEY (user_info) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teachers teachers_workers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_workers_id_fk FOREIGN KEY (worker_id) REFERENCES public.workers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: workers workers_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ricardo
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_users_id_fk FOREIGN KEY (user_info) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

