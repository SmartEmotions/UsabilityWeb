--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: developmentpractice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE developmentpractice (
    prac_id integer NOT NULL,
    prac_meth character varying(4) NOT NULL,
    prac_name character varying(500),
    prac_desc text,
    prac_type character varying(100)
);


ALTER TABLE developmentpractice OWNER TO postgres;

--
-- Name: developmentpractice_prac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE developmentpractice_prac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE developmentpractice_prac_id_seq OWNER TO postgres;

--
-- Name: developmentpractice_prac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE developmentpractice_prac_id_seq OWNED BY developmentpractice.prac_id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: efforts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE efforts (
    id integer NOT NULL,
    name text NOT NULL,
    type character varying(100),
    year character varying(5),
    development character varying(2),
    usability character varying(2),
    metodologies character varying(200),
    tools character varying(200),
    frameworks character varying(200),
    state character varying(20)
);


ALTER TABLE efforts OWNER TO postgres;

--
-- Name: efforts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE efforts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE efforts_id_seq OWNER TO postgres;

--
-- Name: efforts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE efforts_id_seq OWNED BY efforts.id;


--
-- Name: gradeworks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gradeworks (
    work_id integer NOT NULL,
    work_name character varying(1000),
    work_year character varying(4),
    work_uevalu boolean,
    work_status character varying(2),
    work_type character varying(100),
    work_develo boolean
);


ALTER TABLE gradeworks OWNER TO postgres;

--
-- Name: gradeworks_work_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gradeworks_work_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gradeworks_work_id_seq OWNER TO postgres;

--
-- Name: gradeworks_work_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gradeworks_work_id_seq OWNED BY gradeworks.work_id;


--
-- Name: heuristicevaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE heuristicevaluation (
    ue_id integer NOT NULL,
    ue_applica integer NOT NULL,
    ue_sysvisi numeric(5,2),
    ue_usrlang numeric(5,2),
    ue_ctrfree numeric(5,2),
    ue_constan numeric(5,2),
    ue_feedbak numeric(5,2),
    ue_errprev numeric(5,2),
    ue_flexefi numeric(5,2),
    ue_edminim numeric(5,2),
    ue_helpdoc numeric(5,2)
);


ALTER TABLE heuristicevaluation OWNER TO postgres;

--
-- Name: heuristicevaluation_ue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE heuristicevaluation_ue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE heuristicevaluation_ue_id_seq OWNER TO postgres;

--
-- Name: heuristicevaluation_ue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE heuristicevaluation_ue_id_seq OWNED BY heuristicevaluation.ue_id;


--
-- Name: methodologies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE methodologies (
    method_id character varying(4) NOT NULL,
    method_name character varying(100)
);


ALTER TABLE methodologies OWNER TO postgres;

--
-- Name: practiceevaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE practiceevaluation (
    pe_id integer NOT NULL,
    pe_applic integer NOT NULL,
    pe_practi integer,
    pe_status boolean,
    pe_dateti timestamp without time zone
);


ALTER TABLE practiceevaluation OWNER TO postgres;

--
-- Name: practiceevaluation_pe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE practiceevaluation_pe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practiceevaluation_pe_id_seq OWNER TO postgres;

--
-- Name: practiceevaluation_pe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE practiceevaluation_pe_id_seq OWNED BY practiceevaluation.pe_id;


--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    user_id integer NOT NULL,
    activated boolean NOT NULL
);


ALTER TABLE registration_registrationprofile OWNER TO postgres;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registration_registrationprofile_id_seq OWNER TO postgres;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


--
-- Name: registration_supervisedregistrationprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE registration_supervisedregistrationprofile (
    registrationprofile_ptr_id integer NOT NULL
);


ALTER TABLE registration_supervisedregistrationprofile OWNER TO postgres;

--
-- Name: webaplications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webaplications (
    app_id integer NOT NULL,
    app_metho character varying(4),
    app_cmenb smallint,
    app_entit character varying(20),
    app_secto character varying(100),
    app_produ boolean,
    app_trodu character varying(50),
    app_updat date,
    app_dupda text,
    app_lback character varying(500),
    app_lfron character varying(500),
    app_nsgdb character varying(100),
    app_bfram character varying(100),
    app_appse character varying(100),
    app_tcost character varying(50),
    app_qualf numeric(3,0),
    app_ffram character varying(100)
);


