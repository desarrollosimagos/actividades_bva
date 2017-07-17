--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.14
-- Dumped by pg_dump version 9.4.5
-- Started on 2016-02-11 08:47:03 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 192 (class 3079 OID 11647)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 192
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 1430466)
-- Name: actividad_registros; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad_registros (
    id integer NOT NULL,
    nom_actividad character varying(100) NOT NULL,
    des_actividad text NOT NULL,
    porcentaje character varying(3) NOT NULL,
    status character varying(1) NOT NULL,
    fecha_i date NOT NULL,
    fecha_p date NOT NULL,
    fecha_f date,
    observacion text,
    cod_actividad_id integer NOT NULL,
    cod_departamento_id integer,
    user_create_id integer,
    user_update_id integer,
    fecha_o date
);


--
-- TOC entry 162 (class 1259 OID 1430472)
-- Name: actividad_registros_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actividad_registros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 162
-- Name: actividad_registros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE actividad_registros_id_seq OWNED BY actividad_registros.id;


--
-- TOC entry 163 (class 1259 OID 1430474)
-- Name: administrador_actividad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE administrador_actividad (
    id integer NOT NULL,
    cod_actividad character varying(50) NOT NULL,
    nom_actividad character varying(50) NOT NULL,
    des_actividad text NOT NULL,
    status character varying(1) NOT NULL,
    fecha_i date NOT NULL,
    fecha_p date NOT NULL,
    observacion text,
    porcentaje character varying(3),
    departamento_id integer,
    user_create_id integer,
    user_update_id integer,
    fecha_o date,
    fecha_f date
);


--
-- TOC entry 164 (class 1259 OID 1430480)
-- Name: administrador_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE administrador_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 164
-- Name: administrador_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE administrador_actividad_id_seq OWNED BY administrador_actividad.id;


--
-- TOC entry 165 (class 1259 OID 1430482)
-- Name: asignar_asignar; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE asignar_asignar (
    id integer NOT NULL,
    "codigoA" character varying(50),
    nom_actividad text NOT NULL,
    fecha_i date NOT NULL,
    "fechaP_a" date NOT NULL,
    indicaciones text,
    cod_actividad_id integer NOT NULL,
    "codigoDepartamento_id" integer,
    "codigoDepartamentoA_id" integer,
    user_create_id integer,
    user_update_id integer,
    fecha_p date,
    des_actividad text,
    fecha_f date,
    porcentaje character varying(3)
);


--
-- TOC entry 166 (class 1259 OID 1430488)
-- Name: asignar_asignar_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE asignar_asignar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 166
-- Name: asignar_asignar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE asignar_asignar_id_seq OWNED BY asignar_asignar.id;


--
-- TOC entry 167 (class 1259 OID 1430490)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- TOC entry 168 (class 1259 OID 1430493)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 168
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 169 (class 1259 OID 1430495)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 1430498)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 170
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 171 (class 1259 OID 1430500)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 1430503)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 172
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 173 (class 1259 OID 1430505)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 1430508)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 1430511)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 176 (class 1259 OID 1430513)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 177 (class 1259 OID 1430515)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 1430518)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 179 (class 1259 OID 1430520)
-- Name: configuraciones_departamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE configuraciones_departamento (
    id integer NOT NULL,
    cod_departamento character varying(50) NOT NULL,
    nom_departamento character varying(100) NOT NULL,
    user_create_id integer,
    user_update_id integer,
    siglas character varying(100)
);


--
-- TOC entry 180 (class 1259 OID 1430523)
-- Name: configuraciones_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE configuraciones_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 180
-- Name: configuraciones_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE configuraciones_departamento_id_seq OWNED BY configuraciones_departamento.id;


--
-- TOC entry 181 (class 1259 OID 1430525)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- TOC entry 182 (class 1259 OID 1430532)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 182
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 183 (class 1259 OID 1430534)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 1430537)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 184
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 185 (class 1259 OID 1430539)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 1430545)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 187 (class 1259 OID 1430547)
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 1430553)
-- Name: login_perfilesusuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE login_perfilesusuario (
    id integer NOT NULL,
    tlf character varying(15) NOT NULL,
    user_accion character varying(15),
    user_id integer NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1430556)
-- Name: login_perfilesusuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE login_perfilesusuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 189
-- Name: login_perfilesusuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE login_perfilesusuario_id_seq OWNED BY login_perfilesusuario.id;


--
-- TOC entry 190 (class 1259 OID 1430558)
-- Name: usuario_depart_usuariodepart; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuario_depart_usuariodepart (
    id integer NOT NULL,
    grupo_usuario integer,
    departamento_id integer,
    usuario_id integer
);


--
-- TOC entry 191 (class 1259 OID 1430561)
-- Name: usuario_depart_usuariodepart_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuario_depart_usuariodepart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 191
-- Name: usuario_depart_usuariodepart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuario_depart_usuariodepart_id_seq OWNED BY usuario_depart_usuariodepart.id;


--
-- TOC entry 1847 (class 2604 OID 1430563)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_registros ALTER COLUMN id SET DEFAULT nextval('actividad_registros_id_seq'::regclass);


--
-- TOC entry 1848 (class 2604 OID 1430564)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY administrador_actividad ALTER COLUMN id SET DEFAULT nextval('administrador_actividad_id_seq'::regclass);


--
-- TOC entry 1849 (class 2604 OID 1430565)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignar_asignar ALTER COLUMN id SET DEFAULT nextval('asignar_asignar_id_seq'::regclass);


--
-- TOC entry 1850 (class 2604 OID 1430566)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1851 (class 2604 OID 1430567)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1852 (class 2604 OID 1430568)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1853 (class 2604 OID 1430569)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1854 (class 2604 OID 1430570)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1855 (class 2604 OID 1430571)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1856 (class 2604 OID 1430572)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuraciones_departamento ALTER COLUMN id SET DEFAULT nextval('configuraciones_departamento_id_seq'::regclass);


--
-- TOC entry 1857 (class 2604 OID 1430573)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1859 (class 2604 OID 1430574)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1860 (class 2604 OID 1430575)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 1861 (class 2604 OID 1430576)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY login_perfilesusuario ALTER COLUMN id SET DEFAULT nextval('login_perfilesusuario_id_seq'::regclass);


--
-- TOC entry 1862 (class 2604 OID 1430577)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario_depart_usuariodepart ALTER COLUMN id SET DEFAULT nextval('usuario_depart_usuariodepart_id_seq'::regclass);


--
-- TOC entry 2064 (class 0 OID 1430466)
-- Dependencies: 161
-- Data for Name: actividad_registros; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 162
-- Name: actividad_registros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actividad_registros_id_seq', 26, true);


--
-- TOC entry 2066 (class 0 OID 1430474)
-- Dependencies: 163
-- Data for Name: administrador_actividad; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 164
-- Name: administrador_actividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('administrador_actividad_id_seq', 40, true);


--
-- TOC entry 2068 (class 0 OID 1430482)
-- Dependencies: 165
-- Data for Name: asignar_asignar; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 166
-- Name: asignar_asignar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('asignar_asignar_id_seq', 61, true);


--
-- TOC entry 2070 (class 0 OID 1430490)
-- Dependencies: 167
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_group (id, name) VALUES (1, 'gerente');
INSERT INTO auth_group (id, name) VALUES (2, 'administrador');
INSERT INTO auth_group (id, name) VALUES (3, 'usuario');


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 168
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 3, true);


--
-- TOC entry 2072 (class 0 OID 1430495)
-- Dependencies: 169
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 170
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2074 (class 0 OID 1430500)
-- Dependencies: 171
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add registros', 7, 'add_registros');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change registros', 7, 'change_registros');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete registros', 7, 'delete_registros');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add perfiles usuario', 8, 'add_perfilesusuario');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change perfiles usuario', 8, 'change_perfilesusuario');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete perfiles usuario', 8, 'delete_perfilesusuario');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add actividad', 9, 'add_actividad');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change actividad', 9, 'change_actividad');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete actividad', 9, 'delete_actividad');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add departamento', 10, 'add_departamento');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change departamento', 10, 'change_departamento');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete departamento', 10, 'delete_departamento');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add asignar', 11, 'add_asignar');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change asignar', 11, 'change_asignar');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete asignar', 11, 'delete_asignar');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add asignadas', 12, 'add_asignadas');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change asignadas', 12, 'change_asignadas');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete asignadas', 12, 'delete_asignadas');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add usuario depart', 13, 'add_usuariodepart');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change usuario depart', 13, 'change_usuariodepart');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete usuario depart', 13, 'delete_usuariodepart');


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 172
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- TOC entry 2076 (class 0 OID 1430505)
-- Dependencies: 173
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (15, 'pbkdf2_sha256$15000$GTIw8xjEW05v$/FaSU0ThRBl/9Y3p2jAKagWwoT26YPKwLiSJy08O+Vg=', '2016-01-12 16:07:06.054898-04:30', true, 'afonseca', 'ADOLMARY CRISTINA', 'FONSECA RUIZ', '13720814', false, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$20000$aiGDh0iw5zal$1zn9HLCCRB3MrApKki7K6SpBijh5Cc/BcW9fnvfMaFc=', '2015-05-22 12:54:43.001975-04:30', true, 'rjimenez', 'RHAYZA TERESA', 'JIMENEZ DE SANCHEZ', '9963310', false, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (4, 'pbkdf2_sha256$20000$6YW9fRddN0Qn$vyoYWY3P/JsukUbF4PuagsJOui7jnCYRUJ1h7owliOg=', '2015-05-22 12:54:43.001975-04:30', true, 'cdiaz', 'CLARA EUGENIA', 'DIAZ ASPILGUETA', '14104154', false, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (21, 'pbkdf2_sha256$20000$wmVjlvAkwcbq$Z50i2Xq81x4gP3LgmkCYl1spbLt4PpBsRh1/gIy5nNo=', '2015-05-22 12:54:43.001975-04:30', true, 'ccalvino', 'CARLOS GERMAN', 'NIÑO VIVAS', '11111111', false, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (22, 'pbkdf2_sha256$20000$GSlNX5FyITb4$UQXSmGK5EXC76Z5xoOt4MOiab0qhaIZnAorWXcZ/SJw=', '2015-05-22 12:54:43.001975-04:30', true, 'ascdfff', 'CARLOS GERMAN', 'NIÑO VIVAS', '11111111', false, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (16, 'pbkdf2_sha256$15000$RpobujdoSeyH$8dx1lFuiOH5qB4KoI8WqZC1RNl6tsTkbPX3kPrD/ob4=', '2016-01-12 10:31:58.517722-04:30', true, 'rcorrea', 'RAQUEL ELENA', 'CORREA VELIZ', '9642873', true, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (18, 'pbkdf2_sha256$20000$pWrwmyojra8V$hqNKAJjieSaG2sBuhZoUZKl4fesienv8C3ppttjxQ7c=', '2015-05-22 12:54:43.001975-04:30', true, 'jtabares', 'JOSE TOMAS', 'TABARES ALBERT', '18232959', true, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (19, 'pbkdf2_sha256$20000$C7GAJ3koR0NN$DIkizl9rzqCUCDNrXsBAwmrPwB9fjK3VtWTB4+CqQWY=', '2015-05-22 12:54:43.001975-04:30', true, 'lramirez', 'LUCY ELIZABETH', 'RAMIREZ PEÑALOZA', '23621566', true, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (17, 'pbkdf2_sha256$20000$EVeMKZpx7f37$fEtmYvcHiKL3WzmMo/HZokFoJgg70KCdhzm1GFYxxxw=', '2015-05-22 12:54:43.001975-04:30', true, 'yhernandez', 'YAMELIN COROMOTO', 'HERNANDEZ LEAL', '17575132', false, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (20, 'pbkdf2_sha256$15000$9dMVSF2Xy2Xa$0lofcHCaK79SxyGJcPQx5GHFD9NEp9NxCebTwtHm2DI=', '2016-01-12 11:37:39.312581-04:30', true, 'mbarreto', 'MARIA GABRIELA', 'BARRETO MUÑOZ', '18078982', true, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (14, 'pbkdf2_sha256$15000$NJKLWCMFbCaE$esI7JL8ht29spsMgUmBdAjJi4191Zh4OpT72iBXanzk=', '2016-01-26 09:51:56.062189-04:30', true, 'japonte', 'JOSUE DANIEL', 'APONTE SEGOVIA', '15649505', true, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (3, 'pbkdf2_sha256$15000$yOfXbARunnaV$0VJGqkzEEF02jv8BzcApDXF8WeSQ+dBCtpDPGdDwFDQ=', '2016-02-07 15:22:46.299271-04:30', true, 'administrador', 'PABLO JOSE', 'GUZMAN VALERA', '9682691', true, true, '2015-05-22 12:54:43.001975-04:30');


--
-- TOC entry 2077 (class 0 OID 1430508)
-- Dependencies: 174
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (34, 16, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (35, 16, 2);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (36, 14, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (37, 15, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (38, 15, 2);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (39, 1, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (41, 4, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (42, 3, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (43, 3, 2);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (44, 18, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (45, 19, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (46, 17, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (47, 20, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (48, 21, 3);


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 48, true);


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 22, true);


--
-- TOC entry 2080 (class 0 OID 1430515)
-- Dependencies: 177
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2082 (class 0 OID 1430520)
-- Dependencies: 179
-- Data for Name: configuraciones_departamento; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (1, 'D0001', 'GERENCIA GENERAL', 3, 3, 'GG');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (2, 'D0002', 'GERENCIA DE CONSULTORÍA', 3, 3, 'GC');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (3, 'D0003', 'GERENCIA DE AUDITORÍA', 3, 3, 'GA');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (5, 'D0005', 'GERENCIA DE ADMINISTRACIÓN', 3, 3, 'GAD');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (6, 'D0006', 'GERENCIA DE DESARROLLO Y APLICACIONES', 3, 3, 'GDA');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (7, 'D0007', 'GERENCIA DE TECNOLOGÍA', 3, 3, 'GT');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (8, 'D0008', 'GERENCIA DE OPERACIONES', 3, 3, 'GO');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (9, 'D0009', 'GERENCIA DE DESARROLLO SOCIAL', 3, 3, 'GDS');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (10, 'D0010', 'GERENCIA DE CAPACITACIONES', 3, 3, 'GCA');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (11, 'D0011', 'GERENCIA DE PROYECTO', 3, 3, 'GP');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (12, 'D0012', 'GERENCIA DE PLANIFICACIÓN, PRESUPUESTO Y CONTROL DE GESTIÓN', 3, 3, 'GPPCG');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (13, 'D0013', 'GERENCIA DE COMUNICACIONES E INFORMACIÓN ', 3, 3, 'GCI');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (14, 'D0014', 'OFICINA DE ATENCIÓN AL CIUDADANO ', 3, 3, 'OAC');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (15, 'D0015', 'GERENCIA DE INFRAESTRUCTURA ', 3, 3, 'GIN');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (4, 'D0004', 'GERENCIA DE RECURSOS HUMANOS', 3, 3, 'RRHH');
INSERT INTO configuraciones_departamento (id, cod_departamento, nom_departamento, user_create_id, user_update_id, siglas) VALUES (31, 'D0016', 'PRESIDENCIA', 3, 3, 'PR');


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 180
-- Name: configuraciones_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('configuraciones_departamento_id_seq', 32, true);


--
-- TOC entry 2084 (class 0 OID 1430525)
-- Dependencies: 181
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2015-10-08 15:26:58.623131-04:30', '1', 'gerente', 1, '', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2015-10-08 15:27:27.711366-04:30', '2', 'administrador', 1, '', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2015-10-08 15:27:35.641519-04:30', '3', 'usuario', 1, '', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2015-10-08 15:28:07.109448-04:30', '2', 'gerente', 1, '', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2015-10-08 15:28:28.866121-04:30', '2', 'gerente', 2, 'Modifica groups.', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2015-10-08 15:28:43.295553-04:30', '1', 'actividad', 2, 'Modifica groups.', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2015-10-08 15:29:40.046517-04:30', '2', 'gerente', 2, 'No ha modificado ningún campo.', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2015-10-13 11:09:17.825382-04:30', '3', 'administrador', 1, '', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2015-10-13 11:09:46.238879-04:30', '3', 'administrador', 2, 'Modifica groups.', 4, 1);


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 182
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 9, true);


--
-- TOC entry 2086 (class 0 OID 1430534)
-- Dependencies: 183
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_content_type (id, name, app_label, model) VALUES (1, 'log entry', 'admin', 'logentry');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (2, 'permission', 'auth', 'permission');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (3, 'group', 'auth', 'group');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (4, 'user', 'auth', 'user');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (5, 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (6, 'session', 'sessions', 'session');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (7, 'registros', 'actividad', 'registros');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (8, 'perfiles usuario', 'login', 'perfilesusuario');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (9, 'actividad', 'administrador', 'actividad');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (10, 'departamento', 'configuraciones', 'departamento');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (11, 'asignar', 'asignar', 'asignar');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (12, 'asignadas', 'observaciones', 'asignadas');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (13, 'usuario depart', 'usuario_depart', 'usuariodepart');


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 184
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- TOC entry 2088 (class 0 OID 1430539)
-- Dependencies: 185
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2015-10-08 10:22:21.991502-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2015-10-08 10:22:22.832518-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2015-10-08 10:22:23.117669-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'sessions', '0001_initial', '2015-10-08 10:22:23.250126-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'login', '0001_initial', '2015-10-08 15:06:42.733959-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (45, 'configuraciones', '0001_initial', '2015-10-23 13:09:29.47419-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (46, 'administrador', '0001_initial', '2015-10-23 13:09:42.243738-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (49, 'asignar', '0001_initial', '2015-10-23 13:09:43.320312-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (51, 'usuario_depart', '0001_initial', '2015-10-24 10:54:42.656926-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (52, 'usuario_depart', '0002_auto_20151024_1142', '2015-10-24 11:42:57.531581-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (54, 'asignar', '0002_asignar_fecha_p', '2015-11-17 13:17:35.328568-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (55, 'asignar', '0003_asignar_des_actividad', '2015-11-17 13:17:35.403548-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (56, 'configuraciones', '0002_departamento_siglas', '2015-11-17 13:59:17.680709-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (57, 'actividad', '0001_initial', '2015-11-18 10:51:40.714739-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (58, 'asignar', '0004_auto_20151119_1421', '2015-11-19 14:21:16.353394-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (59, 'administrador', '0002_actividad_fecha_o', '2015-12-16 13:48:59.04709-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (60, 'actividad', '0002_registros_fecha_o', '2015-12-16 14:25:11.823638-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (61, 'asignar', '0005_auto_20151217_1333', '2015-12-17 13:33:22.600832-04:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (62, 'administrador', '0003_actividad_fecha_f', '2016-01-08 09:27:16.279113-04:30');


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 62, true);


--
-- TOC entry 2090 (class 0 OID 1430547)
-- Dependencies: 187
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('86p9nqus6zyb3x4y43k6kkpec6oqwmnk', 'NGI2YzM2N2MwZmZkYWU1NTEzMDBhYzVmZjgwYWVkZWZmNWYyZTQ0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OTUyNzg2MGY3ODgxODUxZTNmMTE3YmY3NmRhNTU1Y2NmNWZjNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==', '2015-11-10 12:08:35.339302-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('44as89h18x0v5t724ytxjj6ws73deh6s', 'YjFhNTk1Yjg3ZmRiMWYzNGYxMjUxNDdlZDA3Y2U1MTcyYWFhNjk5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0YmEzZTdmY2I5ODFkZGFmYzQ3OWY0YzljZWYyMmI5YTk3MTcwYTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-10-22 11:38:01.835094-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ibkjvggpie1xc4vvys3tnkyr0r8rcb3j', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-29 14:41:01.396665-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('u2kd1nujaxzktr7wic963xgq59ea7ff3', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-30 10:23:46.186885-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('417hiqirwu5cdfv9rcz9msds7sq9icsn', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2015-10-23 08:45:45.84762-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('s2d6oi9z6hajskwcntb8ur9s0zavstjg', 'YjFhNTk1Yjg3ZmRiMWYzNGYxMjUxNDdlZDA3Y2U1MTcyYWFhNjk5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0YmEzZTdmY2I5ODFkZGFmYzQ3OWY0YzljZWYyMmI5YTk3MTcwYTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-10-23 08:46:26.705392-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ccig5o29n2k1bp2ixlkynxnbgaxw3ww0', 'YjFhNTk1Yjg3ZmRiMWYzNGYxMjUxNDdlZDA3Y2U1MTcyYWFhNjk5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0YmEzZTdmY2I5ODFkZGFmYzQ3OWY0YzljZWYyMmI5YTk3MTcwYTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-10-23 09:11:38.919606-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('lko8yaz0sccttr0nyqngn8ib1yi9i2h6', 'YTQzYzU0MmExNzI5MzIwMDE5ZmRkN2YwYzczNWY3NjhhMzMwZTJjYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5ZTU1MjY4ZDcwNjRkZmQ0YTk3OGRhNWUxZTYwNWY2MzY2ODI5MTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9', '2015-10-23 10:21:38.505737-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('3daem7gkwmicwrj5wko9vc7o0q8n7mwi', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-02 07:54:44.386542-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('fgj8iise1hvkoukz420j8loev4d35s5j', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-02 09:51:32.043506-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('17o6p2g21axzf0jj8fxwk5bezbsmdc0i', 'YTQzYzU0MmExNzI5MzIwMDE5ZmRkN2YwYzczNWY3NjhhMzMwZTJjYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5ZTU1MjY4ZDcwNjRkZmQ0YTk3OGRhNWUxZTYwNWY2MzY2ODI5MTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9', '2015-10-27 08:06:52.560942-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('a7aqbpbyg84aex5dvrckl2w44u9hboyx', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-02 11:35:49.889616-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('msevv58h95ajkqnmpucnmsd09l7ox2c5', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2015-11-07 10:57:04.758205-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('08ucz4gvpit287gtokf2omuxq7xg75er', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-02 13:55:55.771002-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('mhvaraj9feb3jpxhm6p196dgrg7xc80y', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-27 11:10:23.831677-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('pxpsy4zp7fifej1bdau99inuqbm2b1c8', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-27 13:34:02.28164-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ym5oxj3fo7l4w7mojmv7wnu516bm292a', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-28 08:22:31.158869-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5yfd15o2htmcglujouoeex9xg5te1x1k', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-28 10:55:30.341061-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('pssn0x9jyi7y3eem7veb4uda4gk1j06x', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2015-10-28 11:34:21.88748-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('hiyweoa63f2swfsvuvgzn0um7gteqrvq', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-06 12:22:44.116531-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('umhily42iwrwnh5o4yrgw0267cxo2tir', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-28 11:35:26.999406-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('7nbk6i45hd40mair16nqua00hocfmcqb', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-06 12:28:42.162127-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('js8vfmtwpsusncay61u3545ucep41uu8', 'ZWZiYTVkZTA3MzJmMzY2YWY3MmJlY2IzMjdiZTNiMzUzZjQxNTY5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjdjZDMwYmE3MDZmMWE2NWJmZTQwMDI4N2Y5YTUyZDFjMjU0ZTJjYjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-09 15:24:42.038777-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('nqw6kr99g848lhj2qgkqk40b6tsf0s89', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-29 08:55:28.22917-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('bkl3vrwt8080v89fkgcnjn5ss4ooeesm', 'ZGFlNzg0YzdjNDc5OGIyMzQ0ZGI3YzhiNjI0YWFjODViYmM1MDU2MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjhjYTJjNGVkZTU0M2ZhOWFiMjZkNDc1YzcxOWViNmY3MTYzZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-10-29 10:31:59.521797-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('jadgursrat8dknopbipoqfbk5fu4mizy', 'NmQzMGExMGUyN2VlZTMyOTZhOTA1OTFhMWI0YzU5OTFlMGU4NGJhZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImFlODllNzNmNGYxYmQwNjI0NmJjYzQyMWNlMzZmY2EwZGQ2ZDg1YWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9', '2015-11-05 14:36:00.620325-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('wcdkbxmc8a66u3t9hl2caemdr6izwvmc', 'ZWZiYTVkZTA3MzJmMzY2YWY3MmJlY2IzMjdiZTNiMzUzZjQxNTY5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjdjZDMwYmE3MDZmMWE2NWJmZTQwMDI4N2Y5YTUyZDFjMjU0ZTJjYjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-10 14:38:03.650457-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('0ml8yfedf1swkqqfmmtwhcaygpjzwh6v', 'ZWZiYTVkZTA3MzJmMzY2YWY3MmJlY2IzMjdiZTNiMzUzZjQxNTY5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjdjZDMwYmE3MDZmMWE2NWJmZTQwMDI4N2Y5YTUyZDFjMjU0ZTJjYjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-11-10 17:00:09.673591-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ckxv575swg4vleumt7uf2j4me4rwrk5q', 'NGI2YzM2N2MwZmZkYWU1NTEzMDBhYzVmZjgwYWVkZWZmNWYyZTQ0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OTUyNzg2MGY3ODgxODUxZTNmMTE3YmY3NmRhNTU1Y2NmNWZjNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==', '2015-11-09 18:40:38.942468-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('mbezd8t5rojkqrhxiv2iz8urd1pxvir9', 'NGI2YzM2N2MwZmZkYWU1NTEzMDBhYzVmZjgwYWVkZWZmNWYyZTQ0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OTUyNzg2MGY3ODgxODUxZTNmMTE3YmY3NmRhNTU1Y2NmNWZjNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==', '2015-11-10 17:06:59.282021-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('fxj3062296clz07kotscl4121b365le0', 'NGI2YzM2N2MwZmZkYWU1NTEzMDBhYzVmZjgwYWVkZWZmNWYyZTQ0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OTUyNzg2MGY3ODgxODUxZTNmMTE3YmY3NmRhNTU1Y2NmNWZjNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==', '2015-11-10 08:49:10.72057-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('b7aqeznqwleej2dt7ot3b6sur07vl7p7', 'YTQ3YzRlNDBkYTc3OTc4ZTJjOTY1ZWVlNTMzNzQ4NTYwYjFmN2NmZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyZmE0YmM4YzdjNzg0NzQ0NzM3NjdmMzAyYTg0OTA1NzBiM2UyNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-01 13:09:56.238425-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('rjrnpzzrc661jradg67lukdy7xomu1eh', 'MTBiZDNiN2NlZDVmOTExNDQxOGQ5MmUxM2Y5MTcxNjRkYzZjMDA3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4NjE2YTZjMzAyMTliYmJiYmE5NDBkMzhhN2U4YjA2ZGVlNDUwOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2016-01-20 13:51:22.497266-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ue5uor29vb9kydgpdd8kgot06sozn0dn', 'YTQ3YzRlNDBkYTc3OTc4ZTJjOTY1ZWVlNTMzNzQ4NTYwYjFmN2NmZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyZmE0YmM4YzdjNzg0NzQ0NzM3NjdmMzAyYTg0OTA1NzBiM2UyNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-10 14:40:25.303422-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('acaw0dfgrfkk8v50je9m0loneu9jfk45', 'MTBiZDNiN2NlZDVmOTExNDQxOGQ5MmUxM2Y5MTcxNjRkYzZjMDA3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4NjE2YTZjMzAyMTliYmJiYmE5NDBkMzhhN2U4YjA2ZGVlNDUwOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2016-01-20 13:54:03.342956-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('p8b310bop61r96t2xjh3kysquin1dpx8', 'MTBiZDNiN2NlZDVmOTExNDQxOGQ5MmUxM2Y5MTcxNjRkYzZjMDA3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4NjE2YTZjMzAyMTliYmJiYmE5NDBkMzhhN2U4YjA2ZGVlNDUwOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-30 14:13:55.224004-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('bf5mimvd0minuqf66sthbe2wbujh217e', 'YTQ3YzRlNDBkYTc3OTc4ZTJjOTY1ZWVlNTMzNzQ4NTYwYjFmN2NmZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyZmE0YmM4YzdjNzg0NzQ0NzM3NjdmMzAyYTg0OTA1NzBiM2UyNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-23 13:28:12.922564-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('2dhy6fpvvkmdzc3kx3wzu5xi322sqiw8', 'MTBiZDNiN2NlZDVmOTExNDQxOGQ5MmUxM2Y5MTcxNjRkYzZjMDA3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4NjE2YTZjMzAyMTliYmJiYmE5NDBkMzhhN2U4YjA2ZGVlNDUwOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2016-01-04 11:05:55.498473-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('n4e2lt6xnrw6woytcj6s4k4baii96awz', 'YTQ3YzRlNDBkYTc3OTc4ZTJjOTY1ZWVlNTMzNzQ4NTYwYjFmN2NmZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyZmE0YmM4YzdjNzg0NzQ0NzM3NjdmMzAyYTg0OTA1NzBiM2UyNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-09 11:14:23.952158-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ub29buvuspji6ngi6l0xpsdzcbrbp13x', 'YTQ3YzRlNDBkYTc3OTc4ZTJjOTY1ZWVlNTMzNzQ4NTYwYjFmN2NmZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyZmE0YmM4YzdjNzg0NzQ0NzM3NjdmMzAyYTg0OTA1NzBiM2UyNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-09 11:16:09.416064-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('14dmrbiz8sfo491dzfc37l95npxtfdgy', 'YTQ3YzRlNDBkYTc3OTc4ZTJjOTY1ZWVlNTMzNzQ4NTYwYjFmN2NmZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyZmE0YmM4YzdjNzg0NzQ0NzM3NjdmMzAyYTg0OTA1NzBiM2UyNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-09 11:21:18.191406-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('cf74mgtc65bzh3vry7ckk2s4qsvs77d3', 'YTQ3YzRlNDBkYTc3OTc4ZTJjOTY1ZWVlNTMzNzQ4NTYwYjFmN2NmZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyZmE0YmM4YzdjNzg0NzQ0NzM3NjdmMzAyYTg0OTA1NzBiM2UyNWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-28 11:13:00.562618-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('bio1tuvha992pcondxwkz1ndigpvlk0n', 'ZTRlMmJkM2VlMjQ5MWIyOTEzYWYxYTAwMjA3MWFhMjg1YmZmMjM0Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQxM2RlNGUyNzdmNDZlN2E5Mzg2NzczNzAwMDM4MTMzODQ2NjBjOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE0fQ==', '2015-12-29 13:50:24.771541-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('iqvble4ik129zxadt9n716snvyan21lz', 'MTBiZDNiN2NlZDVmOTExNDQxOGQ5MmUxM2Y5MTcxNjRkYzZjMDA3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4NjE2YTZjMzAyMTliYmJiYmE5NDBkMzhhN2U4YjA2ZGVlNDUwOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2016-01-25 11:17:03.993062-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5argqunc81g3xz4p84hvmkf9cmi6qikc', 'NGFmODkxNmQ0MWNiN2U4ODZhOWE1ZDcwOTg3ZTgyOGZiMjRjMTljMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwM2E0ZjBlZjM3MzJjYTE3YmE2ZmVlOTczMjdhNzg0ZTQ2YTg2NDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-30 09:44:05.569371-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('yyep673td4wrt5d08qpgwlrp3heuccdn', 'NGFmODkxNmQ0MWNiN2U4ODZhOWE1ZDcwOTg3ZTgyOGZiMjRjMTljMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwM2E0ZjBlZjM3MzJjYTE3YmE2ZmVlOTczMjdhNzg0ZTQ2YTg2NDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2015-12-30 10:15:59.585931-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('dg5gshgw2fkv1p4hb5uispp95l6hp6o8', 'Mjk4MmRkZTA4MDU5M2E5MTdmY2FhNzUzZjIzOTFjNmYyNTNmZDkyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImRlMGU3ZWM2MjAwOTM4MmVhMGRmNTM2YmM1ZjBhMGEzNGI2ZGM0ZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9', '2016-01-01 10:18:42.851286-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('tros7qfpf9d0fjz6qqjwu0oj19y7vfp8', 'Mjk4MmRkZTA4MDU5M2E5MTdmY2FhNzUzZjIzOTFjNmYyNTNmZDkyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImRlMGU3ZWM2MjAwOTM4MmVhMGRmNTM2YmM1ZjBhMGEzNGI2ZGM0ZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9', '2016-01-18 09:08:36.899977-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('iweerm5bk60xodhmuidrybbp3dgde6uq', 'YzQxMWQyYzgzYzBhZjQ3NzAzYWYyOGEyMzFkMDQ5ODFhMTU3MmViNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdhNDFhZjg0YWE1NmMxZDRlMjNhNzhkNWJhNzY1ZTMxOGQ4OGY2MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==', '2016-01-01 13:39:34.923975-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('4kxcr8begdwngi9pdrtqkt8fwv0jtmw3', 'YzQxMWQyYzgzYzBhZjQ3NzAzYWYyOGEyMzFkMDQ5ODFhMTU3MmViNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdhNDFhZjg0YWE1NmMxZDRlMjNhNzhkNWJhNzY1ZTMxOGQ4OGY2MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==', '2016-01-01 13:44:36.96645-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('fovsppqam6jy3b44c2c3t1abegb24ftg', 'MTBiZDNiN2NlZDVmOTExNDQxOGQ5MmUxM2Y5MTcxNjRkYzZjMDA3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4NjE2YTZjMzAyMTliYmJiYmE5NDBkMzhhN2U4YjA2ZGVlNDUwOGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2016-01-25 12:00:03.778483-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('l21c3f0zo8a7ixlwk2kgzcv24dg41zu2', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-01-26 09:45:18.713457-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('744ssc485apv34u4gwlmtfk6pw6dmocx', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-01-26 10:30:18.837225-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('q4piwurflnsf2lop0cdyp3wkufqqjooo', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-01-26 10:38:20.114998-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('tq9payxoch3n8zs9avaorqticf5ryhi5', 'ZGMzNjcxNGE2ZTI3ZWQyYzM1YjBjMDUyMjYwYjE4NGEwOTdiMjNhZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE2OGZlMzZhODJhZGQ2MjY1MTg0YTAyNTg2MGM5ZDRjYmU3NTg4MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2016-01-26 11:13:30.782993-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('b6imchr4ebqf04cgtr6tv3qndnv8gllc', 'NWM4N2M1ZDc3MGQ0ZWM1YWJhODYwN2I0MTdkYWFlNDM4OWVlMzQ3Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNkYWViNTNlNTA3ZTQxZmVhNTU2NTBkZDU2ZTZlY2UxNzg5NzBmN2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjIwfQ==', '2016-01-26 11:37:39.318542-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('rb8823llqoy0f653g9dky9rw6bp6rneg', 'ZGMzNjcxNGE2ZTI3ZWQyYzM1YjBjMDUyMjYwYjE4NGEwOTdiMjNhZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE2OGZlMzZhODJhZGQ2MjY1MTg0YTAyNTg2MGM5ZDRjYmU3NTg4MDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2016-01-26 12:01:31.151491-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('l7365djigqlnrgcwigxuq9fz3iu0vum1', 'NGVkODU2NWFhZTQxMzc5ZDY5YzNlOGVmZjI5NjcyYjZmYWQ1MDg0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQxOGJhY2IzY2RlNzRlMzM1YzhlZWE2YzJmYjc0ZjlhZDBhNzUwOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE1fQ==', '2016-01-26 16:07:06.060973-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('4ox8gegl9tmp9u2r1uix4udkjrgrz3ax', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-01-27 21:06:24.747325-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('w6dot2c9mj1gdg4pwaf947dr38b60yf8', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-01-28 09:10:42.673107-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('qmthy058dkay2831q2jmbmvzmogenouz', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-01-28 09:55:33.129304-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('qj1uyge4zdy29o4f5keculvh3uzcqxgo', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-01-29 14:08:18.455183-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('2e7ku2fzum6qxo28izvror4yyx9pgl73', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-02-01 08:30:04.245049-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('qgnv1igmhio08r6z4eqlhlx83l2xvt85', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-02-02 17:28:01.610119-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('a90nmjofh4bsxhwrhaeeiaykk7ctcr8f', 'MzkxOGEyOGViMGEzYWMxMjk3YTc0MjY4MjVhMzk4YmMwMTUwYjYzYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyZjk2OGVkYzg4NjQ4ZDIzZDA2ZjBkMjdhZmYzNWQ3ZTU3OGFkNTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9', '2016-02-04 19:02:57.696194-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('9sm4mvfldovyxwtruikxgey9gb12s90n', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-02-09 09:52:27.262221-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ulk74rip0k5luyysquf1goseq7rzh6bb', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-02-11 15:03:49.382891-04:30');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('0bmemg4zevq54al7g9j1k0zgt98f06iy', 'MzIxY2FkYWZhYTJkOTEyMDM4YzYzZGUwNmQ3NjhmOTVkNWIwMDIzZTp7fQ==', '2016-02-21 15:47:19.982397-04:30');


--
-- TOC entry 2091 (class 0 OID 1430553)
-- Dependencies: 188
-- Data for Name: login_perfilesusuario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 189
-- Name: login_perfilesusuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('login_perfilesusuario_id_seq', 1, false);


--
-- TOC entry 2093 (class 0 OID 1430558)
-- Dependencies: 190
-- Data for Name: usuario_depart_usuariodepart; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (4, 1, 6, 14);
INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (1, 1, 4, 4);
INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (5, 1, 1, 15);
INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (6, 2, 31, 3);
INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (7, 1, 12, 17);
INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (8, 1, 8, 18);
INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (9, 1, 9, 19);
INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (10, 1, 4, 20);
INSERT INTO usuario_depart_usuariodepart (id, grupo_usuario, departamento_id, usuario_id) VALUES (12, 3, 6, 22);


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 191
-- Name: usuario_depart_usuariodepart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('usuario_depart_usuariodepart_id_seq', 12, true);


--
-- TOC entry 1868 (class 2606 OID 1430579)
-- Name: actividad_registros_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actividad_registros
    ADD CONSTRAINT actividad_registros_pkey PRIMARY KEY (id);


--
-- TOC entry 1873 (class 2606 OID 1430581)
-- Name: administrador_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY administrador_actividad
    ADD CONSTRAINT administrador_actividad_pkey PRIMARY KEY (id);


--
-- TOC entry 1880 (class 2606 OID 1430583)
-- Name: asignar_asignar_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY asignar_asignar
    ADD CONSTRAINT asignar_asignar_pkey PRIMARY KEY (id);


--
-- TOC entry 1882 (class 2606 OID 1430585)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 1888 (class 2606 OID 1430587)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 1890 (class 2606 OID 1430589)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1884 (class 2606 OID 1430591)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 1893 (class 2606 OID 1430593)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 1895 (class 2606 OID 1430595)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 1903 (class 2606 OID 1430597)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 1905 (class 2606 OID 1430599)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 1897 (class 2606 OID 1430601)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1909 (class 2606 OID 1430603)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1911 (class 2606 OID 1430605)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 1899 (class 2606 OID 1430607)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 1915 (class 2606 OID 1430609)
-- Name: configuraciones_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY configuraciones_departamento
    ADD CONSTRAINT configuraciones_departamento_pkey PRIMARY KEY (id);


--
-- TOC entry 1919 (class 2606 OID 1430611)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 1921 (class 2606 OID 1430613)
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- TOC entry 1923 (class 2606 OID 1430615)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1925 (class 2606 OID 1430617)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 1928 (class 2606 OID 1430619)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 1930 (class 2606 OID 1430621)
-- Name: login_perfilesusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY login_perfilesusuario
    ADD CONSTRAINT login_perfilesusuario_pkey PRIMARY KEY (id);


--
-- TOC entry 1932 (class 2606 OID 1430623)
-- Name: login_perfilesusuario_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY login_perfilesusuario
    ADD CONSTRAINT login_perfilesusuario_user_id_key UNIQUE (user_id);


--
-- TOC entry 1934 (class 2606 OID 1430625)
-- Name: usuario_depart_usuariodepart_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuario_depart_usuariodepart
    ADD CONSTRAINT usuario_depart_usuariodepart_pkey PRIMARY KEY (id);


--
-- TOC entry 1936 (class 2606 OID 1430627)
-- Name: usuario_depart_usuariodepart_usuario_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuario_depart_usuariodepart
    ADD CONSTRAINT usuario_depart_usuariodepart_usuario_id_key UNIQUE (usuario_id);


--
-- TOC entry 1863 (class 1259 OID 1430628)
-- Name: actividad_registros_21f9472f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX actividad_registros_21f9472f ON actividad_registros USING btree (user_create_id);


--
-- TOC entry 1864 (class 1259 OID 1430629)
-- Name: actividad_registros_8c874724; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX actividad_registros_8c874724 ON actividad_registros USING btree (user_update_id);


--
-- TOC entry 1865 (class 1259 OID 1430630)
-- Name: actividad_registros_cf4266a3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX actividad_registros_cf4266a3 ON actividad_registros USING btree (cod_actividad_id);


--
-- TOC entry 1866 (class 1259 OID 1430631)
-- Name: actividad_registros_fca997d5; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX actividad_registros_fca997d5 ON actividad_registros USING btree (cod_departamento_id);


--
-- TOC entry 1869 (class 1259 OID 1430632)
-- Name: administrador_actividad_21f9472f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX administrador_actividad_21f9472f ON administrador_actividad USING btree (user_create_id);


--
-- TOC entry 1870 (class 1259 OID 1430633)
-- Name: administrador_actividad_8c874724; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX administrador_actividad_8c874724 ON administrador_actividad USING btree (user_update_id);


--
-- TOC entry 1871 (class 1259 OID 1430634)
-- Name: administrador_actividad_f5acfb16; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX administrador_actividad_f5acfb16 ON administrador_actividad USING btree (departamento_id);


--
-- TOC entry 1874 (class 1259 OID 1430635)
-- Name: asignar_asignar_1b9a3e8f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX asignar_asignar_1b9a3e8f ON asignar_asignar USING btree ("codigoDepartamento_id");


--
-- TOC entry 1875 (class 1259 OID 1430636)
-- Name: asignar_asignar_21f9472f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX asignar_asignar_21f9472f ON asignar_asignar USING btree (user_create_id);


--
-- TOC entry 1876 (class 1259 OID 1430637)
-- Name: asignar_asignar_436d5fe8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX asignar_asignar_436d5fe8 ON asignar_asignar USING btree ("codigoDepartamentoA_id");


--
-- TOC entry 1877 (class 1259 OID 1430638)
-- Name: asignar_asignar_8c874724; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX asignar_asignar_8c874724 ON asignar_asignar USING btree (user_update_id);


--
-- TOC entry 1878 (class 1259 OID 1430639)
-- Name: asignar_asignar_cf4266a3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX asignar_asignar_cf4266a3 ON asignar_asignar USING btree (cod_actividad_id);


--
-- TOC entry 1885 (class 1259 OID 1430640)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 1886 (class 1259 OID 1430641)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 1891 (class 1259 OID 1430642)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 1900 (class 1259 OID 1430643)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 1901 (class 1259 OID 1430644)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 1906 (class 1259 OID 1430645)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 1907 (class 1259 OID 1430646)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 1912 (class 1259 OID 1430647)
-- Name: configuraciones_departamento_21f9472f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX configuraciones_departamento_21f9472f ON configuraciones_departamento USING btree (user_create_id);


--
-- TOC entry 1913 (class 1259 OID 1430648)
-- Name: configuraciones_departamento_8c874724; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX configuraciones_departamento_8c874724 ON configuraciones_departamento USING btree (user_update_id);


--
-- TOC entry 1916 (class 1259 OID 1430649)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 1917 (class 1259 OID 1430650)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 1926 (class 1259 OID 1430651)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 1937 (class 2606 OID 1430652)
-- Name: D5a81e9a869d35150cc83bf0aa293845; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_registros
    ADD CONSTRAINT "D5a81e9a869d35150cc83bf0aa293845" FOREIGN KEY (cod_actividad_id) REFERENCES administrador_actividad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1938 (class 2606 OID 1430657)
-- Name: D66739b5395bca2c286f69c60fab211d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_registros
    ADD CONSTRAINT "D66739b5395bca2c286f69c60fab211d" FOREIGN KEY (cod_departamento_id) REFERENCES configuraciones_departamento(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1944 (class 2606 OID 1430662)
-- Name: a05fedae61aa5d63b4f60805c35fc9a9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignar_asignar
    ADD CONSTRAINT a05fedae61aa5d63b4f60805c35fc9a9 FOREIGN KEY (cod_actividad_id) REFERENCES administrador_actividad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1939 (class 2606 OID 1430667)
-- Name: actividad_regis_user_create_id_5f8c0701682d3e28_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_registros
    ADD CONSTRAINT actividad_regis_user_create_id_5f8c0701682d3e28_fk_auth_user_id FOREIGN KEY (user_create_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1940 (class 2606 OID 1430672)
-- Name: actividad_regis_user_update_id_100cc5d6de943a73_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_registros
    ADD CONSTRAINT actividad_regis_user_update_id_100cc5d6de943a73_fk_auth_user_id FOREIGN KEY (user_update_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1941 (class 2606 OID 1430677)
-- Name: administrador_a_user_create_id_4e85a493853038df_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY administrador_actividad
    ADD CONSTRAINT administrador_a_user_create_id_4e85a493853038df_fk_auth_user_id FOREIGN KEY (user_create_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1942 (class 2606 OID 1430682)
-- Name: administrador_a_user_update_id_1217100e7f21b17a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY administrador_actividad
    ADD CONSTRAINT administrador_a_user_update_id_1217100e7f21b17a_fk_auth_user_id FOREIGN KEY (user_update_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1945 (class 2606 OID 1430687)
-- Name: asignar_asignar_user_create_id_51b80efc2e632183_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignar_asignar
    ADD CONSTRAINT asignar_asignar_user_create_id_51b80efc2e632183_fk_auth_user_id FOREIGN KEY (user_create_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1946 (class 2606 OID 1430692)
-- Name: asignar_asignar_user_update_id_5e12bf02cbc92678_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignar_asignar
    ADD CONSTRAINT asignar_asignar_user_update_id_5e12bf02cbc92678_fk_auth_user_id FOREIGN KEY (user_update_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1951 (class 2606 OID 1430697)
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1949 (class 2606 OID 1430702)
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1950 (class 2606 OID 1430707)
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1954 (class 2606 OID 1430712)
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1952 (class 2606 OID 1430717)
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1953 (class 2606 OID 1430722)
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1955 (class 2606 OID 1430727)
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1956 (class 2606 OID 1430732)
-- Name: configuraciones__user_update_id_fe108f5b7f9177a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuraciones_departamento
    ADD CONSTRAINT configuraciones__user_update_id_fe108f5b7f9177a_fk_auth_user_id FOREIGN KEY (user_update_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1957 (class 2606 OID 1430737)
-- Name: configuraciones_user_create_id_3d0290b9aaa256bb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuraciones_departamento
    ADD CONSTRAINT configuraciones_user_create_id_3d0290b9aaa256bb_fk_auth_user_id FOREIGN KEY (user_create_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1947 (class 2606 OID 1430742)
-- Name: d1428b9178247341f0a2918202219042; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignar_asignar
    ADD CONSTRAINT d1428b9178247341f0a2918202219042 FOREIGN KEY ("codigoDepartamentoA_id") REFERENCES configuraciones_departamento(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1961 (class 2606 OID 1430747)
-- Name: d30dfa24046fed1ef982f3e9fa7d3621; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario_depart_usuariodepart
    ADD CONSTRAINT d30dfa24046fed1ef982f3e9fa7d3621 FOREIGN KEY (departamento_id) REFERENCES configuraciones_departamento(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1943 (class 2606 OID 1430752)
-- Name: d31ad4f22829afc8d7fd05b2fa5689be; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY administrador_actividad
    ADD CONSTRAINT d31ad4f22829afc8d7fd05b2fa5689be FOREIGN KEY (departamento_id) REFERENCES configuraciones_departamento(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1948 (class 2606 OID 1430757)
-- Name: d44bc5710dbf645f8a17de2e18d2746d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignar_asignar
    ADD CONSTRAINT d44bc5710dbf645f8a17de2e18d2746d FOREIGN KEY ("codigoDepartamento_id") REFERENCES configuraciones_departamento(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1958 (class 2606 OID 1430762)
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1959 (class 2606 OID 1430767)
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1960 (class 2606 OID 1430772)
-- Name: login_perfilesusuario_user_id_68b0ace2f71d1bee_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY login_perfilesusuario
    ADD CONSTRAINT login_perfilesusuario_user_id_68b0ace2f71d1bee_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 1962 (class 2606 OID 1430777)
-- Name: usuario_depart_usua_usuario_id_7ff4ce15e8a6d519_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario_depart_usuariodepart
    ADD CONSTRAINT usuario_depart_usua_usuario_id_7ff4ce15e8a6d519_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2016-02-11 08:47:05 VET

--
-- PostgreSQL database dump complete
--