ALTER TABLE webaplications OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: developmentpractice prac_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY developmentpractice ALTER COLUMN prac_id SET DEFAULT nextval('developmentpractice_prac_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: efforts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY efforts ALTER COLUMN id SET DEFAULT nextval('efforts_id_seq'::regclass);


--
-- Name: gradeworks work_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gradeworks ALTER COLUMN work_id SET DEFAULT nextval('gradeworks_work_id_seq'::regclass);


--
-- Name: heuristicevaluation ue_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY heuristicevaluation ALTER COLUMN ue_id SET DEFAULT nextval('heuristicevaluation_ue_id_seq'::regclass);


--
-- Name: practiceevaluation pe_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY practiceevaluation ALTER COLUMN pe_id SET DEFAULT nextval('practiceevaluation_pe_id_seq'::regclass);


--
-- Name: registration_registrationprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add registration profile	7	add_registrationprofile
20	Can change registration profile	7	change_registrationprofile
21	Can delete registration profile	7	delete_registrationprofile
22	Can add supervised registration profile	8	add_supervisedregistrationprofile
23	Can change supervised registration profile	8	change_supervisedregistrationprofile
24	Can delete supervised registration profile	8	delete_supervisedregistrationprofile
25	Can add efforts	9	add_efforts
26	Can change efforts	9	change_efforts
27	Can delete efforts	9	delete_efforts
28	Can add gradeworks	10	add_gradeworks
29	Can change gradeworks	10	change_gradeworks
30	Can delete gradeworks	10	delete_gradeworks
31	Can add webaplications	11	add_webaplications
32	Can change webaplications	11	change_webaplications
33	Can delete webaplications	11	delete_webaplications
34	Can add developmentpractice	12	add_developmentpractice
35	Can change developmentpractice	12	change_developmentpractice
36	Can delete developmentpractice	12	delete_developmentpractice
37	Can add methodologies	13	add_methodologies
38	Can change methodologies	13	change_methodologies
39	Can delete methodologies	13	delete_methodologies
40	Can add heuristicevaluation	14	add_heuristicevaluation
41	Can change heuristicevaluation	14	change_heuristicevaluation
42	Can delete heuristicevaluation	14	delete_heuristicevaluation
43	Can add gradeworks	15	add_gradeworks
44	Can change gradeworks	15	change_gradeworks
45	Can delete gradeworks	15	delete_gradeworks
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 45, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$36000$Mq6Gjl95LZbc$Po2QSvbn6IKiqaFTqOXT6K7vzlaaJjUbhVIiGTXdSTA=	2017-10-26 17:11:27-05	t	carlos	Carlos Hernan	Guadir Aza	carlos@udenar.edu.co	t	t	2017-10-26 17:11:05-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: developmentpractice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY developmentpractice (prac_id, prac_meth, prac_name, prac_desc, prac_type) FROM stdin;
\.


--
-- Name: developmentpractice_prac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('developmentpractice_prac_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-10-26 17:12:07.931043-05	1	carlos	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	4	3
2	2017-10-26 17:12:47.63545-05	1	carlos	3		4	3
3	2017-10-26 17:12:47.637933-05	2	carlosguadir	3		4	3
4	2017-10-26 17:13:32.700365-05	3	carlos	2	[{"changed": {"fields": ["username", "first_name", "last_name"]}}]	4	3
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 4, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	registration	registrationprofile
8	registration	supervisedregistrationprofile
9	Analisys	efforts
10	Population	gradeworks
11	Population	webaplications
12	Methodologies	developmentpractice
13	Methodologies	methodologies
14	UsabilityEvaluation	heuristicevaluation
15	GradeWorks	gradeworks
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 15, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-05-07 09:09:43.714929-05
2	auth	0001_initial	2017-05-07 09:09:47.851848-05
3	admin	0001_initial	2017-05-07 09:09:48.32445-05
4	admin	0002_logentry_remove_auto_add	2017-05-07 09:09:48.463773-05
5	contenttypes	0002_remove_content_type_name	2017-05-07 09:09:48.645256-05
6	auth	0002_alter_permission_name_max_length	2017-05-07 09:09:48.746509-05
7	auth	0003_alter_user_email_max_length	2017-05-07 09:09:48.868726-05
8	auth	0004_alter_user_username_opts	2017-05-07 09:09:48.935404-05
9	auth	0005_alter_user_last_login_null	2017-05-07 09:09:49.093674-05
10	auth	0006_require_contenttypes_0002	2017-05-07 09:09:49.146944-05
11	auth	0007_alter_validators_add_error_messages	2017-05-07 09:09:49.212406-05
12	auth	0008_alter_user_username_max_length	2017-05-07 09:09:49.439002-05
13	sessions	0001_initial	2017-05-07 09:09:49.981697-05
14	Analisys	0001_initial	2017-10-15 09:55:30.321802-05
15	Methodologies	0001_initial	2017-10-15 09:55:30.415556-05
16	Population	0001_initial	2017-10-15 09:55:30.415556-05
17	UsabilityEvaluation	0001_initial	2017-10-15 09:55:30.431189-05
18	registration	0001_initial	2017-10-15 09:55:31.337495-05
19	registration	0002_registrationprofile_activated	2017-10-15 09:55:31.665599-05
20	registration	0003_migrate_activatedstatus	2017-10-15 09:55:31.759325-05
21	registration	0004_supervisedregistrationprofile	2017-10-15 09:55:32.024991-05
22	GradeWorks	0001_initial	2017-10-15 10:27:09.979059-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 22, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
svy97vbfno9a2mww0dljgei5810360jj	YTIxN2Q4OTVlOTJkZTUyM2Q3ZmQzMWYwNDYzOTA1NWM4OGJmNjdjMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDJlZTdhNDViYWQ4MTUwMjIyNWVmOGQwZDFiMTZkODFhMzhlMThhIn0=	2017-10-29 10:30:34.269231-05
xsf3d7sof8kbuy0c0tv7zyg18exzzjcl	N2NjMGQzYTY2MDE0OWE5ZDYzOTI1NTc1YTZkMzQxNjBlZDUyZDU4Mzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NGRlNmY0ZDRiNzA5YjFiMzdjMGE3MmFmZjQwOWFjZDhhZGU5NTk1In0=	2017-11-09 17:11:27.622235-05
\.


--
-- Data for Name: efforts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY efforts (id, name, type, year, development, usability, metodologies, tools, frameworks, state) FROM stdin;
1250	SISTEMA DE GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN (SGSI) BASADO EN LA NORMA ISO 27001 Y 27002 PARA LA UNIDAD DE INFORMÁTICA Y TELECOMUNICACIONES DE LA UNIVERSIDAD DE NARIÑO	Auditoria y Seguridad	2014	No	No	Magerit, ISO 27001, ISO 27002			Terminado
1251	GAMELI-1 SOFTWARE PARA LA GESTIÓN DE HISTORIAS CLINICAS Y CITAS MÉDICAS EN LINEA PARA HOSPITALES PÚBLICOS DE NIVEL 1	Aplicativo Web	2016	Si	No	RUP	PHP, HTML, JavaScript, CSS	JQuery	Terminado
1252	GEOCODIFICADOR DE EVENTOS GEORREFERENCIADOS A NIVEL DE DIRECCIONES URBANAS PARA LA IDENTIFICACION DE PATRONES DELICTIVOS FATALES Y NO FATALES EN ZONAS ESPECÍFICAS DEL MUNICIPIO DE PASTO	Bases de Datos y Mineria de Datos	2016	Si	No	Investigacion Exploratoria, MVC	PostgreSQL, JAVA, JDBC, GlassFish	PL/PgSQL, GeoCode, UML, Java Server Faces (JSF), OpenLayers, Primefaces, Highcharts, Bing Maps, Open Street Maps	Terminado
1253	MEDICIÓN DE LA CALIDAD DEL SISTEMA DE INFORMACION GEORREFERENCIADO DEL OBSERVATORIO DEL DELITO DE PASTO - SIGEODEP UTILIZANDO LA NORMA ISO/IEC 9126	Ingenieria De Software	2014	Si	Si	ISO/IEC 9126			Terminado
1254	COKOA – HERRAMIENTA  PARA EL SEGUIMIENTO ACADÉMICO DE LOS ESTUDIANTES  DE EDUCACIÓN BÁSICA SECUNDARIA DEL LICEO DE LA UNIVERSIDAD DE NARIÑO	Aplicativo Movil Android, Aplicativo Web	2017	Si	No	MVC, XP	PostgreSQL, Node JS, GNU/Linux	Angular JS	Terminado
1255	AUDITORÍA AL MÓDULO DE FACTURACIÓN DEL SISTEMA DE INFORMACIÓN “DINÁMICA GERENCIAL HOSPITALARIA” DEL HOSPITAL UNIVERSITARIO DEPARTAMENTAL DE NARIÑO E.S.E.	Auditoria y Seguridad	2014	Si	No	ISO/IEC 27001, CoBit, CMM	Checklist		Terminado
1256	TECNICAS DE AUDITORIA DE SISTEMAS APLICADAS AL PROCESO DE CONTRATACION  Y PAGINAS WEB EN ENTIDADES OFICIALES DEL DEPARTAMENTO DE NARIÑO	Auditoria y Seguridad	2010	No	No	CoBit, COSO	Checklist		Terminado
1257	SISTEMA DE INFORMACION DE LA VICERRECTORÍA DE INVESTIGACIONES, POSTGRADOS Y RELACIONES INTERNACIONALES DE LA UNIVERSIDAD DE NARIÑO. MÓDULO ACTOS ADMINISTRATIVOS  Y MÓDULO PRESUPUESTO	Aplicativo Web	2017	Si	No	UML, RUP Agil	MySQL, JavaScript,  C++, C#, J#	ASP.NET, COM	Terminado
1258	APLICACIÓN DE TÉCNICAS DE VISUALIZACIÓN DE DATOS PARA LA INTELIGENCIA DE NEGOCIOS	Bases de Datos y Mineria de Datos	2015	Si	No	UML, Scrum	Java, JavaScript	Chart.js, D3.js, InfoVis.js, Vis.js	Terminado
1259	SINF-27: SOFTWARE DE APOYO PARA AUDITORÍA A LA SEGURIDAD INFORMATICA Y DE LA INFORMACION BASADO EN LA NORMA ISO 27001 E ISO 27002.	Gestion De Seguridad y Control	2016	Si	No	ISO27001, ISO 27002, Magerit	Java, JDBC		Terminado
1260	EVALUACION DE PORTALES WEB EN CUANTO AL  CUMPLIMIENTO DE NORMAS DEL  MINISTERIO DE SALUD  APLICANDO LA NORMA ISO/IEC 9126 DE CALIDAD DE SOFTWARE PARA LAS ENTIDADES PÚBLICAS DE SALUD  DEL DEPARTAMENTO DE NARIÑO	Ingenieria De Software, Evaluacion de Calidad	2015	No	Si	ISO/IEC 9126	Listas de Chequeo, Observacion Directa		Terminado
1261	SISTEMATIZACIÓN DE LOS PROCESOS DE ALMACENAMIENTO Y ADMINISTRACIÓN DE VALORACIONES ACADÉMICAS PARA EL CENTRO EDUCATIVO “ANTONIO RICAURTE, UBICADO EN EL MUNICIPIO DE RICAURTE NARIÑO	Aplicativo Web	2016	Si	No	RUP, MVC	Java, PostgreSQL	Java JEE, Java Servlets, Java Server, JDBC, GlassFish	Terminado
1262	“KNOW TUMACO” APLICACIÓN WEB-MÓVIL CON REALIDAD AUMENTADA PARA LA PROMOCIÓN TURÍSTICA DEL MUNICIPIO DE TUMACO	Aplicativo Movil Android, Aplicativo Web	2016	Si	No	XP, MVC	Android, Unity, HTML, CSS, JavaScript, SDK Android, UML, SQL Server	.NET, JQuery	Terminado
1263	CERES - PLATAFORMA WEB-MÓVIL DE DIFUSIÓN Y COMERCIALIZACIÓN DE PRODUCTOS DEL CAMPO PARA EL BENEFICIO DEL AGRICULTOR NARIÑENSE	Aplicativo Movil Android, Aplicativo Web	2016	Si	Si	Scrum	UML, Python, Nignx, JavaScript, Android SDK, PostgreSQL	Bootstrap	Terminado
1264	ACTUALIZACIÓN DEL SOFTWARE FINANCIAL BUSINESS SYSTEM DE LA CORPORACIÓN NARIÑO EMPRESA Y FUTURO CONTACTAR MEDIANTE SU MIGRACIÓN A LA TECNOLOGÍA WINDOWS COMMUNICATION FOUNDATION	Aplicativo Web ( Pasantia )	2016	Si	No		SOA, SOAP, WCF, Business Financial System, Json		Terminado
1265	"EVALUACIÓN DE CALIDAD EXTERNA CON LA NORMA ISO/IEC 25000 AL ""SISTEMA DE GESTIÓN DE DOCUMENTOS Y PQRD"" DE LA GOBERNACIÓN DE NARIÑO."	Ingenieria De Software	2016	No	Si	ISO/IEC 25000, CMMI, McCall, Boehm			
1266	VISUALIZACIÓN DEL POTENCIAL DE RADIACIÓN SOLAR EN EL DEPARTAMENTO DE NARIÑO UTILIZANDO SERIES DE TIEMPO A PARTIR DE IMÁGENES SATELITALES	Software Y Manejo de Informacion	2016	No	No				Terminado
1267	SOFTWAREMULTIMEDIA DE APOYO PARA LOS PROCESOS DE EXPORTACIÓN E IMPORTACIÓN EN LA REGIÓN	Software Multimedia	2013	Si	No	Incremental		.NET	Terminado
1268	TRIPODE: UN CATÁLOGO DE PATRONES ASPECTUALES DE ANÁLISIS PARA EL DOMINIO POS BASADO EN MORENA	Ingenieria De Software	2010	No	No	MEDUSA, ESKEMA, MORENA			Terminado
1269	APROPIACION DE LA PLATAFORMA VIRTUAL SAKAI Y ANALISIS DE FUNCIONALIDAD CON LA PLATAFORMA MOODLE	Auditoria y Seguridad	2010	No	No		Moodle		Terminado
1270	ATLESIBACO SISTEMA BASADO EN EL CONOCIMIENTO EN ATLETISMO PARA MEJORAR EL DESEMPEÑO DE LOS DEPORTISTAS EN SEMIFONDO Y FONDO	Software Y Manejo de Informacion	2012	Si	No	Investigacion Cuantitativa	IA, Arquitectura IA		Terminado
1271	CURRICULO ADAPTATIVO INTELIGENTE BASADO EN  ONTOLOGIAS DE DESCRIPCIÓN DE COMPETENCIAS PARA EL PROGRAMA DE INGENIERIA DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO	Construccion De Software Inteligente	2012	Si	No	Ontologias, Learning Object Metadata(LOM),	UML, OWL, RDF, XML, Java, MySQL	Jena	Terminado
1272	SISTEMA DE INFORMACIÓN DE MANEJO DE VERTIMIENTOS PARA LA SUBDIRECCIÓN DE CONOCIMIENTO Y EVALUACIÓN AMBIENTAL DE CORPONARIÑO	Aplicativo Web	2010	Si	No	Incremental	PostgreSQL, JAVA, JAVA Persistence	Java Server Faces, GlassFish, JDBC, NetBeans	Terminado
1273	TECNICAS DE AUDITORIA DE SISTEMAS APLICADAS AL PROCESO DE CONTRATACION Y PAGINAS WEB EN LA GOBERNACIÓN DE NARIÑO E INSTITUTO DEPARTAMENTAL DE SALUD NARIÑO	Auditoria y Seguridad	2011	No	Si	CoBit, CICA, SysTrust, CMMI, ISO/IEC 27001			Terminado
1274	CAJA DE POLINOMIOS WEB MÓVIL	Aplicativo Movil Android, Aplicativo Web	2015	Si	No		CSS, HTML, GNU/Linux, C#, JavaScript, Java	 JDK, SDK Android	Terminado
1275	IMPLEMENTACION DEL SISTEMA DE GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN DEL DEPARTAMENTO DE SISTEMAS DE LA CORPORACIÓN UNIVERSITARIA AUTÓNOMA DE NARIÑO EN BASE A LAS NORMAS ISO/IEC  27001 - 27002	Auditoria y Seguridad	2016	No	Si	ISO/IEC 27001, ISO/IEC 27002, Magerit Version 3	Entrevista, Checklist		Terminado
1276	SISTEMA DE INFORMACIÓN PARA GESTIÓN DE SOLICITUDES DE SERVICIOS Y CONTROL DE LA DOCUMENTACIÓN DEL ARCHIVO AUDIOVISUAL PARA EL CENTRO DE COMUNICACIONES DE LA UNIVERSIDAD DE NARIÑO	Aplicativo Web	2012	Si	No	UML, RUP	PHP, HTML, JavaScript, CSS, Apache, MySQL, WinSis	Ajax, Xajax, JQuery, XXAMP, LibChart, TableSorter	Terminado
1277	SOFTWARE DE APOYO AL SISTEMA DE INFORMACIÓN PARA LA ADMINISTRACIÓN DE INDICADORES DE GESTIÓN DE CALIDAD EN LA UNIVERSIDAD DE NARIÑO, MÓDULO PROCESOS ESTRATEGICOS Y MÓDULO PROCESOS DE EVALUACIÓN	Aplicativo Web	2010	Si	No		C#, PostgreSQL 8.4, ISS	ASP.NET Version 3.5	Terminado
1278	SOFTWARE DE APOYO AL SISTEMA DE INFORMACIÓN PARA LA ADMINISTRACIÓN DE INDICADORES DE GESTIÓN DE CALIDAD EN LA UNIVERSIDAD DE NARIÑO, MÓDULO PROCESOS MISIONALES Y MÓDULO PROCESOS DE APOYO	Aplicativo Cliente Servidor Escritorio	2010	Si	No		C#, PostgreSQL 8.4, ISS	ASP.NET Version 3.5	Terminado
1279	ANÁLISIS, DISEÑO, DESARROLLO E IMPLEMENTACIÓN  DEL MÓDULO DE SEGUIMIENTO A PROYECTOS RADICADOS EN EL BANCO DE PROYECTOS, ACOPLADO AL SISTEMA INTEGRAL DE INFORMACIÓN (SII) DE LA ALCALDIA MUNICIPAL DE PASTO	Aplicativo Web ( Pasantia )	2011	Si	Si		PHP Version 5.3.4, JavaScript, HTML, CSS, PostgreSQL Version 8.3, Apache Version 2.2.17	Xajax, JQuery, Ajax, XAMPP Version 1.7.3	Terminado
1280	ANÁLISIS Y DISEÑO DEL MÓDULO DE CONTRATACIONES DE  LA UNIVERSIDAD DE NARIÑO	Ingenieria De Software	2010	No	No	UML			Terminado
1281	“AL - KHWARIZMI” - SISTEMA PARA EL APOYO DE LOS PROCESO DE ENSEÑANZA-APRENDIZAJE DEL ALGEBRA DE LOS POLINOMIOS UTILIZANDO LA CAJA DE POLINOMIOS, DIRIGIDO A  ESTUDIANTES DE  EDUCACIÓN SECUNDARIA, BASADO EN LA LÚDICA Y EL JUEGO	Video Juego X-Box, Video Juego Movil, Video Juego Escritorio	2010	Si	Si	RUP, UML	C#, Java, Adobe Web Premiun CS3, Microsoft Expression, Autodesk Maya Version 2009	ASP.NET Version 3.5, DirectX	Terminado
1282	SISTEMA WEB PARA LA ADMINISTRACIÓN Y GESTIÓN INVESTIGATIVA DEL SISTEMA DE INVESTIGACIONES DE LA UNIVERSIDAD DE NARIÑO. MÓDULO GESTIÓN DE CATEGORÍAS DEL ESTATUTO DEL INVESTIGADOR	Aplicativo Web	2010	Si	No	UML, RUP Agil, OOD	C++, C#, J#, JavaScript, HTML, Visual Basic, Visual C++, MySQL Version 5.1	ASP.NET Version 3.5. WebForms, ODBC, Enterprise Architect Version 7.5	Terminado
1283	MOVIC-DESARROLLO E IMPLEMENTACIÓN DE UNA APLICACIÓN MOVIL EN iOS y ANDROID PARA CONSULTAS ACADÉMICAS DE LA UNIVERSIDAD DE NARIÑO.	Aplicativo Movil Android, Aplicativo Movil IOS	2016	Si	No	RUP Agil (AUP)	Xamarin, Android OS, IOS	SDK Android	Terminado
1284	ADMINISTRACIÓN Y APOYO A LA OPERACIÓN DEL PUNTO VIVE DIGITAL PLUS DE LA IEM TÉCNICO INDUSTRIAL DE PASTO, EN EL MARCO DEL PLAN VIVE DIGITAL 2010-2014 DEL MINISTERIO DE LAS TECNOLOGÍAS DE LA INFORMACIÓN Y LAS COMUNICACIONES.	Auditoria y Seguridad (Pasantia)	2016	No			Formatos Verificacion, Documentacion de Manuales		
1285	SISTEMA DE INFORMACIÓN ORIENTADO A LA WEB PARA EL MANEJO Y ADMINISTRACIÓN DE PROCESOS JUDICIALES DE LA FISCALÍA GENERAL DE LA NACIÓN – SECCIONALES NARIÑO	Aplicativo Web	2016	Si	No	DRA, Prototipado, Modelo Incremental, Modelo Espiral	MySQL, Apache, JavaScript, CSS, Entrevistas, Muestreo, Observacion Directa	LibChart, Bootstrap, Fpdf	Terminado
1286	EVALUACIÓN DE LOS PROCESOS ACADÉMICOS Y ADMINISTRATIVOS DE LA UNIVERSIDAD DE  NARIÑO VIRTUAL BASADA EN LA NORMA TÉCNICA COLOMBIANA ISO 9001:2008	Auditoria y Seguridad	2012	No		ISO 9001	Encuesta		Terminado
1287	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA DE TECNOLOGÍA E INFORMÁTICA DE GRADO NOVENO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	Software Multimedia	2014	--	Si	COLOSUS, MOT	Flash CS5	JclickAutor	
1288	EDUCACIÓN MATEMÁTICA PERTINENTE A LA FORMACIÓN DEL INGENIERO DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO	Investigacion Exploratoria	2014	No	No				Terminado
1289	ASISTENCIA DE INVESTIGACIÓN Y DESARROLLO DEL PLAN DE ENERGIZACIÓN RURAL SOSTENIBLE PARA EL DEPARTAMENTO DE NARIÑO (PERS-Nariño)	Pasantia	2014	No	No		Encuesta, Mobile Security Antivirus, AVG Mobile Tecnologies, GPS Status, ToolBox, Olive Office Premium, ArGis Online		Terminado
1290	SIGLHA – SISTEMA DE INFORMACIÓN DE GLOBAL HUMANITARIA PARA EL MANEJO DEL PROGRAMA DE APADRINAMIENTO  EN COLOMBIA	--	2014	Si		RAD			Terminado
1291	SISTEMA DE INFORMACIÓN DEL FONDO DE SEGURIDAD SOCIAL EN SALUD DE LA UNIVERSIDAD DE NARIÑO MODULO DE APOYO A PROGRAMAS DE PROMOCIÒN Y PREVENCIÒN DE LA SALUD	Aplicativo Web	2014	Si	Si	XP	HTML, JavaScript, CSS, PHP, PostgreSQL	ScriptCase, JQuery, Ajax	Terminado
1292	PROTOTIPO DE SISTEMA DE RESTRICCIONES PARA DISPOSITIVOS MÓVILES	Aplicativo Movil Android	2014	Si	No	RUP, UML	Java, C++	Choco, Gecode, NDK, SDK	Terminado
1293	“ELVES” SISTEMA DE ENTRENAMIENTO DE ESCRITURA PARA LA PRIMERA INFANCIA	Video Juego X-Box	2014	Si	No	AUP	Windows 7 ++, Visual Estudio Version 4 ++, Microsoft DirectX SDK, Microsoft DirectX End-User Runtimes, Unity 3D Version 4.1.5, Blend for visual studio 2012 Version 5.0.4, Adobe Ilustrator	.NET, Microsoft Speech Platform SDK Version 11, Microsoft Speech Platform Runtime Version 11, Microsoft XNA Game Studio Version 4.0, Microsoft XNA Framework Redistributable Version 4.0	Terminado
1294	SISTEMA DE INFORMACIÓN DEL FONDO DE SEGURIDAD SOCIAL EN SALUD DE LA UNIVERSIDAD DE NARIÑO MÓDULO HISTORIAS CLÍNICAS MÉDICAS Y ODONTOLÓGICAS	Aplicativo Web	2014	Si	Si	XP, UML	JavaSript, HTML, PHP, PostgreSQL	Ajax, ScriptCase	Terminado
1295	“PASTO AR” – APLICACIÓN MÓVIL PARA LA PROMOCIÓN TURÍSTICA DE LA CIUDAD DE PASTO CON REALIDAD AUMENTADA PARA ANDROID	Aplicativo Movil Android	2015	Si	Si	XP	Unity, C#		Terminado
1296	CREACIÓN E IMPLEMENTACIÓN DE UN MÓDULO SOFTWARE PARA LA GESTIÓN DEL ARCHIVO Y DE LOS PROCESOS ADMINISTRATIVOS DE LA PROCURADURÍA DE INFANCIA, ADOLESCENCIA Y FAMILIA SEDE  PASTO	Aplicativo Cliente Servidor Escritorio	2014	Si	No	OOD, XP	 SQL SERVER 2008, C#	Visual Studio 2010 Express Edition, CRC	Terminado
1297	EVALUACIÓN DE LOS PORTALES WEB GUBERNAMENTALES CON RESPECTO A LA USABILIDAD Y CUMPLIMIENTO DEL DECRETO DE GOBIERNO EN LÍNEA PARA LOS MUNICIPIOS DEL DEPARTAMENTO DE NARIÑO	Evaluacion de Calidad de Software	2015	No		 ISO/IEC 9126	Checklist		Terminado
1298	SISTEMA DE INFORMACIÓN PARA LA GESTIÓN DE ESPACIOS, RECURSOS Y SERVICIOS DE LA UNIDAD DE INFORMÁTICA Y TELECOMUNICACIONES (UIT) DE LA UNIVERSIDAD DE NARIÑO	Aplicativo Web	2014	Si	No	XP ( No Especifica)	SQL Server 2012, HTML, CSS, PHP	Visual Studio 2013, .NET Version 4.5.1, Agile Portfolio Management, Team Fundation Server 2013	Terminado
1299	APOYO AL PROCESO DE IMPLEMENTACIÓN DE UN SISTEMA DE GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN (SGSI) EN LA ALCALDÍA DE PASTO, BASADO EN LA NORMA ISO 27001:2013 Y BAJO LA DIRECTRIZ DE LA ESTRATEGIA DE GOBIERNO EN LÍNEA VERSIÓN 3.1	Auditoria y Seguridad (Pasantia)	2015	No	No	Estrategia Gobierno En Linea Version 3.0			Terminado
1300	APLICACIÓN PARA ANDROID PARA EL CÁLCULO DE LA AMENAZA RELATIVA FRENTE A FLUJOS PIROCLÁSTICOS	Aplicativo Movil Android	2016	Si	No	XP, Arquitectura de Software, UML, Modelos Matematicos	Titan 2D, Java, Octave, GlasFish	Android Studio, SDK Android, NetBeans, Serverlets	Terminado
1301	AUDITORIA INFORMATICA APLICADA A LA INSTALACION FISICA Y HARDWARE DEL  AULA DE INFORMATICA DE LA INSTITUCION EDUCATIVA SIMON BOLIVAR DEL MUNICIPIO DE SAMANIEGO NARIÑO	Auditoria y Seguridad	2016	No	No	CMM, ISO 9000, CoBit, GAO	Cuestionarios, Entrevistas, Checklist		Terminado
1302	AUDITORIA A LA INFRAESTRUCTURA TECNOLÓGICA DEL SISTEMA DE INFORMACIÓN SALUDIPS DEL CENTRO DE SALUD SAN MIGUEL ARCÁNGEL E.S.E DEL MUNICIPIO DE OSPINA – NARIÑO	Auditoria y Seguridad	2016	No	No	CoBit	Cuestionarios, Entrevistas, Checklist, Observacion, Trazas		Terminado
1303	AUDITORIA A LA INFRAESTRUCTURA TECNOLOGICA  EN LA EMPRESA TEXCOL LTDA. CON SEDE EN LA CIUDAD DE PASTO	Auditoria y Seguridad	2016	No	No	CMM, CoBit	Cuestionarios, Checklist		Terminado
1304	AUDITORIA A LOS PROCESOS DEL SISTEMA INFORMÁTICO Y DE INFORMACIÓN DE LA EMPRESA DE TRANSPORTE TRANSANDES S.A.S DE LA CIUDAD DE IPIALES – NARIÑO	Auditoria y Seguridad	2016	No	No	CMM, CoBit, ISO 27000, ITRB, GAO	Checklist, Trazas, Observacion, Inventarios		Terminado
1305	COAADES - SOFTWARE DE APOYO PARA EL REGISTRO Y CONTROL DE COMISIONES  ACADÉMICAS, ADMINISTRATIVAS Y DE ESTUDIO PARA EL ÁREA DE APOYO JURÍDICO DE VICERRECTORÍA ACADÉMICA DE LA UNIVERSIDAD DE NARIÑO	Aplicativo Movil Android, Aplicativo Web	2016	Si	No	XP	PostgreSQL, Dreamweaver, Xamarin, Android Studio		Terminado
1306	SISTEMA DE INFORMACIÓN DEL FONDO DE SEGURIDAD SOCIAL EN SALUD DE LA UNIVERSIDAD DE NARIÑO MODULO DE MANEJO Y CONTROL DE RIPS	Aplicativo Web	2015	Si	No	XP	JavaScript, PHP, HTML, CSS, PostgreSQL	ScriptCase	Terminado
1307	CHAMILOMOBILE – APLICACIÓN MÓVIL ANDROID PARA LA INTERACCIÓN Y OBTENCIÓN DE INDICADORES DE SEGUIMIENTO,  SINCRONIZADA CON EL LMS CHAMILO DE LA FACULTAD DE INGENIERÍA DE LA UNIVERSIDAD DE NARIÑO	Aplicativo Movil Android	2016	Si	Si	RUP, UML	SQLite, SDK, Java	Android Studio, Json	Terminado
1308	AUDITORÍA INFORMATICA A LA ESTRUCTURA ORGANIZACIONAL Y A LOS PROCESOS DEL AREA DE SISTEMAS EN LA EMPRESA SOCIAL DEL ESTADO HOSPITAL CUMBAL DEL MUNICIPIO DE CUMBAL, DEPARTAMENTO DE NARIÑO	Auditoria y Seguridad	2016	No	No	CoBit			Terminado
1309	EVALUACIÓN DE LOS SISTEMAS WEB CON RESPECTO AL CUMPLIMIENTO DE LOS REQUERIMIENTOS DEL MINISTERIO DE EDUCACION NACIONAL Y BAJO LA NORMA ISO/IEC 9126 PARA LAS INSTITUCIONES EDUCATIVAS MUNICIPALES EN LA CIUDAD DE SAN JUAN DE PASTO - NARIÑO	Auditoria y Seguridad	2016	No	No	ISO/IEC 9126			Terminado
1310	MEDICIÓN Y REGISTRO EN TIEMPO REAL DE CONCENTRACIÓN DE GASES CONTAMINANTES Y NIVELES DE RUIDO EN SECTORES ESPECÍFICOS DE UNA POBLACIÓN	Aplicativo Cliente Servidor Escritorio	2015	No	No	XP	Arduino, GPS, GMS, GPRS, NMEA, M2MP, Python, C++, PostgreSQL Version 9.1.12	Psycopg2	Terminado
1311	DISEÑO PEDAGÓGICO E IMPLEMENTACIÓN DE HERRAMIENTAS PARA EL PROYECTO:  ENSEÑANZA DE LA LÓGICA DE PROGRAMACIÓN UTILIZANDO COMPUTACIÓN GRÁFICA. FASE I	Investigacion Exploratoria ( Pedagogia Computacional)	2015	No	No	Investigacion Exploratoria	QUILQAY, Chamilo Udenar	QtCreator, MinGW	Terminado
1312	AUDITORIA A LA SEGURIDAD DEL SISTEMA DE INFORMACION SIVIGILA DE LA ALCALDÍA DE SAN ANDRÉS DE TUMACO BASADA EN EL ESTÁNDAR  ISO 27001	Auditoria,  Seguridad y Control	2015	No		ISO/IEC 27000	Entrevista, Checklist, Observacion Directa		Terminado
1313	AUDITORÍA A LA SEGURIDAD DE LA INFORMACIÓN EN LA EMPRESA EXPRESO JUANAMBÚ DE LA CIUDAD DE PASTO SOPORTADA EN LOS ESTÁNDARES DE AUDITORÍA COBIT E ISO/IEC 27000	Auditoria, Seguridad y Control	2015	No		CobIT Version 4.1, MagerIT, ISO/IEC 27000	Observacion Directa, Entrevista		Terminado
1314	AUDITORÍA INFORMÁTICA A LA PARTE FÍSICA Y LÓGICA DE LA RED DE DATOS EN LA EMPRESA SOLIDARIA DE SALUD EMSSANAR E.S.S. SEDES CORPORATIVA PASTO Y SEDES ALTO PUTUMAYO	Auditoria, Seguridad y Control	2015	No		CoBit	Entrevista, Checklist, Observacion Directa, Traza, Inventarios, Cuestionarios, Kali Linux	Simuladores (Genaradores de Datos), Paquetes de Auditorias , Matrices De Riesgo	Terminado
1315	SISTEMA DE REALIDAD AUMENTADA PARA PROMOVER Y ENRIQUECER ATRACTIVOS TURÍSTICOS DEL CENTRO HISTÓRICO DE LA CIUDAD DE PASTO “TuristAR”	Aplicativo Movil Android, Aplicativo Web, Libro	2015	SI	No	VRML, UML,	Unity, Target Manager, Marcadores,  ArToolKit,SDK, Android OS, Vifobia		Terminado
1316	REESTRUCTURACIÓN DEL SITIO WEB DEL DEPARTAMENTO DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO Y DESARROLLO DE UNA APLICACIÓN PARA EL SEGUIMIENTO DE PROYECTOS DE GRADO PARA EL DEPARTAMENTO DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO	Aplicativo Web	2015	Si	Si	Scrum	PostgreSQL 9.0, Microsoft Excel, Microsoft Word, Java	NetBeans Version 7.2, Java Server Faces Version 2.1, JasperReport, Java Persistence 2.0	Terminado
1317	DISEÑO E IMPLEMENTACIÓN DE UNA  NUEVA TOPOLOGÍA LÓGICA DE LA RED DE DATOS BASADA EN LA DISTRIBUCIÓN DE ESPACIOS FÍSICOS DEL CAMPUS UNIVERSITARIO DE LA UNIVERSIDAD DE NARIÑO	Redes y Telematica	2015	No	No	OSI, IEEE 802.1Q, IETF	MatLab, Encuesta	Google Forms	Terminado
1318	SISTEMA DE FACTURACIÓN PARA EL SERVICIO DE ENERGÍA ELÉCTRICA Y ACTUALIZACIÓN  DEL SITIO WEB DE LA ALCALDÍA DE CUMBAL	Aplicativo Web	2015	Si	No	Modelo En Cascada, UML	JavaScript, PHP, HTML, CSS, MySQL, GIMP, CorelDraw	XAMPP, JQuery	Terminado
1319	DISEÑO E IMPLEMENTACIÓN DE UN SOFTWARE ADMINISTRATIVO EN LA FUNDACIÓN PREVENIR	Aplicativo Cliente Servidor Escritorio	2015	Si	No	Scrum	SQLServer Version 2008, Hash MD5	DBDesigner, Microsoft Visual Studio Community Version 2013	
1320	SIVENH - SOFTWARE DE MANEJO DE INFORMACIÓN PARA EL REGISTRO Y CONTROL DE CLIENTES Y VENTA DE APARTAMENTOS DE LA EMPRESA NUEVO HORIZONTE S.A.S.	Aplicativo Web ( Pasantia )	2015	Si	No	XP	SQL Server, C#	ASP.NET	Terminado
1321	AWAD - DESARROLLO E IMPLEMENTACIÓN DE APLICACIÓN WEB COMO CANAL DE COMUNICACIÓN ENTRE LA PYME ALPINITA Y SUS CLIENTES DOMICILIADOS.	Aplicativo Web	2017	Si	No	Iweb	Microsoft Office Version 2010, Windows 8, Adobe Ilustrator CC 2016, FileZilla Version 3.14.1, Java	Sublime Text 3, XAMPP Version 3.2.2, Java EE, Google App Engine	Terminado
1322	AUDITORÍA DE SISTEMAS APLICADA A LOS MÓDULOS DE FACTURACIÓN, CONSULTAS E HISTORIA CLÍNICA DEL SOFTWARE INFO-SALUD  EN LA IPS INDÍGENA GUAITARA DEL MUNICIPIO DE IPIALES	Auditoria y Seguridad	2015	No	Si	CoBit	Observacion Directa, Entrevista, Cuestionarios		Terminado
1323	AUDITORÌA AL SISTEMA DE INFORMACIÓN HOSPITALARIO (SIHOS) DEL HOSPITAL CIVIL DE IPIALES BASADO EN EL ESTÁNDAR COBIT 4.1	Auditoria y Seguridad	2016	No	Si	CobIT Version 4.1	Observacion Directa, Entrevista, Cuestionarios, Checklist		Terminado
1324	AUDITORIA INFORMATICA A LOS PROCESOS Y ORGANIZACIÓN DE LA SUBSECRETARIA DE SISTEMAS Y ESTADISTICAS EN LA SECRETARIA DE HACIENDA DEL MUNICIPIO DE IPIALES	Auditoria Informatica	2016	No	No	CobIT	Entrevista, Checklist, Traza, Observacion Directa, Inventarios		Terminado
1325	SISTEMA DE GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN BASADO EN ISO/IEC 27001 EN LA ALCALDÍA DE PUPIALES - NARIÑO	Auditoria, Seguridad y Control	2015	No	No	ISO/IEC 27001, CoBit, MagerIT	Observacion Directa, Entrevista, Encuesta, Checklist, Matriz De Riesgos	BSP	Terminado
1326	VISUALIZACIÓN EN TIEMPO REAL DE INFORMACIÓN SECTORIZADA SOBRE LA CALIDAD DE AIRE Y NIVELES DE CONTAMINACIÓN AUDITIVA	Aplicativo Movil Android, Aplicativo Web	2015	Si	No	RUP, UML	JavaScript, Java, XML, PHP Version 5.3, PostgreSQLVersion 9.5.3, Apache 2.2, GNU/Linux Abuntu 12.10, Android 4.4 API Version 20	API Google Maps, JQuery Version 1.11, HighCharts, PHPExcel	Terminado
1327	AUDITORIA AL PROCESO DE DESARROLLO DE SOFTWARE UTILIZANDO EL MODELO CMMI EN EL CENTRO DE INFORMATICA DE LA UNIVERSIDAD DE NARIÑO	Auditoria, Seguridad y Control	2015	No	No	CMMI, SCAMPI	Checklist, Entrevistas, Cuestionarios, Encuestas		Terminado
1328	AUDITORIA AL PORTAL WEB DEL HOSPITAL UNIVERSITARIO DEPARTAMENTAL DE NARIÑO E.S.E.	Auditoria y Seguridad	2013	No	Si	CobIT, ISO/IEC 9126, Norma 1151 2008	Matriz De Riesgos, Entrevista, Encuesta		Terminado
1329	AUDITORIA AL  SISTEMA  DE  INFORMACIÓN  DINÁMICA GERENCIAL  HOSPITALARIA  EN EL  MÓDULO  DE CITAS  MÉDICAS  PARA   EL  HOSPITAL  UNIVERSITARIO DEPARTAMENTAL  DE NARIÑO E.S.E	Auditoria y Seguridad	2013	No	No	CobIT	Entrevistas, Cuestionarios, Checklist, Encuestas, Inventarios		Terminado
1330	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA DE LENGUA CASTELLANA DEL GRADO QUINTO EN LAS INSTITUCIONES EDUCATIVAS DE NIVEL MEDIO DEL MUNICIPIO DE PASTO	Software Multimedia ( Pedagogia Computacional)	2013	Si	No	COLOSSUS	HTML, JavaScript, CSS, Adobre Flash CS5, Corel Draw	Jclick, ActionScript	Terminado
1331	AUDITORIA DE SISTEMAS APLICADA AL SISTEMA DE INFORMACIÓN DE LA IPS INDÍGENA GUÁITARA DEL MUNICIPIO DE IPIALES	Auditoria, Seguridad y Control	2013	No	No	CobIT, ISO/IEC 27000, COSO			Terminado
1332	SIGED FUNES – SISTEMA DE GESTIÓN DOCUMENTAL PARA LA ALCALDÍA MUNICIPAL DE FUNES	Aplicativo Web	2015	Si	No	UML, RUP	PHP, HTML, JavaScript, CSS, PostgreSQL, Ajax, Apache	Wamp Server, JQuery	Terminado
1333	AUDITORIA DE SISTEMAS APLICADA  AL SISTEMA DE INFORMACIÓN  DE LA COOPERATIVA DEL MAGISTERIO DE TUQUERRES COACREMAT	Auditoria Informatica	2013	No	No	CobIT, COSO	Fotografias, Cuestionarios, Entrevistas, Inventarios, Martriz De Riesgos	Computador, Impresora, Camara Fotografica, Grabadora	Terminado
1334	CONSTRUCCIÓN DE UN REPOSITORIO LIMPIO DE DATOS DE LOS ESTUDIANTES DE LOS PROGRAMAS DE PREGRADO DE LA UNIVERSIDAD DE NARIÑO PARA ANÁLISIS DE DESERCIÓN CON MINERÍA DE DATOS	Bases de Datos y Mineria de Datos	2013	No	Si	KDD, CRISP-DM	PostgreSQL	PL/PgSQL	Terminado
1335	“DOC-KUMENCT” INTERFAZ GESTUAL PARA LA BÚSQUEDA Y LECTURA DE TRABAJOS DE GRADO EN LA BIBLIOTECA ALBERTO QUIJANO GUERRERO DE LA UNIVERSIDAD DE NARIÑO	Software Multimedia	2013	Si	Si	HCI, AUP, UML	Microsoft Kinect, Microsoft Blend, Windows Presentation Foundation	Enterprise Architect, Adobe Creative CS6 Version 6, Adobe Illustrator, Kinect For Windows SDK Version 1.7, Visual Studio, ASP.Net, Microsoft Speech, WPFSpark, SQL Server Version 2012, PDF Viewer	Terminado
1336	APOYO AL PROCESO DE IMPLEMENTACION DE UN SISTEMA DE GESTION DE LA SEGURIDAD DE LA INFORMACION BASADO EN LA NORMA ISO 27001:2013 EN LA ALCALDIA DE PASTO	Auditaria, Seguridad y Control	2015	No	No	ISO 27001	Checklist, Cuestionarios		Terminado
1337	SAC - SISTEMA ORIENTADO A LA WEB PARA SOPORTAR EL PROCESO DE AUTOEVALUACIÓN CON FINES DE ACREDITACIÓN DE LOS PROGRAMAS DE PREGRADO DE LA UNIVERSIDAD DE NARIÑO	Aplicativo Web	2015	Si	No	XP	PHP, JavaScript, PostgreSQL	Modern UI, Codeigniter, PHPMailer, FPDF, Putty	Terminado
1338	AUDITORÍA INFORMÁTICA A LOS PROCESOS Y ORGANIZACIÓN DEL ÁREA DE SISTEMAS EN LA EMPRESA AGROPEZ LTDA DE LA CIUDAD DE IPIALES	Auditoria Informatica	2016	No	No	CobIT	Entrevistas, Cuestionarios, Checklist, Encuestas, Inventarios, Muestreo, Certificacion, Observacion, Matriz De Riesgos, Trazas	Gestores De Datos	Terminado
1339	AUDITORIA A LA INFRAESTRUCTURA  FISICA DE  RED Y EQUIPOS DE COMPUTO DE LA  NOTARÍA PRIMERA DE TÚQUERRES	Auditoria y Seguridad	2016	No	No	CobIT, CMM			Terminado
1340	IMPLEMENTACION DE UN CONTROLADOR DE DOMINIO BAJO WINDOWS SERVER Y UN ROUTERBOARD DE MIKROTIK EN LA RED DE COMPUTADORES DE SYSTEM PLUS  DE LA CIUDAD DE TUQUERRES	Redes y Telematica	2016	No	No	Top-Down Network Design, IEE 802.++	Switch, Acceso Point TP-Link, RouterBoard Mikrotik, Windows Server 2012		Terminado
1341	AUDITORÍA INFORMÁTICA A LOS PROCESOS DEL ÁREA DE SISTEMAS QUE CONTROLAN LA PARTE ACADÉMICA DEL COLEGIO CHAMPAGNAT DE IPIALES – NARIÑO	Auditoria Informatica	2016	No	No	CobIT	Observacion, Encuestas, Inventarios, Entrevista		Terminado
1342	AUDITORÍA DE SISTEMAS APLICADA A LOS MÓDULOS MANEJO DE PLANTAS DE GLP, MANEJO DE BÁSCULAS Y REPORTES DE LA PLATAFORMA SIMER (Sistema Inteligente de Envasado) EN LA PLANTA DE ENVASADO MONTAGAS S.A E.S.P DEL MUNICIPIO DE PASTO	Auditoria, Seguridad y Control	2016	No	No	CobIT	Entrevista, Cuestionario		Terminado
1343	HIMATCH: SISTEMA DE ENLACE SOCIAL BASADO EN PROXIMIDAD QUE FACILITA EL CONTACTO CON PERSONAS DESCONOCIDAS EN SITIOS PÚBLICOS	Aplicación Movil Android, Aplicación Movil IOS, Aplicación Movil BlackBerry ( Pasantia )	2013	Si	No	SERATIC	MAC OS Verion 10.7.1, Java, MySQL Version 5.5	Android SDK, Eclipse Helios Release 2, Java JDK 8, Black Berry SDK Version 7.1, Eclipse Indigo Version 3.7.2, Virtual Box Version 4.2, Xcode Version 4.2, IOS SDK Version 5.0	Terminado
1344	 IMPLEMENTACIÓN DE PRUEBAS DE LOS SUBSISTEMAS DE RECAUDO, CONTROL, INFORMACIÓN Y SERVICIO AL USUARIO DE TRANSMILENIO	Pruebas De Software	2013	No	No	WAY4U, PMBOK, IEEE, CMMI		Proyect Plus	Terminado
1345	AFICOP- APLICACIÓN WEB PARA LOS AFILIADOS DE LAS COOPERATIVAS	Aplicativo Web	2013	Si	No	XP	CRC, Apache Tomcat, PostgreSQL	JavaServer Pages	Terminado
1346	KNOWER - AMBIENTE VIRTUAL PARA LA GESTIÓN DE CONOCIMIENTO PARA INTEGRAR LA LABOR ACADÉMICA E INVESTIGATIVA DE LA FACULTAD DE INGENIERÍADE LA UNIVERSIDAD DE NARIÑO FASE II - OPTIMIZACIÓN Y PUESTA EN FUNCIONAMIENTO	Aplicativo Web, Aplicativo Escritorio	2013	Si	No	RUP	MySQL		Terminado
1347	OBJETOS  VIRTUALES DE APOYO A  LA ASIGNATURA DE LENGUA  CASTELLANA DEL GRADO SÉPTIMO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	Aplicativo Web ( Pedagogia )	2013	Si	No	COLOSSUS, UML	HTML, JavaScript, ActionScript, Adobe Dream Weaver, Adobe CS4, Hot Potatoes, JBC, Corel Draw	Jclick	Terminado
1348	COMPUCONTA - SOFTWARE ORIENTADO AL SECTOR SALUD Y ADMINISTRACIÓN PÚBLICA – MÓDULO DE PAGOS DE NÓMINA Y LIQUIDACIÓN DE PRESTACIONES SOCIALES	Aplicativo Contable ( Pasantia )	2013	Si	No		PHP, HTML, PostgreSQL	NetBeans	Terminado
1349	SISTEMA DE INFORMACIÓN PARA LA ADMINISTRACION DE ACTIVOS FIJOS DE LA EMPRESA DE OBRAS SANITARIAS EMPOPASTO S.A. E.S.P	Aplicativo Web ( Pasantia )	2013	Si	No	POO, UML	PHP, PostgreSQL		Terminado
1350	AUDITORIA AL MODULO DE INVENTARIO DEL SISTEMA DE INFORMACION EN EL  HOSPITAL UNIVERSITARIO DEPARTAMENTAL DE NARIÑO	Auditoria Informatica	2013	No	No	CobIT	Entrevista, Cuestionario, Checklist, Traza		Terminado
1351	AUDITORIA A LA INFRAESTRUCTURA FÍSICA DE LA RED DE DATOS DE LA SEDE PRINCIPAL Y VERIFICACIÓN DEL CUMPLIMIENTO DE LAS NORMAS DE GOBIERNO EN LÍNEA EN LA PÁGINA DE LA ESE CENTRO HOSPITAL DIVINO NIÑO	Auditoria y Seguridad	2013	No	No	CobIT	Datos De Prueba, Scoring, Snapshot, Mapping		Terminado
1352	ANÁLISIS Y DISEÑO DEL AMBIENTE VIRTUAL KNOWER PARA INCLUIR CARACTERÍSTICAS QUE PERMITAN APOYAR LA INTEGRACIÓN DE LA LABOR INVESTIGATIVA EN LAS INSTITUCIONES DE EDUCACIÓN BÁSICA SECUNDARIA Y MEDIA DEL MUNICIPIO DE PASTO Y OBTENER LOS INDICADORES NECESARIOS PARA SU VALIDACIÓN	Investigacion Exloratoria	2016	No	No	UML	Entrevista, Audio, Imagen, Observacion Directa, Documentacion	Enterprise Architect	Terminado
1353	TECNICAS DE AUDITORIA DE SISTEMAS APLICADAS AL PROCESO DE CONTRATACION  Y PAGINAS WEB EN ENTIDADES OFICIALES DEL DEPARTAMENTO DE NARIÑO, ALCALDÍA MUNICIPAL DE TANGUA Y ALCALDÍA MUNICIPAL DE YACUANQUER	Auditoria Informatica	2010	No	Si	CobIT, COSO	Selección, Scoring, BackUP, Snapshot, Maping, Traza		Terminado
1354	POLARIS VERSIÓN 3.0 - Una herramienta para la minería de uso y estructura de la web y análisis estadístico de tráfico web	Bases de Datos y Mineria de Datos (Web Mining), Aplicativo Cliente Servidor Escritorio	2012	Si	No	OpenUP (Agil), POO	Java, PostgreSQL Version 8.2 ++	ANALOG, AWSTATS, Alter Wind Log Analizer, Weblog Expert, NetBeans Version 7.0.1, JDBC, JFreeChart	Terminado
1355	SISTEMA DE INFORMACIÓN DEL FONDO MIXTO DE CULTURA DE NARIÑO ORIENTADO A LA WEB	Aplicativo Web	2010	Si	No	Ingenieria Web	SO Windows XP Pro Servi Pack 3, Windows Server 2008 R2 Enterprise, SQL Server 2005 Express Edition, Microsoft PopFly, Microsoft Office Version 2007		Terminado
1356	SIMART - SISTEMA DE INFORMACIÓN ORIENTADO A LA WEB PARA EL MANEJO DEL ARCHIVO CENTRAL E HISTÓRICO DE LA CIUDAD DE TUQUERRES	Aplicativo Web	2010	Si	No	XP, UML			Terminado
1357	SOFTWARE PARA EL MANEJO DE LOS PROCESOS DE MATRICULA ACADÉMICA Y FINANCIERA DE LA ESCUELA DE MÚSICA DEL CORREGIMIENTO ROSAL DEL MONTE – NARIÑO	Aplicativos Cliente Servidor Escritorio	2012	Si	Si	POO, Modelo En Cascada			Terminado
1358	PLATAFORMA WEB 2.0 PARA UN SISTEMA GPS- GSM/GPRS DE MONITOREO EN TIEMPO REAL PARA EL TRANSPORTE PÚBLICO DE LA CIUDAD DE PASTO	Aplicativo Web	2010	Si	No	XP, Documentacion, Simulacion Digital, Analisis De Riesgos, Cifrado De Datos, UML, Business Intellingence, SOA Specification, Web Engineering, Bitacoras	HTML, JavaScript, C#, SQL Server Version 2008 R2	Visual Studio 2010, ASP.NET	Terminado
1359	SISTEMA DE INFORMACIÓN ORIENTADO A LA WEB COMO HERRAMIENTA DE APOYO A LA EXPEDICIÓN DE CERTIFICADOS LABORALES Y DE APORTES A FONDO DE PENSIÓN DE LOS EX FUNCIONARIOS DE LA ALCALDÍA MUNICIPAL DE PASTO	Aplicativo Web	2012	Si	No	POO, UML	MySQL, PHP, HTML, Apache	Wamp Server 2.1	Terminado
1360	TECNOSOFT – SOFTWARE DE GESTIÓN TECNOLÓGICA HOSPITALARIA PARA EL HOSPITAL CIVIL DE IPIALES	Aplicativo Web	2012	Si	No	XP, POO	Java, PostgreSQL, Historias de Usuario, CRC, Unidades Producto, Pruebas Aceptacion	NetBeans, Swing, Java Server Faces, Java Beans	Terminado
1361	DESARROLLO DE UN WEBSITE EN CUMPLIMIENTO DE LA DIRECTIVA PRESIDENCIAL 002 PARA LA INSTITUCION EDUCATIVA OSPINA PEREZ	Aplicativo Web	2012	Si	No	XP	Apache, MySQL, PHP, Photshop CS3, DreamWeaver CS3	Wamp Server Version 2.1	Terminado
1362	DISEÑO Y FORMULACIÓN DEL SUSBSISTEMA DE CONTROL ESTRATÉGICO DEL MODELO ESTANDAR DE CONTROL INTERNO MECI PARA EL HONORABLE CONCEJO MUNICIPAL DE LOS ANDES (NAR)	Auditoria, Seguridad y Control	2010	No	No	DOFA	Encuestas		Terminado
1363	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA TECNOLOGÍA E INFORMÁTICA DE GRADO OCTAVO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	Software Multimedia ( Pedagogia Computacional)	2012	No	Si	COLOSSUS, OVA, AVA	Flash CS5, Cuadernia		Terminado
1364	COMPUCONTA SOFTWARE ORIENTADO AL SECTOR SALUD Y ADMINISTRACIÓN PUBLICA MODULO ASISTENCIAL Y ADMINISTRATIVO	Desarrollo Aplicativo Contable ( Pasantia )	2012	Si	No		PHP, JavaScript		Terminado
1365	Pg_KDD - Entorno Gráfico para el Sistema de Descubrimiento de Conocimiento en Bases de Datos PostgresKDD	Bases de Datos, Mineria de Datos, Aplicativo Cliente Servidor Escritorio	2012	Si	No	POO, UML, RUP, Arquitectura De Software	Java	NetBeans, JDBC	Terminado
1366	AUDITORÍA INFORMÁTICA A NIVEL DE LOS SISTEMAS E INDICADORES DE FUNCIONAMIENTO DEL HARDWARE Y SOFTWARE EN LA EMPRESA DISPROPAN S.A.S DEL DEPARTAMENTO DE NARIÑO Y PUTUMAYO	Auditoria Informatica	2014	No	No	CobIT	Cuestionarios Entrevista, Checklist		Terminado
1367	FP-FLOCK: UN ALGORITMO PARA EL DESCUBRIMIENTO DE PATRONES DE AGRUPACIÓN DE OBJETOS MÓVILES EN BASES DE DATOS ESPACIO TEMPORALES	Bases De Datos ( Espacio Temporales ), Algoritmos Complejos	2014	Si	No	LCM, Busqueda Patrones			Terminado
1368	APLICACIÓN INFORMÁTICA ORIENTADA A LA WEB PARA LA IMPLEMENTACIÓN DE LA FASE IV DEL PROYECTO DE INVESTIGACIÓN “ADMINISTRACIÓN DE JUSTICIA EN NARIÑO” DEL OBSERVATORIO DE JUSTICIA EN NARIÑO “JURE”	Aplicativo Web	2013	Si	No	Ingenieria Web	HTML, JavaScript, PHP, MySQL, CSS	AJax, HighChart, Jquery, DBDesigner Version 4, Enterprise Architect	Terminado
1369	DIGIDOC – HERRAMIENTA PARA LA DIGITALIZACION DE DOCUMENTOS PARA MIPYMES	Aplicativo Web	2010	Si	No	XP, UML, POO, Pruebas De Aceptacion	TomCAT, PostgreSQL, Testing	JSP, JSL	Terminado
1370	HERRAMIENTAS INFORMÁTICAS PARA EL ESTUDIO INTEGRAL DE LOS ECOSISTEMAS HIMCA	Aplicativo Web	2010	Si	Si	UML, Ingenieria Web, POO	SQL Server, IIS, HTML	ASP.NET Version 3.5	Terminado
1371	DISEÑO E IMPLEMENTACION DEL CABLEADO ESTRUCTURADO SEGÚN LA NORMA EIA/TIA 568A/B PARA LA ALCALDIA MUNICIPAL DE PASTO SEDES DESCENTRALIZADAS	Redes y Telematica	2010	No		EIA/TIA 568			Terminado
1372	UMAYUX: UN MODELO DE GESTOR DE CONOCIMIENTO SOPORTADO EN UNA ONTOLOGIA DINAMICA DEBILMENTE ACOPLADO CON UN GESTOR DE BASE DE DATOS	Bases de Datos y Mineria de Datos, Aplicativo Web	2014	Si	No	Web Semantica, Ontologia, UML	PostgreSQL, Java, GIMP Version 2.8, GlassFish Version 3.1.2.2	NetBeans Version 7.0, 	Terminado
1373	VALIDACIÓN DE LA APLICABILIDAD DE PEGASO MEDIANTE EL DESARROLLO DE UN SOFTWARE PARA GESTIÓN DE BIBLIOTECA	Aplicativo Web	2013	Si	No	RUP, UML	HTML, CSS, JavaScript, PHP, MySQL, Jquery, PChart		Terminado
1374	SISNOVA - SISTEMA DE ELEMENTOS DE SOFTWARE REUTILIZABLES, COMO APOYO A LA CONSTRUCCIÓN DE APLICACIONES ESCALABLES Y ROBUSTAS QUE PERMITAN LA RESOLUCIÓN DE PROBLEMAS DE TRANSPORTES	Aplicativo Movil Android, Aplicativo Web	2013	Si	No	RUP, ISBC, UML	SOA, SOAP, XML, Json, Rest, IIS, C#, Java	ASP.NET Version 4, WCF	Terminado
1375	SWCOL – AUTOMATIZACIÓN DE LOS PROCESOS DE SELECCIÓN Y CAPACITACIÓN DEL PERSONAL, MEDIANTE LA IMPLEMENTACIÓN DE UN SITIO WEB COMO PARTE DE LA INTRANET DE COLÁCTEOS	Aplicativo Web	2010	Si	No	AVA, SGC, MVC	Jomla, HTML, Apache, MySQL, PHP		Terminado
1376	APLICATIVO PARA EL DESARROLLO DEL CRONOGRAMA DEL PROCESO DE FACTURACION EN CENTRALES ELECTRICAS DE NARIÑO S.A. E.S.P (CEDENAR)	Aplicativo Web	2010	Si	No	UML, Iterativo Incremental	C#,Ajax, Oracle Version 9	Microsoft Visual Web Developer 2008 Express Edition	Terminado
1377	SIBICO - SISTEMA DE INFORMACIÓN ORIENTADO A LA WEB PARA LA ADMINISTRACIÓN DE LA BIBLIOTECA “COCUYOS” DE SAMANIEGO	Aplicativo Web	2010	Si	No	UML, Modelo Incremental	Apache, MySQL, PHP		Terminado
1378	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA DE TECNOLOGÍA E INFORMÁTICA DE GRADO DÉCIMO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	Software Multimedia ( Pedagogia Computacional)	2012		Si	COLOSSUS, OVA			Terminado
1379	ESTUDIO COMPARATIVO DE METODOLOGÍAS DE DESARROLLO DE SOFTWARE	Ingenieria De Software	2014	No	No	Comparacion Exploratoria, RUP, XP, Incremental, RAD, Desarrollo Manejado Por Rasgos			Terminado
1380	ANÁLISIS DE ALGORITMOS PARALELOS PARA LA TAREA DE MINERÍA DE DATOS ASOCIACIÓN	Bases de Datos y Mineria de Datos	2014	No		Algoritmo A priori, Algoritmo DD, Algoritmo CD, Algoritmo Cd, Algoritmo FP-GROWNTH, Algoritmo Equipasso, Algoritmo CBA, Algoritmo AIS			Terminado
1381	SARCLINIC – SISTEMA DE INFORMACIÓN PARA EL MANEJO DEL ARCHIVO DE HISTORIAS CLÍNICAS DEL CENTRO HOSPITAL GUAITARILLA E.S.E	Aplicativo Cliente Servidor Escritorio	2011	Si	No	XP,CRC, POO, UML	Java, MySQL		Terminado
1382	SADAPACS – SISTEMATIZACIÓN DEL ARCHIVO DE DOCUMENTOS DE LOS ASPIRANTES AL PROGRAMA DE VÍCTIMAS DE LA VIOLENCIA EN ACCIÓN SOCIAL – PASTO NARIÑO	Aplicativo Cliente Servidor Escritorio	2012	Si	No	POO, XP	PostgreSQL, Java, CRC		Terminado
1383	IMPLEMENTACIÓN DEL SISTEMA ELECTRÓNICO UNIFICADO DE COMUNICACIÓN INTERNA DE LA UNIVERSIDAD DE NARIÑO	Sistemas Computacionales (Pasantia)	2010	No		Mensajeria Unificada	Encuesta, Graficos Estadisticos		Terminado
1384	SISTEMA DE INFORMACION  DE ASIGNACION Y CONTROL DE HORARIOS PARA LAS AULAS  DE LA UNIVERSIDAD DE NARIÑO	Aplicativo Web	2011	Si		UML, XP	PostgreSQL Version 9.0, ODBC, Visual Studio 2010, C#, HTML, JavaScript	ASP.NET	Terminado
1385	GALUSOFT SOFTWARE ORIENTADO A LA WEB PARA EL PROCESO DE GESTIÓN ACADÉMICA DEL LICEO DE LA UNIVERSIDAD DE NARIÑO MODULO INSCRIPCIÓN, MATRICULA Y GESTIÓN DE NOTAS	Aplicativo Web	2011	Si	No	POO, RUP, UML	SQL Server 2008, C#, Microsot Visual Studio 2010 Profesional Edition, SOAP	ASP.NET	Terminado
1386	MODELADO DE UN SISTEMA DE PUNTO DE VENTA HACIENDO USO DE UN CATÁLOGO DE PATRONES DE ANÁLISIS BASADO EN MORENA	Analisis y Diseño Sistemas De Informacion, Ingenieria de Software	2010	No	No	Desarrollo Orientado a Aspectos, UML, MORENA, Ingenieria De Requisitos			Terminado
1387	PLAN ESTRATEGICO DE TECNOLOGIA INFORMATICA (PETI) PARA LA EMPRESA CENTRALES ELECTRICAS DE NARIÑO  CEDENAR S.A.E.S.P	Plan Estrategico	2011	No					Terminado
1388	SIRSUB – SOFTWARE PARA ADMINISTRACION Y DEPURACION DE BASE DE DATOS DEL REGIMEN SUBSIDIADO DEL MUNICIPIO DE TUMACO	Aplicativo Web	2012	Si	No	XP	Microsoft Access Version 2007, Visual Estudio 2008	ASP.NET Version 3.5	Terminado
1389	ANÁLISIS, DISEÑO, DESARROLLO E IMPLEMENTACIÓN DE DOS MÓDULOS PARA MEJORAR LOS PROCESOS DE RECEPCIÓN Y SEGUIMIENTO DE SOLICITUDES DE LA COMUNIDAD Y PARA EL MANEJO DE LA AGENDA EN EL DESPACHO ACOPLADOS AL SISTEMA DE INFORMACIÓN INTEGRAL (S.I.I.) DE LA ALCALDÍA DE PASTO	Aplicativo Web (Pasantia)	2012	Si	No	UML, RUP (UP)	Ajax, PHP Version 5.3.5, PostgreSQL Version 8.4.8, JavaScript, Jquery Version 1.4.4, Apache Version 2.2.17		Terminado
1390	SISTEMA DE INFORMACIÓN COMPUTARIZADO PARA EL MANEJO DE LOS RECURSOS FISICOS, FINANCIEROS Y HUMANOS DE LA DEPENDENCIA DE ALMACEN DEL HOSPITAL SAN JOSE DE TUQUERRES E.S.E	Aplicativo Web	2010	Si	No	UML	Apache, PHP, MySQL, DreamWeaver		Terminado
1391	IMPLEMENTACIÓN DEL  MÓDULO   DE RADICACIÓN DE CORRESPONDENCIA INTERNA Y EXTERNA EN LA GOBERNACION DE NARIÑO, SEGÚN ACUERDO CON LA LEY 594 DEL  2000	Aplicativo Web (Pasantia)	2011	Si	No	Observacion Directa	PHP Version 5.0, PostgreSQL Version 8.0, Apache		Terminado
1392	“SARA”- APLICACIÓN MULTIMEDIAL DE APOYO EN EL APRENDIZAJE DE MATEMÁTICAS PARA ESTUDIANTES DE PRIMER GRADO DE EDUCACIÓN BÁSICA PRIMARIA EN LAS ESCUELAS DEL MUNICIPIO DE IPIALES	Software Multimedia ( Pedagogia Computacional)	2012	Si	No	POO, UML	Adobe Flash CS5, Sound Forge Version 10.0		Terminado
1393	IMPLEMENTACIÓN DEL SISTEMA DE INFORMACIÓN WEB  DE LOS  CONSULTORIOS JURÍDICOS Y CENTRO DE CONCILIACIÓN DE LA UNIVERSIDAD MARIANA	Aplicativo Web (Pasantia)	2012	Si	Si	Modelo En Cascada, UML	JAVA, JSP, HTML Version 4.1, CSS, ServLets, JavaScript, JDBC, LDAP, Oracle		Terminado
1394	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO A LA ASIGNATURA DE LENGUA CASTELLANA DE GRADO TERCERO EN LAS INSTITUCIONES EDUCATIVAS DE NIVEL BÁSICA PRIMARIA DEL MUNICIPIO DE PASTO	Software Multimedia (Pedagogia Computacional)	2012			AVA, COLOSSUS	Moodle, Flash CS5,Action Script, Sound Forge Version 10.1, Cuadernia, MoTplus, Reload		Terminado
1395	AUDITORÍA APLICADA A LA SEGURIDAD DEL SISTEMA DE INFORMACIÓN DINÁMICA GERENCIAL HOSPITALARIA DEL HOSPITAL UNIVERSITARIO DEPARTAMENTAL DE NARIÑO	Auditoria, Seguridad y Control	2013	No		COBIT, ISO/IEC 27002	"Checklist, Entrevistas, Cuestionarios, Encuestas, CAATs, TAAOs, Inventario"		Terminado
1396	SISTEMA DE INFORMACIÓN E INVENTARIO DEL SENA - CENTRO AGROINDUSTRIAL Y PESQUERO DE LA COSTA PACÍFICA	Aplicativo Web (Pasantia)	2013	Si	Si	Modelo En Cascada	PHP Version 5.2, HTML Version 4.1, Ajax, JavaScript, MySQL		Terminado
1397	AUDITORIA AL SISTEMA DE INFORMACIÓN DE LA DEPENDENCIA OCARA DE LA UNIVERSIDAD DE NARIÑO	Auditoria Informatica	2013	No	Si	COBIT	Checklist, Entrevistas, Cuetionarios, Encuestas, Observacion		Terminado
1398	IMPLEMENTACIÓN DE UNA SOLUCIÓN INFORMÁTICA PARA FACTURACIÓN Y RECAUDO DEL IMPUESTO PREDIAL UNIFICADO, COMO MÓDULO INTEGRADO AL APLICATIVO COMPUCONTA	Aplicativo Contable (Pasantia)	2013	Si	No	XP			Terminado
1399	SOFTWARE EDUCATIVO DE APOYO PARA LA PREPARACIÓN DE ESTUDIANTES DE QUINTO DE PRIMARIA EN LAS PRUEBAS SABER. CASO DE ESTUDIO:   LICEO INTEGRADO DE LA UNIVERSIDAD DE NARIÑO	Software Multimedia (Pedagogia Computacional)	2011	Si	No	Ingenieiria de Software Educativo			Terminado
1400	DISEÑO DE UN DATAMART DE INFORMACIÓN ACADÉMICA PARA LA UNIVERSIDAD DE NARIÑO	Bases de Datos y Mineria de Datos	2011	No		Data Wear House, Bil Inmon, Ralph Kimball	PostgreSQL Version 8.4.4, Java RE Version 6 ++, StarCube		Terminado
\.


--
-- Name: efforts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('efforts_id_seq', 1400, true);


--
-- Data for Name: gradeworks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gradeworks (work_id, work_name, work_year, work_uevalu, work_status, work_type, work_develo) FROM stdin;
1267	SOFTWAREMULTIMEDIA DE APOYO PARA LOS PROCESOS DE EXPORTACIÓN E IMPORTACIÓN EN LA REGIÓN	2013	f	T	Otro	\N
1256	TECNICAS DE AUDITORIA DE SISTEMAS APLICADAS AL PROCESO DE CONTRATACION  Y PAGINAS WEB EN ENTIDADES OFICIALES DEL DEPARTAMENTO DE NARIÑO	2010	t	T	Auditoria	f
1289	ASISTENCIA DE INVESTIGACIÓN Y DESARROLLO DEL PLAN DE ENERGIZACIÓN RURAL SOSTENIBLE PARA EL DEPARTAMENTO DE NARIÑO (PERS-Nariño)	2014	f	T	Otro	f
1266	VISUALIZACIÓN DEL POTENCIAL DE RADIACIÓN SOLAR EN EL DEPARTAMENTO DE NARIÑO UTILIZANDO SERIES DE TIEMPO A PARTIR DE IMÁGENES SATELITALES	2016	f	T	Otro	\N
1253	MEDICIÓN DE LA CALIDAD DEL SISTEMA DE INFORMACION GEORREFERENCIADO DEL OBSERVATORIO DEL DELITO DE PASTO - SIGEODEP UTILIZANDO LA NORMA ISO/IEC 9126	2014	t	T	Auditoria	f
1265	"EVALUACIÓN DE CALIDAD EXTERNA CON LA NORMA ISO/IEC 25000 AL ""SISTEMA DE GESTIÓN DE DOCUMENTOS Y PQRD"" DE LA GOBERNACIÓN DE NARIÑO."	2016	t	T	Ingeniería De Software	\N
1288	EDUCACIÓN MATEMÁTICA PERTINENTE A LA FORMACIÓN DEL INGENIERO DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO	2014	f	T	Otro	f
45	ESTUDIO COMPARATIVO DE PROPUESTAS DE ANÁLISIS DE DOMINIO	2015	f	T	Ingeniería De Software	f
1271	CURRICULO ADAPTATIVO INTELIGENTE BASADO EN  ONTOLOGIAS DE DESCRIPCIÓN DE COMPETENCIAS PARA EL PROGRAMA DE INGENIERIA DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO	2012	f	T	Inteligencia Artificial	t
1260	EVALUACION DE PORTALES WEB EN CUANTO AL  CUMPLIMIENTO DE NORMAS DEL  MINISTERIO DE SALUD  APLICANDO LA NORMA ISO/IEC 9126 DE CALIDAD DE SOFTWARE PARA LAS ENTIDADES PÚBLICAS DE SALUD  DEL DEPARTAMENTO DE NARIÑO	2015	t	T	Ingeniería De Software	f
1259	SINF-27: SOFTWARE DE APOYO PARA AUDITORÍA A LA SEGURIDAD INFORMATICA Y DE LA INFORMACION BASADO EN LA NORMA ISO 27001 E ISO 27002.	2016	f	T	Auditoria	\N
1251	GAMELI-1 SOFTWARE PARA LA GESTIÓN DE HISTORIAS CLINICAS Y CITAS MÉDICAS EN LINEA PARA HOSPITALES PÚBLICOS DE NIVEL 1	2016	f	T	Aplicación Web	\N
1257	SISTEMA DE INFORMACION DE LA VICERRECTORÍA DE INVESTIGACIONES, POSTGRADOS Y RELACIONES INTERNACIONALES DE LA UNIVERSIDAD DE NARIÑO. MÓDULO ACTOS ADMINISTRATIVOS  Y MÓDULO PRESUPUESTO	2017	f	T	Aplicación Web	\N
1261	SISTEMATIZACIÓN DE LOS PROCESOS DE ALMACENAMIENTO Y ADMINISTRACIÓN DE VALORACIONES ACADÉMICAS PARA EL CENTRO EDUCATIVO “ANTONIO RICAURTE, UBICADO EN EL MUNICIPIO DE RICAURTE NARIÑO	2016	f	T	Aplicación Web	\N
1287	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA DE TECNOLOGÍA E INFORMÁTICA DE GRADO NOVENO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	2014	t	T	OVAS	f
1273	TECNICAS DE AUDITORIA DE SISTEMAS APLICADAS AL PROCESO DE CONTRATACION Y PAGINAS WEB EN LA GOBERNACIÓN DE NARIÑO E INSTITUTO DEPARTAMENTAL DE SALUD NARIÑO	2011	t	T	Auditoria	\N
1275	IMPLEMENTACION DEL SISTEMA DE GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN DEL DEPARTAMENTO DE SISTEMAS DE LA CORPORACIÓN UNIVERSITARIA AUTÓNOMA DE NARIÑO EN BASE A LAS NORMAS ISO/IEC  27001 - 27002	2016	t	T	Auditoria	\N
1278	SOFTWARE DE APOYO AL SISTEMA DE INFORMACIÓN PARA LA ADMINISTRACIÓN DE INDICADORES DE GESTIÓN DE CALIDAD EN LA UNIVERSIDAD DE NARIÑO, MÓDULO PROCESOS MISIONALES Y MÓDULO PROCESOS DE APOYO	2010	f	T	Otro	\N
1252	GEOCODIFICADOR DE EVENTOS GEORREFERENCIADOS A NIVEL DE DIRECCIONES URBANAS PARA LA IDENTIFICACION DE PATRONES DELICTIVOS FATALES Y NO FATALES EN ZONAS ESPECÍFICAS DEL MUNICIPIO DE PASTO	2016	f	T	Otro	\N
1281	“AL - KHWARIZMI” - SISTEMA PARA EL APOYO DE LOS PROCESO DE ENSEÑANZA-APRENDIZAJE DEL ALGEBRA DE LOS POLINOMIOS UTILIZANDO LA CAJA DE POLINOMIOS, DIRIGIDO A  ESTUDIANTES DE  EDUCACIÓN SECUNDARIA, BASADO EN LA LÚDICA Y EL JUEGO	2010	t	T	Aplicación Móvil,Aplicación De Escritorio,Video Juego	t
1269	APROPIACION DE LA PLATAFORMA VIRTUAL SAKAI Y ANALISIS DE FUNCIONALIDAD CON LA PLATAFORMA MOODLE	2010	f	T	Otro	f
1268	TRIPODE: UN CATÁLOGO DE PATRONES ASPECTUALES DE ANÁLISIS PARA EL DOMINIO POS BASADO EN MORENA	2010	f	T	Ingeniería De Software	f
1280	ANÁLISIS Y DISEÑO DEL MÓDULO DE CONTRATACIONES DE  LA UNIVERSIDAD DE NARIÑO	2010	f	T	Ingeniería De Software	f
1255	AUDITORÍA AL MÓDULO DE FACTURACIÓN DEL SISTEMA DE INFORMACIÓN “DINÁMICA GERENCIAL HOSPITALARIA” DEL HOSPITAL UNIVERSITARIO DEPARTAMENTAL DE NARIÑO E.S.E.	2014	f	T	Auditoria	f
1250	SISTEMA DE GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN (SGSI) BASADO EN LA NORMA ISO 27001 Y 27002 PARA LA UNIDAD DE INFORMÁTICA Y TELECOMUNICACIONES DE LA UNIVERSIDAD DE NARIÑO	2014	f	T	Auditoria	f
1319	DISEÑO E IMPLEMENTACIÓN DE UN SOFTWARE ADMINISTRATIVO EN LA FUNDACIÓN PREVENIR	2015	f	T	Aplicación De Escritorio	\N
1284	ADMINISTRACIÓN Y APOYO A LA OPERACIÓN DEL PUNTO VIVE DIGITAL PLUS DE LA IEM TÉCNICO INDUSTRIAL DE PASTO, EN EL MARCO DEL PLAN VIVE DIGITAL 2010-2014 DEL MINISTERIO DE LAS TECNOLOGÍAS DE LA INFORMACIÓN Y LAS COMUNICACIONES.	2016	f	T	Auditoria	\N
1299	APOYO AL PROCESO DE IMPLEMENTACIÓN DE UN SISTEMA DE GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN (SGSI) EN LA ALCALDÍA DE PASTO, BASADO EN LA NORMA ISO 27001:2013 Y BAJO LA DIRECTRIZ DE LA ESTRATEGIA DE GOBIERNO EN LÍNEA VERSIÓN 3.1	2015	f	T	Auditoria	\N
1301	AUDITORIA INFORMATICA APLICADA A LA INSTALACION FISICA Y HARDWARE DEL  AULA DE INFORMATICA DE LA INSTITUCION EDUCATIVA SIMON BOLIVAR DEL MUNICIPIO DE SAMANIEGO NARIÑO	2016	f	T	Auditoria	\N
1302	AUDITORIA A LA INFRAESTRUCTURA TECNOLÓGICA DEL SISTEMA DE INFORMACIÓN SALUDIPS DEL CENTRO DE SALUD SAN MIGUEL ARCÁNGEL E.S.E DEL MUNICIPIO DE OSPINA – NARIÑO	2016	f	T	Auditoria	\N
1303	AUDITORIA A LA INFRAESTRUCTURA TECNOLOGICA  EN LA EMPRESA TEXCOL LTDA. CON SEDE EN LA CIUDAD DE PASTO	2016	f	T	Auditoria	\N
1304	AUDITORIA A LOS PROCESOS DEL SISTEMA INFORMÁTICO Y DE INFORMACIÓN DE LA EMPRESA DE TRANSPORTE TRANSANDES S.A.S DE LA CIUDAD DE IPIALES – NARIÑO	2016	f	T	Auditoria	\N
1293	“ELVES” SISTEMA DE ENTRENAMIENTO DE ESCRITURA PARA LA PRIMERA INFANCIA	2014	f	T	Otro	\N
1310	MEDICIÓN Y REGISTRO EN TIEMPO REAL DE CONCENTRACIÓN DE GASES CONTAMINANTES Y NIVELES DE RUIDO EN SECTORES ESPECÍFICOS DE UNA POBLACIÓN	2015	f	T	Otro	\N
1297	EVALUACIÓN DE LOS PORTALES WEB GUBERNAMENTALES CON RESPECTO A LA USABILIDAD Y CUMPLIMIENTO DEL DECRETO DE GOBIERNO EN LÍNEA PARA LOS MUNICIPIOS DEL DEPARTARIÑO	2015	f	T	Ingeniería De Software	f
1317	DISEÑO E IMPLEMENTACIÓN DE UNA  NUEVA TOPOLOGÍA LÓGICA DE LA RED DE DATOS BASADA EN LA DISTRIBUCIÓN DE ESPACIOS FÍSICOS DEL CAMPUS UNIVERSITARIO DE LA UNIVERSIDAD DE NARIÑO	2015	f	T	Redes y Telematica	t
1307	CHAMILOMOBILE – APLICACIÓN MÓVIL ANDROID PARA LA INTERACCIÓN Y OBTENCIÓN DE INDICADORES DE SEGUIMIENTO,  SINCRONIZADA CON EL LMS CHAMILO DE LA FACULTAD DE INGENIERÍA DE LA UNIVERSIDAD DE NARIÑO	2016	t	T	Aplicación Móvil	\N
1311	DISEÑO PEDAGÓGICO E IMPLEMENTACIÓN DE HERRAMIENTAS PARA EL PROYECTO:  ENSEÑANZA DE LA LÓGICA DE PROGRAMACIÓN UTILIZANDO COMPUTACIÓN GRÁFICA. FASE I	2015	f	T	Otro	\N
1325	SISTEMA DE GESTIÓN DE SEGURIDAD DE LA INFORMACIÓN BASADO EN ISO/IEC 27001 EN LA ALCALDÍA DE PUPIALES - NARIÑO	2015	f	T	Otro	\N
1295	“PASTO AR” – APLICACIÓN MÓVIL PARA LA PROMOCIÓN TURÍSTICA DE LA CIUDAD DE PASTO CON REALIDAD AUMENTADA PARA ANDROID	2015	f	T	Aplicación Móvil	t
1300	APLICACIÓN PARA ANDROID PARA EL CÁLCULO DE LA AMENAZA RELATIVA FRENTE A FLUJOS PIROCLÁSTICOS	2016	f	T	Aplicación Móvil	t
1286	EVALUACIÓN DE LOS PROCESOS ACADÉMICOS Y ADMINISTRATIVOS DE LA UNIVERSIDAD DE  NARIÑO VIRTUAL BASADA EN LA NORMA TÉCNICA COLOMBIANA ISO 9001:2008	2012	f	T	Auditoria	f
1296	CREACIÓN E IMPLEMENTACIÓN DE UN MÓDULO SOFTWARE PARA LA GESTIÓN DEL ARCHIVO Y DE LOS PROCESOS ADMINISTRATIVOS DE LA PROCURADURÍA DE INFANCIA, ADOLESCENCIA Y FAMILIA SEDE  PASTO	2014	f	T	Aplicación De Escritorio	t
1292	PROTOTIPO DE SISTEMA DE RESTRICCIONES PARA DISPOSITIVOS MÓVILES	2014	f	T	Aplicación Móvil	t
1294	SISTEMA DE INFORMACIÓN DEL FONDO DE SEGURIDAD SOCIAL EN SALUD DE LA UNIVERSIDAD DE NARIÑO MÓDULO HISTORIAS CLÍNICAS MÉDICAS Y ODONTOLÓGICAS	2014	f	T	Aplicación Web	t
1291	SISTEMA DE INFORMACIÓN DEL FONDO DE SEGURIDAD SOCIAL EN SALUD DE LA UNIVERSIDAD DE NARIÑO MODULO DE APOYO A PROGRAMAS DE PROMOCIÒN Y PREVENCIÒN DE LA SALUD	2014	t	T	Aplicación Web	t
1290	SIGLHA – SISTEMA DE INFORMACIÓN DE GLOBAL HUMANITARIA PARA EL MANEJO DEL PROGRAMA DE APADRINAMIENTO  EN COLOMBIA	2014	f	T	Aplicación Web	t
1367	FP-FLOCK: UN ALGORITMO PARA EL DESCUBRIMIENTO DE PATRONES DE AGRUPACIÓN DE OBJETOS MÓVILES EN BASES DE DATOS ESPACIO TEMPORALES	2014	f	T	Bases y Mineria De Datos	t
1322	AUDITORÍA DE SISTEMAS APLICADA A LOS MÓDULOS DE FACTURACIÓN, CONSULTAS E HISTORIA CLÍNICA DEL SOFTWARE INFO-SALUD  EN LA IPS INDÍGENA GUAITARA DEL MUNICIPIO DE IPIALES	2015	t	T	Auditoria	f
1334	CONSTRUCCIÓN DE UN REPOSITORIO LIMPIO DE DATOS DE LOS ESTUDIANTES DE LOS PROGRAMAS DE PREGRADO DE LA UNIVERSIDAD DE NARIÑO PARA ANÁLISIS DE DESERCIÓN CON MINERÍA DE DATOS	2013	t	T	Bases y Mineria De Datos	\N
1345	AFICOP- APLICACIÓN WEB PARA LOS AFILIADOS DE LAS COOPERATIVAS	2013	f	T	Aplicación Web	t
1347	OBJETOS  VIRTUALES DE APOYO A  LA ASIGNATURA DE LENGUA  CASTELLANA DEL GRADO SÉPTIMO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	2013	f	T	OVAS	f
1308	AUDITORÍA INFORMATICA A LA ESTRUCTURA ORGANIZACIONAL Y A LOS PROCESOS DEL AREA DE SISTEMAS EN LA EMPRESA SOCIAL DEL ESTADO HOSPITAL CUMBAL DEL MUNICIPIO DE CUMBAL, DEPARTAMENTO DE NARIÑO	2016	f	T	Auditoria	\N
1312	AUDITORIA A LA SEGURIDAD DEL SISTEMA DE INFORMACION SIVIGILA DE LA ALCALDÍA DE SAN ANDRÉS DE TUMACO BASADA EN EL ESTÁNDAR  ISO 27001	2015	f	T	Auditoria	\N
1313	AUDITORÍA A LA SEGURIDAD DE LA INFORMACIÓN EN LA EMPRESA EXPRESO JUANAMBÚ DE LA CIUDAD DE PASTO SOPORTADA EN LOS ESTÁNDARES DE AUDITORÍA COBIT E ISO/IEC 27000	2015	f	T	Auditoria	\N
1314	AUDITORÍA INFORMÁTICA A LA PARTE FÍSICA Y LÓGICA DE LA RED DE DATOS EN LA EMPRESA SOLIDARIA DE SALUD EMSSANAR E.S.S. SEDES CORPORATIVA PASTO Y SEDES ALTO PUTUMAYO	2015	f	T	Auditoria	\N
1338	AUDITORÍA INFORMÁTICA A LOS PROCESOS Y ORGANIZACIÓN DEL ÁREA DE SISTEMAS EN LA EMPRESA AGROPEZ LTDA DE LA CIUDAD DE IPIALES	2016	f	T	Auditoria	\N
1339	AUDITORIA A LA INFRAESTRUCTURA  FISICA DE  RED Y EQUIPOS DE COMPUTO DE LA  NOTARÍA PRIMERA DE TÚQUERRES	2016	f	T	Auditoria	\N
1341	AUDITORÍA INFORMÁTICA A LOS PROCESOS DEL ÁREA DE SISTEMAS QUE CONTROLAN LA PARTE ACADÉMICA DEL COLEGIO CHAMPAGNAT DE IPIALES – NARIÑO	2016	f	T	Auditoria	\N
1342	AUDITORÍA DE SISTEMAS APLICADA A LOS MÓDULOS MANEJO DE PLANTAS DE GLP, MANEJO DE BÁSCULAS Y REPORTES DE LA PLATAFORMA SIMER (Sistema Inteligente de Envasado) EN LA PLANTA DE ENVASADO MONTAGAS S.A E.S.P DEL MUNICIPIO DE PASTO	2016	f	T	Auditoria	\N
1332	SIGED FUNES – SISTEMA DE GESTIÓN DOCUMENTAL PARA LA ALCALDÍA MUNICIPAL DE FUNES	2015	f	T	Aplicación Web	\N
1330	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA DE LENGUA CASTELLANA DEL GRADO QUINTO EN LAS INSTITUCIONES EDUCATIVAS DE NIVEL MEDIO DEL MUNICIPIO DE PASTO	2013	f	T	OVAS	f
1336	APOYO AL PROCESO DE IMPLEMENTACION DE UN SISTEMA DE GESTION DE LA SEGURIDAD DE LA INFORMACION BASADO EN LA NORMA ISO 27001:2013 EN LA ALCALDIA DE PASTO	2015	f	T	Auditoria	\N
1331	AUDITORIA DE SISTEMAS APLICADA AL SISTEMA DE INFORMACIÓN DE LA IPS INDÍGENA GUÁITARA DEL MUNICIPIO DE IPIALES	2013	f	T	Otro	\N
1340	IMPLEMENTACION DE UN CONTROLADOR DE DOMINIO BAJO WINDOWS SERVER Y UN ROUTERBOARD DE MIKROTIK EN LA RED DE COMPUTADORES DE SYSTEM PLUS  DE LA CIUDAD DE TUQUERRES	2016	f	T	Otro	\N
1344	 IMPLEMENTACIÓN DE PRUEBAS DE LOS SUBSISTEMAS DE RECAUDO, CONTROL, INFORMACIÓN Y SERVICIO AL USUARIO DE TRANSMILENIO	2013	f	T	Ingeniería De Software	f
1335	“DOC-KUMENCT” INTERFAZ GESTUAL PARA LA BÚSQUEDA Y LECTURA DE TRABAJOS DE GRADO EN LA BIBLIOTECA ALBERTO QUIJANO GUERRERO DE LA UNIVERSIDAD DE NARIÑO	2013	t	T	Video Juego	f
1352	ANÁLISIS Y DISEÑO DEL AMBIENTE VIRTUAL KNOWER PARA INCLUIR CARACTERÍSTICAS QUE PERMITAN APOYAR LA INTEGRACIÓN DE LA LABOR INVESTIGATIVA EN LAS INSTITUCIONES DE EDUCACIÓN BÁSICA SECUNDARIA Y MEDIA DEL MUNICIPIO DE PASTO Y OBTENER LOS INDICADORES NECESARIOS PARA SU VALIDACIÓN	2016	f	T	Otro	\N
1333	AUDITORIA DE SISTEMAS APLICADA  AL SISTEMA DE INFORMACIÓN  DE LA COOPERATIVA DEL MAGISTERIO DE TUQUERRES COACREMAT	2013	f	T	Auditoria	f
1309	EVALUACIÓN DE LOS SISTEMAS WEB CON RESPECTO AL CUMPLIMIENTO DE LOS REQUERIMIENTOS DEL MINISTERIO DE EDUCACION NACIONAL Y BAJO LA NORMA ISO/IEC 9126 PARA LAS INSTITUCIONES EDUCATIVAS MUNICIPALES EN LA CIUDAD DE SAN JUAN DE PASTO - NARIÑO	2016	\N	P	Auditoria	\N
1365	Pg_KDD - Entorno Gráfico para el Sistema de Descubrimiento de Conocimiento en Bases de Datos PostgresKDD	2012	f	T	Aplicación De Escritorio,Bases y Mineria De Datos	t
1357	SOFTWARE PARA EL MANEJO DE LOS PROCESOS DE MATRICULA ACADÉMICA Y FINANCIERA DE LA ESCUELA DE MÚSICA DEL CORREGIMIENTO ROSAL DEL MONTE – NARIÑO	2012	f	T	Aplicación De Escritorio	t
1354	POLARIS VERSIÓN 3.0 - Una herramienta para la minería de uso y estructura de la web y análisis estadístico de tráfico web	2012	f	T	Aplicación De Escritorio,Bases y Mineria De Datos	t
1363	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA TECNOLOGÍA E INFORMÁTICA DE GRADO OCTAVO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	2012	t	T	OVAS	f
1254	COKOA – HERRAMIENTA  PARA EL SEGUIMIENTO ACADÉMICO DE LOS ESTUDIANTES  DE EDUCACIÓN BÁSICA SECUNDARIA DEL LICEO DE LA UNIVERSIDAD DE NARIÑO	2017	f	T	Aplicación Web,Aplicación Móvil	\N
1263	CERES - PLATAFORMA WEB-MÓVIL DE DIFUSIÓN Y COMERCIALIZACIÓN DE PRODUCTOS DEL CAMPO PARA EL BENEFICIO DEL AGRICULTOR NARIÑENSE	2016	t	T	Aplicación Web,Aplicación Móvil	\N
1274	CAJA DE POLINOMIOS WEB MÓVIL	2015	f	T	Aplicación Web,Aplicación Móvil	\N
1378	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA DE TECNOLOGÍA E INFORMÁTICA DE GRADO DÉCIMO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	2012	t	T	OVAS	f
1323	AUDITORÌA AL SISTEMA DE INFORMACIÓN HOSPITALARIO (SIHOS) DEL HOSPITAL CIVIL DE IPIALES BASADO EN EL ESTÁNDAR COBIT 4.1	2016	t	T	Auditoria	\N
1324	AUDITORIA INFORMATICA A LOS PROCESOS Y ORGANIZACIÓN DE LA SUBSECRETARIA DE SISTEMAS Y ESTADISTICAS EN LA SECRETARIA DE HACIENDA DEL MUNICIPIO DE IPIALES	2016	f	T	Auditoria	\N
1327	AUDITORIA AL PROCESO DE DESARROLLO DE SOFTWARE UTILIZANDO EL MODELO CMMI EN EL CENTRO DE INFORMATICA DE LA UNIVERSIDAD DE NARIÑO	2015	f	T	Auditoria	\N
1329	AUDITORIA AL  SISTEMA  DE  INFORMACIÓN  DINÁMICA GERENCIAL  HOSPITALARIA  EN EL  MÓDULO  DE CITAS  MÉDICAS  PARA   EL  HOSPITAL  UNIVERSITARIO DEPARTAMENTAL  DE NARIÑO E.S.E	2013	f	T	Auditoria	\N
1350	AUDITORIA AL MODULO DE INVENTARIO DEL SISTEMA DE INFORMACION EN EL  HOSPITAL UNIVERSITARIO DEPARTAMENTAL DE NARIÑO	2013	f	T	Auditoria	f
1264	ACTUALIZACIÓN DEL SOFTWARE FINANCIAL BUSINESS SYSTEM DE LA CORPORACIÓN NARIÑO EMPRESA Y FUTURO CONTACTAR MEDIANTE SU MIGRACIÓN A LA TECNOLOGÍA WINDOWS COMMUNICATION FOUNDATION	2016	f	T	Aplicación Web	\N
1343	HIMATCH: SISTEMA DE ENLACE SOCIAL BASADO EN PROXIMIDAD QUE FACILITA EL CONTACTO CON PERSONAS DESCONOCIDAS EN SITIOS PÚBLICOS	2013	f	T	Aplicación Móvil	t
1270	ATLESIBACO SISTEMA BASADO EN EL CONOCIMIENTO EN ATLETISMO PARA MEJORAR EL DESEMPEÑO DE LOS DEPORTISTAS EN SEMIFONDO Y FONDO	2012	f	T	Aplicación Web	t
1397	AUDITORIA AL SISTEMA DE INFORMACIÓN DE LA DEPENDENCIA OCARA DE LA UNIVERSIDAD DE NARIÑO	2013	t	T	Auditoria	f
1379	ESTUDIO COMPARATIVO DE METODOLOGÍAS DE DESARROLLO DE SOFTWARE	2014	f	T	Ingeniería De Software	f
1372	UMAYUX: UN MODELO DE GESTOR DE CONOCIMIENTO SOPORTADO EN UNA ONTOLOGIA DINAMICA DEBILMENTE ACOPLADO CON UN GESTOR DE BASE DE DATOS	2014	f	T	Bases y Mineria De Datos	t
1353	TECNICAS DE AUDITORIA DE SISTEMAS APLICADAS AL PROCESO DE CONTRATACION  Y PAGINAS WEB EN ENTIDADES OFICIALES DEL DEPARTAMENTO DE NARIÑO, ALCALDÍA MUNICIPAL DE TANGUA Y ALCALDÍA MUNICIPAL DE YACUANQUER	2010	t	T	Auditoria	f
1374	SISNOVA - SISTEMA DE ELEMENTOS DE SOFTWARE REUTILIZABLES, COMO APOYO A LA CONSTRUCCIÓN DE APLICACIONES ESCALABLES Y ROBUSTAS QUE PERMITAN LA RESOLUCIÓN DE PROBLEMAS DE TRANSPORTES	2013	f	T	Aplicación Web	t
1395	AUDITORÍA APLICADA A LA SEGURIDAD DEL SISTEMA DE INFORMACIÓN DINÁMICA GERENCIAL HOSPITALARIA DEL HOSPITAL UNIVERSITARIO DEPARTAMENTAL DE NARIÑO	2013	f	T	Auditoria	f
1383	IMPLEMENTACIÓN DEL SISTEMA ELECTRÓNICO UNIFICADO DE COMUNICACIÓN INTERNA DE LA UNIVERSIDAD DE NARIÑO	2010	f	T	Otro	f
1400	DISEÑO DE UN DATAMART DE INFORMACIÓN ACADÉMICA PARA LA UNIVERSIDAD DE NARIÑO	2011	f	T	Bases y Mineria De Datos	f
1371	DISEÑO E IMPLEMENTACION DEL CABLEADO ESTRUCTURADO SEGÚN LA NORMA EIA/TIA 568A/B PARA LA ALCALDIA MUNICIPAL DE PASTO SEDES DESCENTRALIZADAS	2010	f	T	Redes y Telematica	f
1381	SARCLINIC – SISTEMA DE INFORMACIÓN PARA EL MANEJO DEL ARCHIVO DE HISTORIAS CLÍNICAS DEL CENTRO HOSPITAL GUAITARILLA E.S.E	2011	f	T	Aplicación De Escritorio	t
1382	SADAPACS – SISTEMATIZACIÓN DEL ARCHIVO DE DOCUMENTOS DE LOS ASPIRANTES AL PROGRAMA DE VÍCTIMAS DE LA VIOLENCIA EN ACCIÓN SOCIAL – PASTO NARIÑO	2012	f	T	Aplicación De Escritorio	t
1351	AUDITORIA A LA INFRAESTRUCTURA FÍSICA DE LA RED DE DATOS DE LA SEDE PRINCIPAL Y VERIFICACIÓN DEL CUMPLIMIENTO DE LAS NORMAS DE GOBIERNO EN LÍNEA EN LA PÁGINA DE LA ESE CENTRO HOSPITAL DIVINO NIÑO	2013	t	T	Auditoria	f
1380	ANÁLISIS DE ALGORITMOS PARALELOS PARA LA TAREA DE MINERÍA DE DATOS ASOCIACIÓN	2014	f	T	Bases y Mineria De Datos	f
1328	AUDITORIA AL PORTAL WEB DEL HOSPITAL UNIVERSITARIO DEPARTAMENTAL DE NARIÑO E.S.E.	2013	t	T	Auditoria	f
1283	MOVIC-DESARROLLO E IMPLEMENTACIÓN DE UNA APLICACIÓN MOVIL EN iOS y ANDROID PARA CONSULTAS ACADÉMICAS DE LA UNIVERSIDAD DE NARIÑO.	2016	f	T	Aplicación Web,Aplicación Móvil	\N
1305	COAADES - SOFTWARE DE APOYO PARA EL REGISTRO Y CONTROL DE COMISIONES  ACADÉMICAS, ADMINISTRATIVAS Y DE ESTUDIO PARA EL ÁREA DE APOYO JURÍDICO DE VICERRECTORÍA ACADÉMICA DE LA UNIVERSIDAD DE NARIÑO	2016	f	T	Aplicación Web,Aplicación Móvil	\N
1315	SISTEMA DE REALIDAD AUMENTADA PARA PROMOVER Y ENRIQUECER ATRACTIVOS TURÍSTICOS DEL CENTRO HISTÓRICO DE LA CIUDAD DE PASTO “TuristAR”	2015	f	T	Aplicación Web,Aplicación Móvil	\N
1326	VISUALIZACIÓN EN TIEMPO REAL DE INFORMACIÓN SECTORIZADA SOBRE LA CALIDAD DE AIRE Y NIVELES DE CONTAMINACIÓN AUDITIVA	2015	f	T	Aplicación Web,Aplicación Móvil	t
1262	“KNOW TUMACO” APLICACIÓN WEB-MÓVIL CON REALIDAD AUMENTADA PARA LA PROMOCIÓN TURÍSTICA DEL MUNICIPIO DE TUMACO	2016	f	T	Aplicación Web	t
1362	DISEÑO Y FORMULACIÓN DEL SUSBSISTEMA DE CONTROL ESTRATÉGICO DEL MODELO ESTANDAR DE CONTROL INTERNO MECI PARA EL HONORABLE CONCEJO MUNICIPAL DE LOS ANDES (NARIÑO)	2010	f	T	Auditoria	f
40	SIVICJ-2013: SISTEMA DE INFORMACION PARA LA ARTICULACION DE ACTIVIDADES ACADEMICAS, INVESTIGATIVAS Y ADMINISTRATIVAS DE LOS CONSULTORIOS JURDICOS DE LA UNIVERSIDAD DE NARIÑO	2013	t	T	Aplicación Web	t
5	TINKU - IMPLEMENTACION DE UN CLUSTER HETEROGENEO DE ALTO RENDIMIENTO, FUERTEMENTE ACOPLADO CON ROCKS EN LA UNIVERSIDAD DE NARIÑO.	2010	\N	T	Sistemas Distribuidos	f
9	IMPLEMENTACIÓN DEL PORTAL WEB OFICIAL DEL INSTITUTO  MUNICIPAL  PARA LA RECREACIÓN Y EL DEPORTE PASTO-DEPORTE Y DESARROLLO  DE UN SOFTWARE PARA EL REGISTRO Y CONTROL  DE LAS  INSCRIPCIONES A SUS ACTIVIDADES 	2010	f	T	Aplicación Web	t
42	 SOFTWARE DE SOPORTE AL PROCESO DE CONSULTA EXTERNA UTILIZANDO LA METODOLOGÍA SCRUM EN LA CLÍNICA VETERINARIA CARLOS ALBERTO MARTÍNEZ HOYOS DE LA UNIVERSIDAD DE NARIÑO	2014	f	T	Ingeniería De Software	t
1272	SISTEMA DE INFORMACIÓN DE MANEJO DE VERTIMIENTOS PARA LA SUBDIRECCIÓN DE CONOCIMIENTO Y EVALUACIÓN AMBIENTAL DE CORPONARIÑO	2010	f	T	Aplicación Web	t
14	SOFTWARE EDUCATIVO DE APOYO PARA EL APRENDIZAJE, DE MEDIOS DE COMUNICACION: RADIO, PRENSA Y TELEVISION, EN LA EDUCACION MEDIA	2010	f	T	Portal Web	t
17	DISEÑO DEL CABLEADO ESTRUCTURADO SEGUN LA NORMA EIA/TIA 568A PARA LA ALCALDIA MUNICIPAL DE PASTO SEDE CAM-ANGANOY E IMPLEMENTACIÓN	2010	f	T	Redes y Telematica	f
18	SISTEMA DE INFORMACION DEL ALMACEN GENERAL DE EVIDENCIAS DE LA FISCALIA SECCIONAL DE NARIÑO	2010	f	T	Aplicación Web	t
1279	ANÁLISIS, DISEÑO, DESARROLLO E IMPLEMENTACIÓN  DEL MÓDULO DE SEGUIMIENTO A PROYECTOS RADICADOS EN EL BANCO DE PROYECTOS, ACOPLADO AL SISTEMA INTEGRAL DE INFORMACIÓN (SII) DE LA ALCALDIA MUNICIPAL DE PASTO	2011	f	T	Aplicación Web	t
1386	MODELADO DE UN SISTEMA DE PUNTO DE VENTA HACIENDO USO DE UN CATÁLOGO DE PATRONES DE ANÁLISIS BASADO EN MORENA	2010	f	T	Ingeniería De Software	f
21	QUALITYSOFT: IMPLEMENTACION DE UN APLICATIVO INFORMATICO DE AUDITORIA DE SISTEMAS BASADO EN LOS ESTANDARES INTERNACIONALES DE CALIDAD	2011	t	T	Aplicación De Escritorio	t
23	SISTEMA PARA EL MANEJO Y ADMINISTRACIÓN DE LA INFORMACIÓN EN LAS DEPENDENCIAS DE ALMACÉN Y ARCHIVO DEL INSTITUTO MUNICIPAL PARA LA RECREACIÓN Y EL DEPORTE PASTO DEPORTE	2011	f	T	Aplicación Web	t
25	SOFTWARE ORIENTADO A LA WEB PARA LA ADMINISTRACIÓN DE LA HISTORIA ACADÉMICA, SOCIO FAMILIAR Y PSICOLÓGICA DEL ESTUDIANTE COMO HERRAMIENTA DE APOYO PARA LA TOMA DE DECISIONES EDUCATIVAS EN EL INEM LUIS DELFIN INSUASTY RODRIGUEZ DE PASTO SEOPS	2011	f	T	Aplicación Web	t
27	SIMCAP - SISTEMA DE INFORMACIÓN PARA EL MANEJO CLÍNICO Y ADMINISTRATIVO DE PACIENTES EN LA UNIDAD MEDICA UROLOGICA DE NARIÑO UROLAN	2011	f	T	Aplicación Web	t
29	CICY SISTEMA DE REGISTRO DE INDICADORES DE GESTIÓN AMBIENTAL DE LA INDUSTRIA MANUFACTURERA EN EL CORREDOR VIAL CALI - YUMBO	2011	f	T	Aplicación Web	t
1387	PLAN ESTRATEGICO DE TECNOLOGIA INFORMATICA (PETI) PARA LA EMPRESA CENTRALES ELECTRICAS DE NARIÑO  CEDENAR S.A.E.S.P	2011	f	T	Otro	f
31	SISTEMA DE ADMINISTRACION DE TRANSPORTE APLICADO EN INTERMODAL S.A.S	2012	f	T	Aplicación Web	t
43	CONSTRUCCION DE UN REPOSITORIO LIMPIO DE DATOS PARA LA DETECCION DE PATRONES DE EVENTOS ERUPTIVOS DEL VOLCÁN GALERAS CON TECNICAS DE MINERIA DE DATOS	2014	f	T	Bases y Mineria De Datos	t
1394	OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO A LA ASIGNATURA DE LENGUA CASTELLANA DE GRADO TERCERO EN LAS INSTITUCIONES EDUCATIVAS DE NIVEL BÁSICA PRIMARIA DEL MUNICIPIO DE PASTO	2012	t	T	OVAS	f
33	 OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA DE TECNOLOGIA E INFORMATICA DE GRADO UNDÉCIMO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	2012	t	T	OVAS	f
1392	“SARA”- APLICACIÓN MULTIMEDIAL DE APOYO EN EL APRENDIZAJE DE MATEMÁTICAS PARA ESTUDIANTES DE PRIMER GRADO DE EDUCACIÓN BÁSICA PRIMARIA EN LAS ESCUELAS DEL MUNICIPIO DE IPIALES	2012	f	T	OVAS	f
35	BLUELERNEN: APLICACION BLUETOOTH PARA UN AMBIENTE DISTRIBUIDO DE APRENDIZAJE	2013	f	T	Sistemas Distribuidos	t
37	 CONSTRUCCION DE UNA BASE DE DATOS DIGITAL E IMPLEMENTACION DE UN MODULO DE SOFTWARE PARA EL MANEJO DE LA NOMINA DE EMPLEADOS DE LA DELEGACION DEPARTAMENTAL DE NARIÑO EN LA OFICINA ENCARGADA SAN JUAN DE PASTO	2013	f	P	Aplicación De Escritorio	t
38	 APLICACION DE LA TECNOLOGIA RFID EN LA OPTIMIZACION DEL PROCESO DE PRESTAMO DE LIBROS EN LA BIBLIOTECA DE LA INSTITUCION EDUCATIVA MISAEL PASTRANA BORRERO EN EL MUNICIPIO DE TANGUA – NARIÑO	2013	f	T	Aplicación De Escritorio	t
1366	AUDITORÍA INFORMÁTICA A NIVEL DE LOS SISTEMAS E INDICADORES DE FUNCIONAMIENTO DEL HARDWARE Y SOFTWARE EN LA EMPRESA DISPROPAN S.A.S DEL DEPARTAMENTO DE NARIÑO Y PUTUMAYO	2014	f	T	Auditoria	f
46	SITIO WEB INSTITUCIONAL Y APLICATIVO WEB PARA ADMINISTRAR EL ÁREA DE INVENTARIO DE ACTIVO FIJO EN LA I.P.S ASOCIACIÓN DE CABILDOS INDÍGENAS DE LA ZONA DE IPIALES A.C.I.Z.I	2015	f	T	Aplicación Web	t
48	APLICACIÓN DE TÉCNICAS DE VISUALIZACIÓN DE DATOS PARA LA INTELIGENCIA DE NEGOCIOS	2015	f	T	Bases y Mineria De Datos	f
1399	SOFTWARE EDUCATIVO DE APOYO PARA LA PREPARACIÓN DE ESTUDIANTES DE QUINTO DE PRIMARIA EN LAS PRUEBAS SABER. CASO DE ESTUDIO:   LICEO INTEGRADO DE LA UNIVERSIDAD DE NARIÑO	2011	f	T	OVAS	t
1346	KNOWER - AMBIENTE VIRTUAL PARA LA GESTIÓN DE CONOCIMIENTO PARA INTEGRAR LA LABOR ACADÉMICA E INVESTIGATIVA DE LA FACULTAD DE INGENIERÍADE LA UNIVERSIDAD DE NARIÑO FASE II - OPTIMIZACIÓN Y PUESTA EN FUNCIONAMIENTO	2013	f	T	Aplicación Web,Aplicación De Escritorio	t
1285	SISTEMA DE INFORMACIÓN ORIENTADO A LA WEB PARA EL MANEJO Y ADMINISTRACIÓN DE PROCESOS JUDICIALES DE LA FISCALÍA GENERAL DE LA NACIÓN – SECCIONALES NARIÑO	2016	f	T	Aplicación Web	\N
1298	SISTEMA DE INFORMACIÓN PARA LA GESTIÓN DE ESPACIOS, RECURSOS Y SERVICIOS DE LA UNIDAD DE INFORMÁTICA Y TELECOMUNICACIONES (UIT) DE LA UNIVERSIDAD DE NARIÑO	2014	f	T	Aplicación Web	\N
1318	SISTEMA DE FACTURACIÓN PARA EL SERVICIO DE ENERGÍA ELÉCTRICA Y ACTUALIZACIÓN  DEL SITIO WEB DE LA ALCALDÍA DE CUMBAL	2015	f	T	Aplicación Web	\N
1321	AWAD - DESARROLLO E IMPLEMENTACIÓN DE APLICACIÓN WEB COMO CANAL DE COMUNICACIÓN ENTRE LA PYME ALPINITA Y SUS CLIENTES DOMICILIADOS.	2017	f	T	Aplicación Web	\N
1316	REESTRUCTURACIÓN DEL SITIO WEB DEL DEPARTAMENTO DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO Y DESARROLLO DE UNA APLICACIÓN PARA EL SEGUIMIENTO DE PROYECTOS DE GRADO PARA EL DEPARTAMENTO DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO	2015	t	T	Aplicación Web	t
11	GUGOLITO: PLATAFORMA WEB BASADA EN AMBIENTES DE APRENDIZAJE COLABORATIVOS PARA LA ENSEÑANZA DE LECTOESCRITURA EN LOS GRADOS TERCERO, CUARTO Y QUINTO DE BASICA PRIMARIA	2010	f	T	Aplicación Web	t
1348	COMPUCONTA - SOFTWARE ORIENTADO AL SECTOR SALUD Y ADMINISTRACIÓN PÚBLICA – MÓDULO DE PAGOS DE NÓMINA Y LIQUIDACIÓN DE PRESTACIONES SOCIALES	2013	t	T	Aplicación Web	t
1370	HERRAMIENTAS INFORMÁTICAS PARA EL ESTUDIO INTEGRAL DE LOS ECOSISTEMAS HIMCA	2010	f	T	Aplicación Web	t
10	POLARIS VERSION 2.0 UNA HERRAMIENTA PARA LA MINERIA WEB DE USO Y ESTRUCTURA.	2010	f	T	Aplicación De Escritorio,Bases y Mineria De Datos	t
1369	DIGIDOC – HERRAMIENTA PARA LA DIGITALIZACION DE DOCUMENTOS PARA MIPYMES	2010	f	T	Aplicación Web	t
1277	SOFTWARE DE APOYO AL SISTEMA DE INFORMACIÓN PARA LA ADMINISTRACIÓN DE INDICADORES PARA LA ADMINISTRACIÓ DE INDICADORES DE GESTIÓN DE CALIDAD EN LA UNIVERSIDAD DE NARIÑO, MÓDULO PROCESOS ESTRATEGICOS Y MÓDULO PROCESOS DE EVALUACIÓN	2010	f	T	Aplicación Web	t
1377	SIBICO - SISTEMA DE INFORMACIÓN ORIENTADO A LA WEB PARA LA ADMINISTRACIÓN DE LA BIBLIOTECA “COCUYOS” DE SAMANIEGO	2010	f	T	Aplicación Web	t
1356	SIMART - SISTEMA DE INFORMACIÓN ORIENTADO A LA WEB PARA EL MANEJO DEL ARCHIVO CENTRAL E HISTÓRICO DE LA CIUDAD DE TUQUERRES	2010	f	T	Aplicación Web	t
1358	PLATAFORMA WEB 2.0 PARA UN SISTEMA GPS- GSM/GPRS DE MONITOREO EN TIEMPO REAL PARA EL TRANSPORTE PÚBLICO DE LA CIUDAD DE PASTO	2010	f	T	Aplicación Web	t
15	 AG-ARGOS: NODO ACCESS GRID SOPORTADO EN UNA GRID DE SERVICIOS PARA APOYAR PROCESOS EDUCATIVOS EN EL DEPARTAMENTO DE SISTEMAS DE LA UNIVERSIDAD DE NARIÑO	2010	f	T	Sistemas Distribuidos	t
1390	SISTEMA DE INFORMACIÓN COMPUTARIZADO PARA EL MANEJO DE LOS RECURSOS FISICOS, FINANCIEROS Y HUMANOS DE LA DEPENDENCIA DE ALMACEN DEL HOSPITAL SAN JOSE DE TUQUERRES E.S.E	2010	f	T	Aplicación Web	t
1375	SWCOL – AUTOMATIZACIÓN DE LOS PROCESOS DE SELECCIÓN Y CAPACITACIÓN DEL PERSONAL, MEDIANTE LA IMPLEMENTACIÓN DE UN SITIO WEB COMO PARTE DE LA INTRANET DE COLÁCTEOS	2010	f	T	Aplicación Web	t
1355	SISTEMA DE INFORMACIÓN DEL FONDO MIXTO DE CULTURA DE NARIÑO ORIENTADO A LA WEB	2010	f	T	Aplicación Web	t
1384	SISTEMA DE INFORMACION  DE ASIGNACION Y CONTROL DE HORARIOS PARA LAS AULAS  DE LA UNIVERSIDAD DE NARIÑO	2011	f	T	Aplicación Web	t
1385	GALUSOFT SOFTWARE ORIENTADO A LA WEB PARA EL PROCESO DE GESTIÓN ACADÉMICA DEL LICEO DE LA UNIVERSIDAD DE NARIÑO MODULO INSCRIPCIÓN, MATRICULA Y GESTIÓN DE NOTAS	2011	f	T	Aplicación Web	t
1389	ANÁLISIS, DISEÑO, DESARROLLO E IMPLEMENTACIÓN DE DOS MÓDULOS PARA MEJORAR LOS PROCESOS DE RECEPCIÓN Y SEGUIMIENTO DE SOLICITUDES DE LA COMUNIDAD Y PARA EL MANEJO DE LA AGENDA EN EL DESPACHO ACOPLADOS AL SISTEMA DE INFORMACIÓN INTEGRAL (S.I.I.) DE LA ALCALDÍA DE PASTO	2012	f	T	Aplicación Web	t
1361	DESARROLLO DE UN WEBSITE EN CUMPLIMIENTO DE LA DIRECTIVA PRESIDENCIAL 002 PARA LA INSTITUCION EDUCATIVA OSPINA PEREZ	2012	f	T	Portal Web	t
1364	COMPUCONTA SOFTWARE ORIENTADO AL SECTOR SALUD Y ADMINISTRACIÓN PUBLICA MODULO ASISTENCIAL Y ADMINISTRATIVO	2012	f	T	Aplicación Web	t
1359	SISTEMA DE INFORMACIÓN ORIENTADO A LA WEB COMO HERRAMIENTA DE APOYO A LA EXPEDICIÓN DE CERTIFICADOS LABORALES Y DE APORTES A FONDO DE PENSIÓN DE LOS EX FUNCIONARIOS DE LA ALCALDÍA MUNICIPAL DE PASTO	2012	f	T	Aplicación Web	t
1388	SIRSUB – SOFTWARE PARA ADMINISTRACION Y DEPURACION DE BASE DE DATOS DEL REGIMEN SUBSIDIADO DEL MUNICIPIO DE TUMACO	2012	f	T	Aplicación Web	t
1360	TECNOSOFT – SOFTWARE DE GESTIÓN TECNOLÓGICA HOSPITALARIA PARA EL HOSPITAL CIVIL DE IPIALES	2012	f	T	Aplicación Web	t
1276	SISTEMA DE INFORMACIÓN PARA GESTIÓN DE SOLICITUDES DE SERVICIOS Y CONTROL DE LA DOCUMENTACIÓN DEL ARCHIVO AUDIOVISUAL PARA EL CENTRO DE COMUNICACIONES DE LA UNIVERSIDAD DE NARIÑO	2012	f	T	Aplicación Web	t
1349	SISTEMA DE INFORMACIÓN PARA LA ADMINISTRACION DE ACTIVOS FIJOS DE LA EMPRESA DE OBRAS SANITARIAS EMPOPASTO S.A. E.S.P	2013	f	T	Aplicación Web	t
1373	VALIDACIÓN DE LA APLICABILIDAD DE PEGASO MEDIANTE EL DESARROLLO DE UN SOFTWARE PARA GESTIÓN DE BIBLIOTECA	2013	f	T	Aplicación Web	t
1368	APLICACIÓN INFORMÁTICA ORIENTADA A LA WEB PARA LA IMPLEMENTACIÓN DE LA FASE IV DEL PROYECTO DE INVESTIGACIÓN “ADMINISTRACIÓN DE JUSTICIA EN NARIÑO” DEL OBSERVATORIO DE JUSTICIA EN NARIÑO “JURE”	2013	f	T	Aplicación Web	t
1396	SISTEMA DE INFORMACIÓN E INVENTARIO DEL SENA - CENTRO AGROINDUSTRIAL Y PESQUERO DE LA COSTA PACÍFICA	2013	t	T	Aplicación Web	f
1320	SIVENH - SOFTWARE DE MANEJO DE INFORMACIÓN PARA EL REGISTRO Y CONTROL DE CLIENTES Y VENTA DE APARTAMENTOS DE LA EMPRESA NUEVO HORIZONTE S.A.S.	2015	f	T	Aplicación Web	t
1306	SISTEMA DE INFORMACIÓN DEL FONDO DE SEGURIDAD SOCIAL EN SALUD DE LA UNIVERSIDAD DE NARIÑO MODULO DE MANEJO Y CONTROL DE RIPS	2015	f	T	Aplicación Web	t
1337	SAC - SISTEMA ORIENTADO A LA WEB PARA SOPORTAR EL PROCESO DE AUTOEVALUACIÓN CON FINES DE ACREDITACIÓN DE LOS PROGRAMAS DE PREGRADO DE LA UNIVERSIDAD DE NARIÑO	2015	f	T	Aplicación Web	t
1282	SISTEMA WEB PARA LA ADMINISTRACIÓN Y GESTIÓN INVESTIGATIVA DEL SISTEMA DE INVESTIGACIONES DE LA UNIVERSIDAD DE NARIÑO. MÓDULO GESTIÓN DE CATEGORÍAS DEL ESTATUTO DEL INVESTIGADOR	2010	f	T	Aplicación Web	t
12	SWIPP - SISTEMA WEB PARA LA OPTIMIZACION DE PRUEBAS DE INTERESES Y PREFERENCIAS PROFESIONALES	2010	f	T	Aplicación Web	t
13	SISCAV SISTEMA DE INFORMACIÓN INTEGRADO PARA EL REGISTRO, CONTROL Y ADMINISTRACION  DE INFORMACION DE LA ALIANZA ESTRATEGICA “CAFE VIDA” DEL MUNICIPIO DE LA UNION AL NORTE DE NARIÑO	2011	f	T	Aplicación Web	t
16	KNOWGER: AMBIENTE VIRTUAL PARA LA GESTIÓN DE CONOCIMIENTO PARA INTEGRAR LA LABOR ACADEMICA E INVESTIGATIVA DE LA FACULTAD DE INGENIERIA DE LA UNIVERSIDAD DE NARIÑO	2010	f	T	Aplicación Web	t
1376	APLICATIVO PARA EL DESARROLLO DEL CRONOGRAMA DEL PROCESO DE FACTURACION EN CENTRALES ELECTRICAS DE NARIÑO S.A. E.S.P (CEDENAR)	2010	f	T	Aplicación Web	t
19	DIONISIO: PROTOTIPO DE MODELADOR DE PROBLEMAS DE SIMPLEX	2011	f	T	Inteligencia Artificial	t
24	TECNICAS DE AUDITORIA DE SISTEMAS APLICADAS AL PROCESO DE CONTRATACIÓN Y PAGINAS WEB EN LAS ENTIDADES OFICIALES DEL DEPARTAMENTO DE NARIÑO: ALCALDÍA MUNICIPAL DE BUESACO Y ALCALDÍA MUNICIPAL DE CHACHAGUI	2011	t	T	Auditoria	f
20	IMPLEMENTACIÓN DEL MODULO DE RADICACIÓN DE CORRESPONDENCIA INTERNA Y EXTERNA EN LA GOBERNACIÓN DE NARIÑO, SEGUN ACUERDO CON LA LEY 594 DEL 2000	2011	f	T	Aplicación Web	t
26	OBJETOS VIRTUALES DE APRENDIZAJE Y REPOSITORIO DIGITAL COMO APOYO EN LA ASIGNATURA DE TECNOLOGÍA E INFORMÁTICA DE GRADO QUINTO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	2011	f	T	OVAS	t
28	TECNICAS DE AUDITORIA DE SISTEMAS APLICADAS AL PROCESO DE CONTRATACIÓN Y PAGINAS WEB EN ENTIDADES OFICIALES DEL DEPARTAMENTO DE NARIÑO, EMPOOBANDO E.S.P. Y ALCALDÍA MUNICIPAL DE IPIALES	2011	t	T	Auditoria	f
30	AUDITORIA INFORMÁTICA EN EL ÁREA DE SISTEMAS E INDICADORES DE FUNCIONAMIENTO DEL HARDWARE EN LA EMPRESA SOLIDARIA DE SALUD EMSSANAR E.S.S. DEL DEPARTAMENTO DE NARIÑO	2012	f	T	Auditoria	f
1393	IMPLEMENTACIÓN DEL SISTEMA DE INFORMACIÓN WEB  DE LOS  CONSULTORIOS JURÍDICOS Y CENTRO DE CONCILIACIÓN DE LA UNIVERSIDAD MARIANA	2012	t	T	Aplicación Web	t
32	 OBJETOS VIRTUALES DE APRENDIZAJE COMO APOYO EN LA ASIGNATURA DE TECNOLOGIA E INFORMATICA DE GRADO SEXTO EN LAS INSTITUCIONES EDUCATIVAS DEL MUNICIPIO DE PASTO	2012	f	T	OVAS	f
34	 ESTUDIO DE EFICIENCIA ENERGETICA APLICADA A LA ILUMINACION, LEVANTAMIENTO, DIAGNOSTICO Y REDISEÑO DE LA RED ELECTRICA Y RED DE DATOS DEL INSTITUTO DEPARTAMENTAL DE SALUD DE NARIÑO	2012	f	T	Redes y Telematica	f
1398	IMPLEMENTACIÓN DE UNA SOLUCIÓN INFORMÁTICA PARA FACTURACIÓN Y RECAUDO DEL IMPUESTO PREDIAL UNIFICADO, COMO MÓDULO INTEGRADO AL APLICATIVO COMPUCONTA	2013	f	T	Aplicación Web	t
41	 AUDITORIA DE SISTEMAS APLICADA AL SISTEMA DE INFORMACION DE LA IPS INDIGENA GUAITARA DEL MUNICIPIO DE IPIALES	2013	f	T	Auditoria	f
44	SERVICIO WEB PARA LA DIVULGACIÓN DE DATOS DE EVENTOS SÍSMICOS LOCALIZADOS POR EL SISTEMA DE MONITOREO DEL OBSERVATORIO VULCANOLÓGICO Y SISMOLÓGICO DE PASTO (OVSP), SERVICIO GEOLÓGICO COLOMBIANO APLICANDO EL ESTÁNDAR QUAKEML	2014	f	T	Aplicación Web	t
47	ELABORACIÓN E IMPLEMENTACIÓN DE UNA APLICACIÓN WEB QUE MANEJE EL TABLERO DE REQUERIMIENTOS Y PROYECTOS DE LA FÁBRICA DE SOFTWARE GLOBALHITSS SEDE COLOMBIA INTEGRADA AL SISTEMA DE RECURSOS COMPARTIDOS EN SHAREPOINT	2015	f	T	Aplicación Web	t
36	 SAMAREYSOFT – SISTEMA WEB PARA LA GESTION DE LA PRODUCCION Y COMERCIALIZACION DE PRODUCTOS DERIVADOS DEL CAFE PARA LA EMPRESA SAMAREY – LA UNION (NARIÑO)	2013	f	T	Aplicación Web	t
22	SISTEMA ELECTRONICO DE ALERTA TEMPRANA POR VARIACION EXTREMA EN EL NIVEL DEL MAR COMO UNA CONTRUBUCION A LA DISMINUCION DE LA VULNERABILIDAD POR RIESGO DE TSUNAMI EN LAS POBLACIONES COSTERAS DEL LITORAL PACIFICO COLOMBIANO	2011	f	T	Aplicación De Escritorio	t
\.


--
-- Name: gradeworks_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gradeworks_work_id_seq', 48, true);


--
-- Data for Name: heuristicevaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY heuristicevaluation (ue_id, ue_applica, ue_sysvisi, ue_usrlang, ue_ctrfree, ue_constan, ue_feedbak, ue_errprev, ue_flexefi, ue_edminim, ue_helpdoc) FROM stdin;
\.


--
-- Name: heuristicevaluation_ue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('heuristicevaluation_ue_id_seq', 1, false);


--
-- Data for Name: methodologies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY methodologies (method_id, method_name) FROM stdin;
2	AUP
1	Scrum
4	IWeb
3	Incremental
6	Cascada
5	XP
8	Otro
7	RUP
9	No Especificado
10	Modelo Espiral
14	Cascada
\.


--
-- Data for Name: practiceevaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY practiceevaluation (pe_id, pe_applic, pe_practi, pe_status, pe_dateti) FROM stdin;
\.


--
-- Name: practiceevaluation_pe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('practiceevaluation_pe_id_seq', 1, false);


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY registration_registrationprofile (id, activation_key, user_id, activated) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 1, false);


--
-- Data for Name: registration_supervisedregistrationprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY registration_supervisedregistrationprofile (registrationprofile_ptr_id) FROM stdin;
\.


--
-- Data for Name: webaplications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webaplications (app_id, app_metho, app_cmenb, app_entit, app_secto, app_produ, app_trodu, app_updat, app_dupda, app_lback, app_lfron, app_nsgdb, app_bfram, app_appse, app_tcost, app_qualf, app_ffram) FROM stdin;
1272	3	1	Publica	Servicios	f	1 Meses	2017-10-17	Corponariño es entidad Privada, Cual es su sector\r\nValidar en campo tiempo de en producción desde lanzamiento, fecha de ultima actualización y estado de producción.\r\nEl costo tiempo de desarrollo segun cronograma. Validar en capo si es necesario.\r\nTrabajo de grado realizado como pasantia.\r\n\r\nFramework JSF Java Server Faces\r\nUso de NetBean Entorno de Desarrollo	Java	Html,XML	PostgreSQL	Java Server Faces	GlassFish	4 Meses	0	No Especificado
1356	5	2	Publica	Servicios	f	1 Meses	2017-10-17	Archivo Central e Histórico de Tuquerres, que tipo de sector es este ?\r\nValidad en campo el tiempo de uso desde lanzamiento, la fecha de ultima actualización, costo de tiempo y estado de producción.\r\n\r\nNo especifica las tecnologias utilizadas en la construcción del producto.	No Especificado	Html	No Especificado	No Especificado	No Especificado	1 Meses	0	No Especificado
13	5	2	Privada	Agropecuario	f	1 Meses	2017-10-16	El sector beneficiado podria ser agroindustria, se trata de una entidad privada\r\nPHPDesigner como editor de texto o entorno de desarrollo\r\n\r\nValidar detalle de produccion, costo tiempo de desarrollo\r\nDividido en 6 modulos	PHP	JavaScript,Html,CSS,XML	MySQL	No Especificado	Apache	1 Meses	0	JQuery
1375	8	1	Privada	Industria	f	1 Meses	2017-10-09	Podria ser agroindustria\r\nValidar detalles en campo\r\nSe el defino como sitio web, uso de SGC Joomla\r\nY un modulo para aspirantes\r\nProdria ser Joomla un Famework front-end y back-end	PHP	Html	MySQL	No Especificado	Apache	1 Meses	0	No Especificado
1390	6	1	Publica	Servicios	f	1 Meses	2017-10-11	Servicio de salud publica\r\nValidar detalles en campo\r\nModalidad Pasantia\r\nUso de Adobe Flash\r\nAdobe Acrobat Reader\r\nDreamWeaver	PHP	JavaScript	MySQL	No Especificado	Apache	1 Meses	0	No Especificado
1355	4	1	Publica	Solidario	f	1 Meses	2017-10-11	Validar detalles en Campo\r\nQue tipo y que sector es ?\r\nUso de gestor de Contenidos para .NET DotNetNuke	No Especificado	XML	SQL Server	.NET	No Especificado	1 Meses	0	No Especificado
9	3	1	Publica	Educación	t	1 Meses	2017-10-09	Como paquete de aplicacion usa WampServer, los datos de ultima actualización, costos de tiempo, tiempo en producción y si esta actualmente en producción se deben validar en campo. Segun cronograma documentación fueron seis meses de desarrollo. Validar si es aplicación web, dado que es usa un CMS o gestor de archivos JoomLa.\n\nEl sector podria ser deporte y educación?\nJoomLa podria ser considerado un framework?	PHP	JavaScript,Html,XML	MySQL	No Especificado	Apache	6 Meses	0	JQuery
1369	5	2	Mixta	Educación	f	1 Meses	2017-10-16	Costo tiempo de desarrollo obtenido de documentación, debera validarse de ser necesario, software dirigido a MiPymes es posible adicionar un sector.\r\nEl tiempo uso desde lanzamiento validar en campo, al igual el estado de producción.\r\nUso de herramientas Java Servlets, Java Server Pages (JSP).\r\n\r\nManifiesto de crear una aplicación web de uso publico, bajo la licencia GPL	Java	Html	PostgreSQL	No Especificado	TomCat	8 Meses	0	No Especificado
1377	3	1	Publica	Educación	f	1 Meses	2017-10-16	Tiempó en producción desde lanzamiento, fecha de ultima actualización, costo tiempo de desarrollo y si esta actualmente en producción se debe validar en campo	PHP	Html	MySQL	No Especificado	Apache	1 Meses	0	No Especificado
18	5	3	Publica	Servicios	f	1 Meses	2017-09-06	Que sector es la fiscalia seccional nariño ?\r\nValidar detalles en campo.\r\nNombre Aplicación SISAGEF\r\n	C#	XAML	MySQL	.NET	No Especificado	1 Meses	0	No Especificado
1279	9	1	Publica	Servicios	f	1 Meses	2017-10-18	Que sector son las alcaldias?\r\nSegun inform documento el tiempo de desarrollo es de seis Meses\r\nDesarrollado en modalidad pasantia\r\nUso de XAMPP Version 1.7.3\r\nNombre Aplicación SII	PHP	JavaScript,Html,CSS	PostgreSQL	No Especificado	Apache	6 Meses	0	JQuery
12	7	2	Publica	Educación	f	1 Meses	2017-10-08	Destinado a el programa de psicologia de la Universidad de Nariño, o realizado en conjunto con asesoria docentes adjuntos programa de psicologia.\r\nEl tiempo en producción, ultima actualización, costo tiempo de desarrollo y estado en producción se deben validar en campo.	PHP	Html	MySQL	No Especificado	Apache	1 Meses	0	No Especificado
11	7	2	Publica	Educación	f	1 Meses	2017-10-16	Tiempo uso desde lanzamiento, fecha de ultima actualización, costo tiempo de desarrollo y esto de producción validar en campo.\r\n\r\nUso de herramienta Open Database Connectivity\r\n\r\nVisual Basic es similar a C#, son lo mismo	Visual Basic	JavaScript,Html	MySQL	.NET	IIS	1 Meses	0	No Especificado
20	8	1	Publica	Servicios	f	1 Meses	2017-10-10	Que sector es la Gobernación de Nariño ?\r\nDesarrollo de software en modalidad pasantia.\r\nRecomienda uso de Sistema Operativo Linux Debian\r\nCliente Firefox\r\nUso de PGAdmin\r\nMetodologias como observacion directa, entrevista\r\nUso de phpMyAdmin	PHP	Html	PostgreSQL	No Especificado	Apache	1 Meses	0	No Especificado
25	2	1	Publica	Educación	f	1 Meses	2017-10-10	Validar detalles en campo            	C#	XML	MySQL	.NET	No Especificado	1 Meses	0	JQuery
27	7	1	Publica	Servicios	f	1 Meses	2017-10-10	Que sector son los hospitales ?\r\nValidar detalles en campo\r\nModalidad Aplicación	PHP	JavaScript,Html	MySQL	No Especificado	Apache	1 Meses	0	JQuery
1270	6	1	Publica	Educación	f	1 Meses	2017-10-03	Que sector de destino tiene esta aplicación ?\r\nValidar detalles en campo\r\nUso de CorelDraw, que implica ?\r\nUso de Wamp Server	PHP	JavaScript,Html	PostgreSQL	No Especificado	Apache	1 Meses	0	No Especificado
1294	5	2	Publica	Solidario	f	1 Meses	2017-10-10	Que sector es el fondo de seguridad social ?\r\nQue es ScriptCase, de que se trata, es un framework de que tipo ?\r\nValidar detalles en campo	PHP	JavaScript,Html	PostgreSQL	No Especificado	No Especificado	1 Meses	0	JQuery
1389	7	1	Publica	Servicios	f	1 Meses	2017-10-08	 Validar detalles en campo\r\nQue sector son las alcaldias ?\r\nSegun informe de cronograma tiempo de desarrollo 6 meses\r\nDesarrollado en modalidad pasantia\r\nUso de JQuery UI framework front end\r\nCuty Capt, FullCalendar, DataTables\r\nEs posible y util caracterizar la descripción de versiones	PHP	JavaScript,Html	PostgreSQL	No Especificado	Apache	6 Meses	0	JQuery,JQuery UI,FullCalendar
1364	8	1	Privada	Servicios	f	1 Meses	2017-10-09	Desarrollo de pasantia en la empresa Compuconta Ltda\r\nValidar datos en campo\r\nNo especifica metodologia de desarrollo	PHP	JavaScript,XML	PostgreSQL	No Especificado	No Especificado	1 Meses	0	JQuery
1393	6	1	Privada	Educación	f	1 Meses	2017-10-17	Modalidad Pasantia\r\nJSP o Java Server Pages Que es ?\r\nUso de servlets\r\nValidar detalles en campo\r\n	Java	JavaScript,Html,CSS	No Especificado	Java Server Pages	No Especificado	1 Meses	0	No Especificado
1359	6	1	Publica	Servicios	f	1 Meses	2017-10-17	Que sector son las alcaldias ?\r\nValidar detalles en campo\r\nUso conceptual de POO\r\nDividido en seis modulos	PHP	Html	MySQL	No Especificado	Apache	1 Meses	0	No Especificado
40	2	2	Publica	Educación	f	1 Meses	2017-10-17	Evalua la usabilidad como caso de uso, no aplica tecnica\r\n	PHP	JavaScript,Html,XML	PostgreSQL	Yii PHP	No Especificado	1 Meses	0	No Especificado
1360	5	2	Publica	Servicios	f	1 Meses	2017-10-03	Validar detalles\r\nQue sector son los hospitales\r\nEntorno de desarrollo NetBeans	Java	Html	PostgreSQL	Java Server Faces	No Especificado	1 Meses	0	No Especificado
1373	7	1	Publica	Educación	f	1 Meses	2017-10-09	Verificar 	PHP	JavaScript,Html,CSS	MySQL	No Especificado	Apache	1 Meses	0	No Especificado
1385	7	2	Publica	Educación	f	1 Meses	2017-10-25	SQL Server 2008 Standar Edition	C#	JavaScript,Html,XML	SQL Server	.NET	IIS	1 Meses	0	No Especificado
21	7	2	Mixta	Servicios	f	1 Meses	2017-09-12	Destinado a comunidad en general\r\nEntorno de desarrollo Microsoft Visual Studio 2010\r\nMySQL Version 5.1\r\nFramwork 4.0\r\nParece ser una aplicacion de escritorio	C#	No Especificado	MySQL	No Especificado	No Especificado	1 Meses	0	No Especificado
1374	7	2	Publica	Educación	f	1 Meses	2017-10-09	A que sector va destinada esta aplicación ?\r\nQue es SOAP ?\r\nQue es REST ?\r\nMenciona creación de aplicación de esctitorio !\r\nUso de lenguaje C# y Visual Basic\r\nJAVA para el desarrollo de la aplicación movil	PHP	Html,CSS,JSon,XML	No Especificado	No Especificado	Apache	1 Meses	0	No Especificado
1345	5	2	Privada	Financiero	f	1 Meses	2017-10-09	Verificar sector de destino\r\nValidar detalles en campo	Java	Html,XML	PostgreSQL	Java Server Pages	TomCat	1 Meses	0	No Especificado
1398	5	1	Privada	Servicios	f	1 Meses	2017-10-02	AT&T Modalidad Pasantia\r\nQue sector pertenece la empresa\r\nEs adicion de Modulo al software Compuconta\r\nEl modulo principal es una aplicacion web, como se puede adicionar esta apliacion en la investigacion.\r\n\r\nNo especifica ninguna herramienta tecnologica	No Especificado	No Especificado	No Especificado	No Especificado	No Especificado	1 Meses	0	No Especificado
23	5	1	Publica	Servicios	f	1 Meses	2017-10-10	Dividido en tres módulos\r\nModalidad pasantía\r\nQue tipo de sector es la entidad pasto deporte ?\r\nMicrosoft Report Viewer para visualización de reportes\r\nASP.NET Framework 3.5	C#	Html	SQL Server	.NET	IIS	1 Meses	0	No Especificado
1348	5	1	Publica	Industria	f	1 Meses	2017-10-17	Validar detalles en campo\r\nDesarrollo en modalidad pasantia\r\n	PHP	JavaScript,Html,XML	PostgreSQL	No Especificado	No Especificado	1 Meses	0	No Especificado
1396	6	1	Publica	Educación	f	1 Meses	2017-10-17	La evaluacion de la usabilidad no es formal, se menciona como atributo de interes\r\nQue hacer en estos casos.\r\nQue sector corresponde ?\r\nDesarrollado en modalidad Pasantia\r\nNo especifica SGDB ?	PHP	JavaScript,Html,CSS	MySQL	No Especificado	No Especificado	1 Meses	0	No Especificado
1384	5	1	Publica	Educación	f	1 Meses	2017-10-11	Validar detalles en campo\r\nDividido en cinco modulos\r\nMicrosoft Visual Studio 2010	C#	Html	PostgreSQL	.NET	IIS	1 Meses	0	No Especificado
1388	5	1	Publica	Servicios	f	1 Meses	2017-10-17	Validar detalles en campo\r\nQue sector beneficia esta aplicación\r\nDividido en nueve modulos	C#	Html	Microsoft Access	.NET	IIS	1 Meses	0	JQuery
44	5	2	Publica	Servicios	f	1 Meses	2017-10-01	Que sector es este ?\r\nUso de Java EE 6\r\nUso de Metro UI framework Front-End\r\nUso de JavaScript Google Maps API	PHP	JavaScript,XML	PostgreSQL	No Especificado	Apache	1 Meses	0	JQuery,JQuery UI
1326	2	1	Publica	Solidario	f	1 Meses	2017-10-01	Que sector pertenece esta aplicación ?\r\nUso de API JavaScript Google Maps, HighCharts, PHPExcel	PHP	JavaScript	PostgreSQL	No Especificado	Apache	1 Meses	0	JQuery
1290	5	1	Publica	Solidario	f	1 Meses	2017-09-24	Que sector pertenece ?\r\nValidar detalles en campo\r\nUso de MVC  a traves de PHP POO, No especifica framework\r\nCreacion de Framework PHP\r\nUso de Smarty, JPGraph, PHPMailer, FPDF\r\nCompatibilidad con Apache y ISS	PHP	JavaScript,Html,CSS	MySQL	No Especificado	IIS	1 Meses	0	JQuery,Bootstrap
47	9	1	Privada	Comunicaciones	f	 Meses	2017-10-09	Desarrollada como pasantia para Hitss Colombia\r\nMetodologia de Desarrollo AMMI Creada por Hitss Colombia\r\nModalidad Pasantia	C#	JavaScript	SQL Server	.NET	No Especificado	 Meses	0	JQuery
29	5	1	Privada	Industria	f	1 Meses	2017-10-01	Validar detalles en campo\r\nUso de XAjax Que es ?\r\nNombre aplicación CICY\r\nUso de XAMPP 1.6.5	PHP	JavaScript,Html,CSS,XML	MySQL	Cake PHP	Apache	1 Meses	0	JQuery
1276	7	1	Publica	Educación	f	1 Meses	2017-10-03	Validar detalles en campo\r\nUso de TCPDF para reportes\r\nLibChart Que es ?\r\nzCLIP, Table Sorter\r\nTable Pagination\r\nQue es WinLsis ?\r\nMetodologia POO	PHP	JavaScript,CSS	MySQL	No Especificado	Apache	1 Meses	0	JQuery,JQuery UI
1349	6	1	Mixta	Servicios	f	1 Meses	2017-10-04	Que sector es la empresa Empopasto ?\r\nValidar detalles en campo	PHP	JavaScript,Html	PostgreSQL	No Especificado	Apache	1 Meses	0	JQuery
1368	4	3	Publica	Servicios	f	1 Meses	2017-10-01	Que sector pertenece el obeserbatorio de justicia de nariño ?\r\nValidar detalles en campo.\r\nHighCharts que es ?\r\nUso de Case Enterprise Architect\r\nDB Designer 4\r\nUso de REM	PHP	JavaScript,Html,CSS,XML	MySQL	No Especificado	Apache	1 Meses	0	JQuery
1337	5	2	Publica	Educación	f	1 Meses	2017-10-01	Validar detalles en campo\r\nUso de PHPMailer, FPDF\r\nNo especifica servidor de aplicaciones	PHP	JavaScript,Html	PostgreSQL	CodeIgniter	No Especificado	1 Meses	0	JQuery,JQuery UI
1316	1	1	Publica	Educación	f	1 Meses	2017-10-09	Uso de JasperReport, JavaPersistence.\r\nUso de NetBean entorno de Desarrollo	Java		PostgreSQL	Java Server Faces	No Especificado	1 Meses	0	No Especificado
1358	5	2	Mixta	Servicios	f	1 Meses	2017-10-08	Visual Estudio 2010 entorno de desarrollo\r\nSQL Server 2008 r2\r\n\r\nEl transporte publico es mixto\r\nCaracterizada como aplicación MASHUP por usar API o servicios de otras aplicaciones\r\nComo objetivo se propone crear una Bodega de Datos\r\nEs posible clasificarle como Bases de Datos Tambien	C#	JavaScript,Html	SQL Server	.NET	IIS	1 Meses	0	No Especificado
16	10	3	Publica	Educación	f	1 Meses	2017-10-17	No especifica framework FrontEnd\r\nValidar tiempo de uso, fecha ultima actulización, costo tiempo de desarrollo y estado de producción en campo.	C#	JavaScript,Html,XML	Oracle	.NET	IIS	1 Meses	0	No Especificado
1376	3	1	Mixta	Servicios	f	1 Meses	2017-10-03	Aplicación Web destinada a la empresa Sedenar, empresa de servicios publicos de caracter Mixto ?\r\n\r\nValidar costo tiempo de desarrollo, fecha ultima actualización, y tiempo de uso desde lanzamiento.\r\n\r\nFramework ASP.NET AJAX como framework front-end y back-end	C#	JavaScript,Html,XML	Oracle	.NET	IIS	1 Meses	0	No Especificado
1370	4	2	Mixta	Educación	f	1 Meses	2017-10-18	Va dirigido a comunidad en general, una aplicación web que administra y procesa información de especialistas en ecología y geografía. Aplicación que cuenta con siete modulos.\r\n\r\nSe debe validar el tiempo de uso desde lanzamiento en producción, el costo de tiempo en desarrollo y la fecha de la ultima actualización. De la misma forma verificar si se encuentra en producción.	C#	Html,XML	SQL Server	.NET	IIS	1 Meses	0	JQuery
1282	7	1	Publica	Educación	f	1 Meses	2017-10-17	Uso de Enterprise Architect,  Framework .NET ODBC.\r\nTiempo de uso desde lanzamiento, fecha de ultima actualización y si esta actualmente en producción se deben validar en campo, al igual que el costo tiempo de desarrollo.	C#	JavaScript,Html,XML	MySQL	.NET	IIS	1 Meses	0	JQuery
1277	8	1	Publica	Educación	f	1 Meses	2017-10-19	Modalidad pasantia.\r\n\r\nAdministrador de origenes ODBC\r\nSegun cronograma de actividades duracion de proyecto 6 Meses\r\n\r\nValida tiempo de uso desde lanzamiento y fecha de ultima actualización\r\nNo especifica metodologia de desarrollo	C#	Html	PostgreSQL	.NET	IIS	6 Meses	0	No Especificado
31	9	2	Mixta	Servicios	f	1 Meses	2017-10-10	Validar detalles en campo\r\nSector servicios es el adecuado ?\r\nMetodo Orientado a objetos, es un metodo ?\r\nASP.NET Framework 3.5\r\nSQL Server 2008 Express Edition\r\nUso de Report Viewer, es framework Front-End\r\nMicrosoft Visual Studio Express	C#	JavaScript,Html,XML	SQL Server	.NET	IIS	1 Meses	0	JQuery
1320	5	1	Privada	Financiero	f	1 Meses	2017-10-09	Que sector pertenece las constructoras?\r\nMirar bien la eleccion de tecnologias que se usan, en este caso parece que se desarrollo el producto sin tener en cuenta la disponibilidad de esas tecnologias en la empresa donde se implemetaria el sistema ? 	C#	JavaScript,Html,CSS	SQL Server	.NET	IIS	1 Meses	0	JQuery
46	6	1	Publica	Servicios	f	1 Meses	2017-10-09	Validar detalles en campo\r\nUso de Visual Studio 2013\r\nUso de Framework 3.5.2\r\nQue sector es una IPS ?	C#	Html,CSS	SQL Server	.NET	IIS	1 Meses	0	No Especificado
36	7	2	Privada	Industria	f	1 Meses	2017-11-07	Verificar sector de destino\r\nUso de XAMPP	PHP	JavaScript,Html,JSon,XML	MySQL	No Especificado	Apache	1 Meses	0	JQuery
\.


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: developmentpractice developmentpractice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY developmentpractice
    ADD CONSTRAINT developmentpractice_pkey PRIMARY KEY (prac_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: efforts efforts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY efforts
    ADD CONSTRAINT efforts_pkey PRIMARY KEY (id);


--
-- Name: gradeworks gradeworks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gradeworks
    ADD CONSTRAINT gradeworks_pkey PRIMARY KEY (work_id);


--
-- Name: heuristicevaluation heuristicevaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY heuristicevaluation
    ADD CONSTRAINT heuristicevaluation_pkey PRIMARY KEY (ue_id);


--
-- Name: methodologies methodologies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY methodologies
    ADD CONSTRAINT methodologies_pkey PRIMARY KEY (method_id);


--
-- Name: practiceevaluation practiceevaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY practiceevaluation
    ADD CONSTRAINT practiceevaluation_pkey PRIMARY KEY (pe_id);


--
-- Name: registration_registrationprofile registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: registration_supervisedregistrationprofile registration_supervisedregistrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_supervisedregistrationprofile
    ADD CONSTRAINT registration_supervisedregistrationprofile_pkey PRIMARY KEY (registrationprofile_ptr_id);


--
-- Name: webaplications webaplications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webaplications
    ADD CONSTRAINT webaplications_pkey PRIMARY KEY (app_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: developmentpractice developmentpractice_prac_meth_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY developmentpractice
    ADD CONSTRAINT developmentpractice_prac_meth_fkey FOREIGN KEY (prac_meth) REFERENCES methodologies(method_id);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: heuristicevaluation heuristicevaluation_ue_applica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY heuristicevaluation
    ADD CONSTRAINT heuristicevaluation_ue_applica_fkey FOREIGN KEY (ue_applica) REFERENCES webaplications(app_id);


--
-- Name: practiceevaluation practiceevaluation_pe_applic_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY practiceevaluation
    ADD CONSTRAINT practiceevaluation_pe_applic_fkey FOREIGN KEY (pe_applic) REFERENCES webaplications(app_id);


--
-- Name: practiceevaluation practiceevaluation_pe_practi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY practiceevaluation
    ADD CONSTRAINT practiceevaluation_pe_practi_fkey FOREIGN KEY (pe_practi) REFERENCES developmentpractice(prac_id);


--
-- Name: registration_registrationprofile registration_registr_user_id_5fcbf725_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registr_user_id_5fcbf725_fk_auth_user FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_supervisedregistrationprofile registration_supervi_registrationprofile__0a59f3b2_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_supervisedregistrationprofile
    ADD CONSTRAINT registration_supervi_registrationprofile__0a59f3b2_fk_registrat FOREIGN KEY (registrationprofile_ptr_id) REFERENCES registration_registrationprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webaplications webaplications_app_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webaplications
    ADD CONSTRAINT webaplications_app_id_fkey FOREIGN KEY (app_id) REFERENCES gradeworks(work_id);


--
-- Name: webaplications webaplications_app_metho_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webaplications
    ADD CONSTRAINT webaplications_app_metho_fkey FOREIGN KEY (app_metho) REFERENCES methodologies(method_id);


--
-- PostgreSQL database dump complete
--

