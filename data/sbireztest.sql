--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


--
-- Name: areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE areas (
    id integer NOT NULL,
    area text NOT NULL
);


--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- Name: connections; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE connections (
    id integer NOT NULL,
    user_id integer NOT NULL,
    provider_id character varying(255),
    provider_user_id character varying(255),
    access_token character varying(255),
    secret character varying(255),
    display_name character varying(255),
    full_name character varying(255),
    profile_url character varying(512),
    image_url character varying(512),
    rank integer
);


--
-- Name: connections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE connections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE connections_id_seq OWNED BY connections.id;


--
-- Name: contents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contents (
    id integer NOT NULL,
    version integer,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    change_log text,
    content bytea,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    document_id integer
);


--
-- Name: contents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contents_id_seq OWNED BY contents.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documents (
    id integer NOT NULL,
    name character varying(255),
    description text,
    filepath character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    organization_id integer
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: documentskeywords; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documentskeywords (
    document_id integer,
    keyword_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: documentsproposals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documentsproposals (
    document_id integer,
    proposal_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: keywords; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE keywords (
    id integer NOT NULL,
    keyword character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE keywords_id_seq OWNED BY keywords.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    duns character varying(255),
    ein character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: organizationsusers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizationsusers (
    organization_id integer,
    user_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: participatingcomponents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE participatingcomponents (
    id integer NOT NULL,
    participatingcomponent text NOT NULL
);


--
-- Name: participatingcomponents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE participatingcomponents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: participatingcomponents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE participatingcomponents_id_seq OWNED BY participatingcomponents.id;


--
-- Name: participatingcomponentstopics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE participatingcomponentstopics (
    topic_id integer,
    participatingcomponent_id integer
);


--
-- Name: phases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE phases (
    id integer NOT NULL,
    phase text NOT NULL,
    topic_id integer NOT NULL
);


--
-- Name: phases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE phases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE phases_id_seq OWNED BY phases.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programs (
    id integer NOT NULL,
    program text
);


--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programs_id_seq OWNED BY programs.id;


--
-- Name: proposals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE proposals (
    id integer NOT NULL,
    name character varying(255),
    description text,
    sbir_topic_reference character varying(255),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    organization_id integer
);


--
-- Name: proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proposals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proposals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE proposals_id_seq OWNED BY proposals.id;


--
-- Name: references; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "references" (
    id integer NOT NULL,
    reference text NOT NULL,
    topic_id integer NOT NULL
);


--
-- Name: references_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: references_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE references_id_seq OWNED BY "references".id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(80),
    description character varying(255)
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles_users (
    user_id integer,
    role_id integer
);


--
-- Name: topics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE topics (
    id integer NOT NULL,
    topic_number text NOT NULL,
    solicitation_id text NOT NULL,
    url text NOT NULL,
    title text NOT NULL,
    program_id integer,
    description text NOT NULL,
    objective text NOT NULL,
    pre_release_date timestamp without time zone NOT NULL,
    proposals_begin_date timestamp without time zone NOT NULL,
    proposals_end_date timestamp without time zone NOT NULL,
    full_text tsvector,
    agency text
);


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE topics_id_seq OWNED BY topics.id;


--
-- Name: topicsareas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE topicsareas (
    topic_id integer,
    area_id integer
);


--
-- Name: topicskeywords; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE topicskeywords (
    topic_id integer,
    keyword_id integer
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(128) NOT NULL,
    password character varying(120),
    active boolean,
    secret character varying(64),
    confirmed_at timestamp without time zone,
    last_login_at timestamp without time zone,
    current_login_at timestamp without time zone,
    last_login_ip character varying(100),
    current_login_ip character varying(100),
    login_count integer,
    name character varying(255),
    title character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: workflows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE workflows (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    proposal_id integer
);


--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE workflows_id_seq OWNED BY workflows.id;


--
-- Name: workflowstepresults; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE workflowstepresults (
    id integer NOT NULL,
    result text,
    completed_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    workflowstep_id integer
);


--
-- Name: workflowstepresults_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE workflowstepresults_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflowstepresults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE workflowstepresults_id_seq OWNED BY workflowstepresults.id;


--
-- Name: workflowsteps; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE workflowsteps (
    id integer NOT NULL,
    name character varying(255),
    description text,
    work text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    workflow_id integer
);


--
-- Name: workflowsteps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE workflowsteps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflowsteps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE workflowsteps_id_seq OWNED BY workflowsteps.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY connections ALTER COLUMN id SET DEFAULT nextval('connections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contents ALTER COLUMN id SET DEFAULT nextval('contents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY keywords ALTER COLUMN id SET DEFAULT nextval('keywords_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY participatingcomponents ALTER COLUMN id SET DEFAULT nextval('participatingcomponents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY phases ALTER COLUMN id SET DEFAULT nextval('phases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposals ALTER COLUMN id SET DEFAULT nextval('proposals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "references" ALTER COLUMN id SET DEFAULT nextval('references_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY workflows ALTER COLUMN id SET DEFAULT nextval('workflows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY workflowstepresults ALTER COLUMN id SET DEFAULT nextval('workflowstepresults_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY workflowsteps ALTER COLUMN id SET DEFAULT nextval('workflowsteps_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alembic_version (version_num) FROM stdin;
317fa92e432
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY areas (id, area) FROM stdin;
4	Materials/Processes
2	Weapons
7	Information Systems
1	Space Platforms
6	Human Systems
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('areas_id_seq', 1, false);


--
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY connections (id, user_id, provider_id, provider_user_id, access_token, secret, display_name, full_name, profile_url, image_url, rank) FROM stdin;
\.


--
-- Name: connections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('connections_id_seq', 1, false);


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contents (id, version, start_date, end_date, change_log, content, created_at, updated_at, document_id) FROM stdin;
\.


--
-- Name: contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contents_id_seq', 1, false);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documents (id, name, description, filepath, created_at, updated_at, organization_id) FROM stdin;
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('documents_id_seq', 1, false);


--
-- Data for Name: documentskeywords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documentskeywords (document_id, keyword_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: documentsproposals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documentsproposals (document_id, proposal_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY keywords (id, keyword, created_at, updated_at) FROM stdin;
910	oxidation modeling	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
984	wearable electronics	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
19	ultrasonic scan	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
214	optical simulator	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
404	algorithms	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
217	insufficient information	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
267	moving target defense	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
292	battlespace visualization	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
996	Link 16	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
672	covariance	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
756	high temperature testing	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
259	high temperature	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
681	behavior and life prediction	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
487	cyber analysts	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
630	NDI	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
843	nondestructive inspection	2015-02-03 11:33:20.974677-05	2015-02-03 11:33:20.974677-05
\.


--
-- Name: keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('keywords_id_seq', 1, false);


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizations (id, name, duns, ein, created_at, updated_at) FROM stdin;
\.


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('organizations_id_seq', 1, false);


--
-- Data for Name: organizationsusers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizationsusers (organization_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: participatingcomponents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY participatingcomponents (id, participatingcomponent) FROM stdin;
5	Air Force
2	ARMY
3	DARPA
1	DHP
\.


--
-- Name: participatingcomponents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('participatingcomponents_id_seq', 1, false);


--
-- Data for Name: participatingcomponentstopics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY participatingcomponentstopics (topic_id, participatingcomponent_id) FROM stdin;
90	5
76	5
67	5
90	2
114	2
90	3
173	3
7	3
69	5
51	5
76	2
76	1
14	1
67	2
75	3
187	2
\.


--
-- Data for Name: phases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY phases (id, phase, topic_id) FROM stdin;
490	PHASE I:  Identify and explore one or more approaches to capture the complexity of a CMC engine sub-component/component. Develop a conceptual model (analytical or numerical) and/or an ambient environment test to demonstrate feasibility for a relevant service environment in Phase II. Identify and prioritize the key technical challenges and show how they could be mitigated.	76
220	PHASE I:  Based upon existing data, develop two plans to design and fabricate a VPHS, one containing a high-risk approach and one containing a low-risk approach.  Estimate the power, frame latency, weight, and size of each of the processors and any peripheral devices. Clearly identify the risks and benefits associated with each approach.  Binocular and monocular VPHS applications are both of interest.	90
163	PHASE II:  Continue research and development of technology for a prototype demonstration in an Air Force Sustainment Center (AFSC) complex facility and demonstrate the commercial viability of the approach.  Develop transition plan for an enterprise wide implementation of the technology across AFSC complexes.	67
345	PHASE I:  Investigate WFOV Vis-SWIR HWIL technologies that can potentially achieve 200 nanoradian or less accuracy for high speed strapdown star tracker HWIL.  Address a wide range of day and night static and dynamic celestial objects, with backgrounds, atmospheric, and aerothermal optical distortions.  Analyze and design a Phase II prototype compatible with a demonstration in the AFRL KHILS facility.	114
237	PHASE III:  Fabricate a prototype VPHS and demonstrate threshold (objective) capability to process two 1.3Mpx 14b 60Hz (5Mpx 14b 96Hz) VNIR sensor outputs through a representative set of imaging and display algorithms to drive two 1.3Mpx 8b 60Hz (5Mpx 8b 96Hz) flat panel displays with less than 1-frame latency.	90
16	PHASE II:  Develop an enclave with this capability and test against representative enterprise networks and environments.	7
19	PHASE II:  Using the lessons learned from Phase I, design and fabricate a complete COA selection program clearly traceable to spacecraft integration; this includes development in an appropriate programming language.  Demonstrate capability with datasets provided by AFRL.	173
37	PHASE III:  Assemble a prototype miniature Link-16 communications device and conduct field tests to verify (voice/data/networking) operational performance, in a secure manner, and demonstrate functional capabilities with reduced SWaP.	69
177	PHASE I:  To solve this multifaceted problem, the initial prototype should demonstrate the ability to ingest individual sensor data, process it and infer statistics from actual sensor measurements as opposed to simply processing orbital elements.  In addition, smarter use of data mining and filtering approach, along with quantitative analysis should be used to reinforce validity of the approach chosen.	51
481	PHASE II:  Design a prototype VPHS. Perform a simulation of the proposed VPHS design that demonstrates the threshold (objective) capability to process the outputs of two 1.3Mpx 14b 60Hz (5Mpx 14b 96Hz) sensor outputs through a representative set of imaging and display algorithms to drive two synchronized 1.3Mpx 8b 60Hz (5Mpx 8b 96Hz) microdisplays with less than 1-frame latency.	90
13	PHASE I:  Design a high efficiency, radiation hard, power processing module to operate at greater than 200 degrees centigrade. The power processing module shall be scalable for use for primary bus regulation in a spacecraft power system and provide high efficiency at all load points.	14
541	PHASE II:  Apply chosen approach to a prototype sub-component/component test that captures key environmental factors. This approach should demonstrate its ability to predict the service life of the CMC sub-component/component based on coupon data with a determined confidence of prediction.	76
141	PHASE II:  This phase includes the integration of the visualizations in an operator interface and human-in-the-loop testing of the effectiveness of the visualizations compared to a baseline representation of the data with cyber operators.  Deliverables include visualization/interface software, use cases/tasks for data collection, test plans of experimental design and metrics, data, data analysis, and documentation of the results of the studies.	75
187	PHASE III:  Commercial aircraft and automotive manufacturers use OMCs.  An example transition path is to partner with an Air Force system integrator, OEM and/or JPO to mature NDTA, and demonstrate it in an operational environment (i.e., OMC production or maintenance facility) on an OMC leading edge or airfoil.	187
\.


--
-- Name: phases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('phases_id_seq', 1, false);


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programs (id, program) FROM stdin;
1	STTR
2	SBIR
\.


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programs_id_seq', 1, false);


--
-- Data for Name: proposals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY proposals (id, name, description, sbir_topic_reference, start_date, end_date, created_at, updated_at, organization_id) FROM stdin;
\.


--
-- Name: proposals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('proposals_id_seq', 1, false);


--
-- Data for Name: references; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "references" (id, reference, topic_id) FROM stdin;
\.


--
-- Name: references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('references_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY roles (id, name, description) FROM stdin;
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Data for Name: roles_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY roles_users (user_id, role_id) FROM stdin;
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY topics (id, topic_number, solicitation_id, url, title, program_id, description, objective, pre_release_date, proposals_begin_date, proposals_end_date, full_text, agency) FROM stdin;
90	AF15-AT13	DoD STTR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46482	Low-Latency Embedded Vision Processor (LLEVS)	1	High-performance, low-power, and low-latency processing is needed to perform image processing algorithms in next-generation aircraft helmet systems. New architectures and technologies are needed to respond to issues arising due to continued shrinking of semiconductor fabrication process geometries. Existing approaches have not satisfied end-user needs, such as multi-channel I/O, low-latency, large image sizes, and high frame rates. Novel architectures are needed, and alternatives promising improved power efficiencies of the processor clock tree, logic, memory, and chip I/O must be investigated. Familiarity with the important algorithms, such as distortion correction, multi-spectral/multi-modal fusion, and head-tracking, is required to ensure the solution can meet the challenging performance requirements. Consideration must also be given to the robustness of the processor, as a warfighters life may depend on its reliability in a challenging electromagnetic radiating environment. Finally, consideration must be given to a solution that can not only be applied to the digital binocular helmet-mounted display, but also to a wider set of applications that can take advantage of high-performance, low-power, low-latency image processing.  The processor requirements for the vision processor ASIC developed under the DARPA Multispectral Adaptive Networked Tactical Imaging System (MANTIS) program (2003-2010) is a good example. It was originally conceived to fuse inputs from five helmet-mounted electro-optical sensors operating in the visible-near infrared (VNIR x 2), short wave infrared (SWIR x 2), and long wave infrared (LWIR) bands and generate two synchronized SXGA video outputs at 60 Hz to a pair of microdisplays. However, it resulted in a processor that ingested three sensors (one each VNIR, SWIR, LWIR) and generated just one video output at 30 Hz due to the technical approach (e.g., architecture, microelectronic technologies) and processor geometry (90 nm) used at the time [1].  Under this program, a vision processor for helmet systems (VPHS) is required to enable the design and fabrication of a digital binocular helmet-mounted display (HMD) having all source image fusion with two video outputs. Binocular systems needed by warfighters require threshold (objective) performance comprising two synchronized video outputs, each at 60 Hz x 1.3 Mpx/frame x 8b/px = 0.624 Gbps (5Mpx x 8b x 96Hz = 3.84 Gbps), and must be capable of ingesting matching resolution video (in Mbps) from multiple sources (on-helmet or on-aircraft) comprising various mixtures of live video from sensors, synthetic imagery, and overlay symbology.  Monocular systems with similar processing requirements are also of interest. To understand the power and latency impacts of a total solution, it is necessary to both demonstrate a representative set of algorithms on the proposed processor, and to measure the system level performance, including required peripherals, such as external memory. Demonstrated success against a metric, such as GOPS/W or GFLOPS/W, is not sufficient, as it only provides a partial picture of a solution, potentially pushing off the power requirements and demanding physical capabilities to other parts of the system.	Develop architectures for an embedded processor capable of implementing the image processing algorithms required for a digital helmet-mounted display for dismounted soldiers.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'-2010':239B,748B,1257B '/multi-modal':127B,636B,1145B '0.624':399B,908B,1417B '1':339B,848B,1357B '1.3':395B,904B,1413B '2':269B,275B,778B,784B,1287B,1293B '2003':238B,747B,1256B '3.84':406B,915B,1424B '30':319B,828B,1337B '5mpx':401B,910B,1419B '60':290B,392B,799B,901B,1308B,1410B '8b':403B,912B,1421B '8b/px':398B,907B,1416B '90':333B,842B,1351B '96hz':405B,914B,1423B 'adapt':231B,740B,1249B 'advantag':205B,714B,1223B 'aircraft':44B,428B,553B,937B,1062B,1446B 'algorithm':39B,119B,473B,548B,628B,982B,1057B,1137B,1491B,1557A 'also':147B,195B,449B,656B,704B,958B,1165B,1213B,1467B 'altern':97B,606B,1115B 'appli':185B,694B,1203B 'applic':201B,710B,1219B 'approach':68B,325B,577B,834B,1086B,1343B 'architectur':48B,93B,327B,557B,602B,836B,1066B,1111B,1345B 'aris':57B,566B,1075B 'asic':225B,734B,1243B 'band':281B,790B,1299B 'battlespac':1558A 'binocular':189B,361B,376B,698B,870B,885B,1207B,1379B,1394B 'capabl':411B,524B,920B,1033B,1429B,1542B 'challeng':142B,168B,651B,677B,1160B,1186B 'channel':80B,589B,1098B 'chip':110B,619B,1128B 'clock':105B,614B,1123B 'compris':385B,429B,894B,938B,1403B,1447B 'conceiv':247B,756B,1265B 'consider':145B,173B,654B,682B,1163B,1191B 'continu':60B,569B,1078B 'correct':123B,632B,1141B 'darpa':229B,738B,1247B 'demand':522B,1031B,1540B 'demonstr':468B,492B,977B,1001B,1486B,1510B 'depend':162B,671B,1180B 'design':355B,864B,1373B 'develop':226B,735B,1244B 'digit':188B,360B,697B,869B,1206B,1378B 'display':193B,365B,702B,874B,1211B,1383B 'distort':122B,631B,1140B 'due':58B,321B,567B,830B,1076B,1339B 'e.g':326B,835B,1344B 'effici':101B,610B,1119B 'electro':257B,766B,1275B 'electro-opt':256B,765B,1274B 'electromagnet':169B,678B,1187B 'electron':1556A 'embed':4A,11A,18A 'enabl':353B,862B,1371B 'end':73B,582B,1091B 'end-us':72B,581B,1090B 'ensur':136B,645B,1154B 'environ':171B,680B,1189B 'exampl':243B,752B,1261B 'exist':67B,576B,1085B 'extern':490B,999B,1508B 'fabric':64B,357B,573B,866B,1082B,1375B 'familiar':115B,624B,1133B 'final':172B,681B,1190B 'five':252B,761B,1270B 'frame':90B,599B,1108B 'fuse':249B,758B,1267B 'fusion':128B,371B,637B,880B,1146B,1389B 'gbps':400B,407B,909B,916B,1418B,1425B 'generat':43B,283B,313B,552B,792B,822B,1061B,1301B,1331B 'geometri':66B,332B,575B,841B,1084B,1350B 'gflops/w':501B,1010B,1519B 'given':149B,176B,658B,685B,1167B,1194B 'good':242B,751B,1260B 'gops/w':499B,1008B,1517B 'head':131B,640B,1149B 'head-track':130B,639B,1148B 'helmet':45B,191B,254B,347B,363B,424B,554B,700B,763B,856B,872B,933B,1063B,1209B,1272B,1365B,1381B,1442B 'helmet-mount':190B,253B,362B,699B,762B,871B,1208B,1271B,1380B 'high':23B,89B,208B,532B,598B,717B,1041B,1107B,1226B 'high-perform':22B,207B,531B,716B,1040B,1225B 'hmd':366B,875B,1384B 'howev':297B,806B,1315B 'human':1549A,1551A,1553A 'hz':291B,320B,393B,800B,829B,902B,1309B,1338B,1411B 'i/o':81B,111B,590B,620B,1099B,1129B 'imag':37B,86B,216B,234B,370B,546B,595B,725B,743B,879B,1055B,1104B,1234B,1252B,1388B 'imageri':438B,947B,1456B 'impact':458B,967B,1476B 'import':118B,627B,1136B 'improv':99B,608B,1117B 'includ':485B,994B,1503B 'infrar':266B,272B,279B,775B,781B,788B,1284B,1290B,1297B 'ingest':304B,413B,813B,922B,1322B,1431B 'input':250B,759B,1268B 'interest':451B,960B,1469B 'investig':114B,623B,1132B 'issu':56B,565B,1074B 'larg':85B,594B,1103B 'latenc':3A,10A,17A,31B,84B,215B,457B,540B,593B,724B,966B,1049B,1102B,1233B,1475B 'level':483B,992B,1501B 'life':160B,669B,1178B 'live':433B,942B,1451B 'llev':7A,14A,21A 'logic':107B,616B,1125B 'long':277B,786B,1295B 'low':2A,9A,16A,26B,30B,83B,211B,214B,535B,539B,592B,720B,723B,1044B,1048B,1101B,1229B,1232B 'low-lat':1A,8A,15A,29B,82B,213B,538B,591B,722B,1047B,1100B,1231B 'low-pow':25B,210B,534B,719B,1043B,1228B 'lwir':280B,311B,789B,820B,1298B,1329B 'manti':236B,745B,1254B 'match':414B,923B,1432B 'may':161B,670B,1179B 'mbps':418B,927B,1436B 'measur':480B,989B,1498B 'meet':140B,649B,1158B 'memori':108B,491B,617B,1000B,1126B,1509B 'metric':496B,1005B,1514B 'microdisplay':296B,805B,1314B 'microelectron':328B,837B,1346B 'mixtur':431B,940B,1449B 'monocular':442B,951B,1460B 'mount':192B,255B,364B,701B,764B,873B,1210B,1273B,1382B 'mpx/frame':396B,905B,1414B 'multi':79B,125B,588B,634B,1097B,1143B 'multi-channel':78B,587B,1096B 'multi-spectr':124B,633B,1142B 'multipl':420B,929B,1438B 'multispectr':230B,739B,1248B 'must':112B,146B,174B,409B,621B,655B,683B,918B,1130B,1164B,1192B,1427B 'near':265B,774B,1283B 'necessari':465B,974B,1483B 'need':34B,52B,75B,95B,378B,543B,561B,584B,604B,887B,1052B,1070B,1093B,1113B,1396B 'network':232B,741B,1250B 'new':47B,556B,1065B 'next':42B,551B,1060B 'next-gener':41B,550B,1059B 'nm':334B,843B,1352B 'novel':92B,601B,1110B 'object':383B,892B,1401B 'on-aircraft':426B,935B,1444B 'on-helmet':422B,931B,1440B 'one':307B,315B,816B,824B,1325B,1333B 'oper':260B,769B,1278B 'optic':258B,767B,1276B 'origin':246B,755B,1264B 'output':288B,317B,375B,389B,797B,826B,884B,898B,1306B,1335B,1393B,1407B 'overlay':440B,949B,1458B 'pair':294B,803B,1312B 'part':527B,1036B,1545B 'partial':510B,1019B,1528B 'perform':24B,36B,143B,209B,384B,484B,533B,545B,652B,718B,893B,993B,1042B,1054B,1161B,1227B,1402B,1502B 'peripher':487B,996B,1505B 'physic':523B,1032B,1541B 'pictur':511B,1020B,1529B 'potenti':515B,1024B,1533B 'power':27B,100B,212B,455B,519B,536B,609B,721B,964B,1028B,1045B,1118B,1230B,1473B,1537B 'process':32B,38B,65B,217B,446B,541B,547B,574B,726B,955B,1050B,1056B,1083B,1235B,1464B 'processor':6A,13A,20A,104B,155B,219B,224B,302B,331B,345B,477B,613B,664B,728B,733B,811B,840B,854B,986B,1122B,1173B,1237B,1242B,1320B,1349B,1363B,1495B 'program':237B,342B,746B,851B,1255B,1360B 'promis':98B,607B,1116B 'propos':476B,985B,1494B 'provid':508B,1017B,1526B 'push':516B,1025B,1534B 'radiat':170B,679B,1188B 'rate':91B,600B,1109B 'reliabl':165B,674B,1183B 'repres':470B,979B,1488B 'requir':134B,144B,220B,351B,381B,447B,486B,520B,643B,653B,729B,860B,890B,956B,995B,1029B,1152B,1162B,1238B,1369B,1399B,1465B,1504B,1538B 'resolut':415B,924B,1433B 'respond':54B,563B,1072B 'result':299B,808B,1317B 'robust':152B,661B,1170B 'satisfi':71B,580B,1089B 'semiconductor':63B,572B,1081B 'sensor':259B,306B,436B,768B,815B,945B,1277B,1324B,1454B 'set':199B,471B,708B,980B,1217B,1489B 'short':270B,779B,1288B 'shrink':61B,570B,1079B 'similar':445B,954B,1463B 'size':87B,596B,1105B 'solut':138B,179B,462B,514B,647B,688B,971B,1023B,1156B,1197B,1480B,1532B 'sourc':369B,421B,878B,930B,1387B,1439B 'spectral':126B,635B,1144B 'success':493B,1002B,1511B 'suffici':504B,1013B,1522B 'swir':273B,310B,782B,819B,1291B,1328B 'sxga':286B,795B,1304B 'symbolog':441B,950B,1459B 'synchron':285B,387B,794B,896B,1303B,1405B 'synthet':437B,946B,1455B 'system':46B,235B,348B,377B,443B,482B,530B,555B,744B,857B,886B,952B,991B,1039B,1064B,1253B,1366B,1395B,1461B,1500B,1548B,1550A,1552A,1554A 'tactic':233B,742B,1251B 'take':204B,713B,1222B 'technic':324B,833B,1342B 'technolog':50B,329B,559B,838B,1068B,1347B 'three':305B,814B,1323B 'threshold':382B,891B,1400B 'time':338B,847B,1356B 'total':461B,970B,1479B 'track':132B,641B,1150B 'tree':106B,615B,1124B 'two':284B,373B,386B,793B,882B,895B,1302B,1391B,1404B 'understand':453B,962B,1471B 'use':335B,844B,1353B 'user':74B,583B,1092B 'various':430B,939B,1448B 'video':287B,316B,374B,388B,416B,434B,796B,825B,883B,897B,925B,943B,1305B,1334B,1392B,1406B,1434B,1452B 'visibl':264B,773B,1282B 'visible-near':263B,772B,1281B 'vision':5A,12A,19A,223B,344B,732B,853B,1241B,1362B 'visual':1559A 'vnir':267B,309B,776B,818B,1285B,1327B 'vphs':349B,858B,1367B 'warfight':158B,380B,667B,889B,1176B,1398B 'wave':271B,278B,780B,787B,1289B,1296B 'wearabl':1555A 'wider':198B,707B,1216B 'x':268B,274B,394B,397B,402B,404B,777B,783B,903B,906B,911B,913B,1286B,1292B,1412B,1415B,1420B,1422B	AirForce
76	AF151-120	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46416	Linking Coupon to Component Behavior of CMCs in Relevant Service Environment	2	Much of the innovation in gas turbine engine technology is driven by advanced materials technology. Ceramic matrix composites (CMC) are a promising high temperature material for aerospace applications. Recently, several successful demonstrations of CMC hot section turbine engine components have been executed. There are several benefits in using CMCs over traditional Ni-based super alloys which include improved durability at elevated temperatures, increased thrust-to-weight ratio and improved specific fuel consumption. While the need for CMCs is apparent, the current transition path for materials is based on metal alloys and does not account for the unique aspects of CMCs. Innovative testing methodologies and physics based computational tools that capture relevant environmental factors while accounting for the unique aspects of CMCs are needed to fully exploit their use for hot section turbine engine components. \r\n\r\nMost of the current research and available property data on CMCs are based on flat panel coupon testing. However, CMC components in advanced turbine engine applications are highly complex. Components such as turbine blades and vanes require ply drops, curved plies, and/or matrix rich regions which have not been studied extensively. Additionally, the complexity of the CMCs architecture could cause other manufacturing defects such as porosity and ply wrinkles that can affect component durability. These components also face combined mechanical loading and thermal gradients resulting in complex stress states that are not captured in most standard tests.  Combined environmental and mechanical damage will have a significant impact on CMC component life. \r\n\r\nThe evaluation of CMC turbine engine components in relevant service environments requires the application of extreme environments (high pressure, hot gases and moisture) and complex loads (bi-axial, vibratory and thermal gradients). Despite using established testing methods designed for metals throughout the components building block development (coupons, sub-elements, sub-scale components, etc.), unanticipated failures still occur when the hardware is rolled up into a complete full scale engine demonstrator test in part due to the complexity of the loading and service environment. Preexisting service damage also impacts the service life CMC components.\r\n\r\nConsequently, new and innovative methods are needed to verify the anticipated component performance and generate confidence in new designs and technologies as early in the development process as possible, while providing a reduction in cost and test time prior to their introduction into full-scale engines.  Currently, empirical curves are generated from design allowables of flat panels to life CMC components. The current approach requires a prolonged development time and does not capture the complexity of CMC components. The preferred method will combine experimental and analytical aspects with the goal of developing lifing tools to reduce the amount of testing needed and capture the complexity of CMCs. The proposed method needs to predict the service life of CMC engine components within a determined fidelity of prediction. It also should focus on first order effects that limit service life. The proposed method can also provide insight into potential issues in the full-scale engine. Approaches will directly address and support DoDs next generation of propulsion technology initiatives, such as ADVENT and AETD within the VAATE program.	Develop an innovative method to link the durability of ceramic matrix composite test coupons to components in relevant service environments.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'account':129B,150B,651B,672B,1173B,1194B 'addit':221B,743B,1265B 'address':536B,1058B,1580B 'advanc':46B,192B,568B,714B,1090B,1236B 'advent':549B,1071B,1593B 'aerospac':60B,582B,1104B 'aetd':551B,1073B,1595B 'affect':241B,763B,1285B 'allow':432B,954B,1476B 'alloy':89B,125B,611B,647B,1133B,1169B 'also':246B,371B,506B,521B,768B,893B,1028B,1043B,1290B,1415B,1550B,1565B 'amount':476B,998B,1520B 'analyt':464B,986B,1508B 'and/or':211B,733B,1255B 'anticip':388B,910B,1432B 'appar':114B,636B,1158B 'applic':61B,195B,294B,583B,717B,816B,1105B,1239B,1338B 'approach':442B,533B,964B,1055B,1486B,1577B 'architectur':227B,749B,1271B 'aspect':133B,154B,465B,655B,676B,987B,1177B,1198B,1509B 'avail':176B,698B,1220B 'axial':309B,831B,1353B 'base':87B,122B,141B,182B,609B,644B,663B,704B,1131B,1166B,1185B,1226B 'behavior':5A,16A,27A,1608A 'benefit':79B,601B,1123B 'bi':308B,830B,1352B 'bi-axi':307B,829B,1351B 'blade':203B,725B,1247B 'block':327B,849B,1371B 'build':326B,848B,1370B 'captur':145B,262B,451B,481B,667B,784B,973B,1003B,1189B,1306B,1495B,1525B 'caus':229B,751B,1273B 'ceram':49B,571B,1093B 'cmc':52B,67B,189B,278B,284B,376B,438B,455B,496B,574B,589B,711B,800B,806B,898B,960B,977B,1018B,1096B,1111B,1233B,1322B,1328B,1420B,1482B,1499B,1540B 'cmcs':7A,18A,29A,82B,112B,135B,156B,180B,226B,485B,604B,634B,657B,678B,702B,748B,1007B,1126B,1156B,1179B,1200B,1224B,1270B,1529B 'combin':248B,267B,461B,770B,789B,983B,1292B,1311B,1505B 'complet':350B,872B,1394B 'complex':198B,223B,256B,305B,361B,453B,483B,720B,745B,778B,827B,883B,975B,1005B,1242B,1267B,1300B,1349B,1405B,1497B,1527B 'compon':4A,15A,26A,72B,169B,190B,199B,242B,245B,279B,287B,324B,336B,377B,389B,439B,456B,498B,594B,691B,712B,721B,764B,767B,801B,809B,846B,858B,899B,911B,961B,978B,1020B,1116B,1213B,1234B,1243B,1286B,1289B,1323B,1331B,1368B,1380B,1421B,1433B,1483B,1500B,1542B 'composit':51B,573B,1095B 'comput':142B,664B,1186B 'confid':393B,915B,1437B 'consequ':378B,900B,1422B 'consumpt':107B,629B,1151B 'cost':412B,934B,1456B 'could':228B,750B,1272B 'coupon':2A,13A,24A,186B,329B,708B,851B,1230B,1373B 'current':116B,173B,425B,441B,638B,695B,947B,963B,1160B,1217B,1469B,1485B 'curv':209B,427B,731B,949B,1253B,1471B 'damag':271B,370B,793B,892B,1315B,1414B 'data':178B,700B,1222B 'defect':232B,754B,1276B 'demonstr':65B,354B,587B,876B,1109B,1398B 'design':319B,396B,431B,841B,918B,953B,1363B,1440B,1475B 'despit':314B,836B,1358B 'determin':501B,1023B,1545B 'develop':328B,403B,446B,470B,850B,925B,968B,992B,1372B,1447B,1490B,1514B 'direct':535B,1057B,1579B 'dod':539B,1061B,1583B 'driven':44B,566B,1088B 'drop':208B,730B,1252B 'due':358B,880B,1402B 'durabl':93B,243B,615B,765B,1137B,1287B 'earli':400B,922B,1444B 'effect':512B,1034B,1556B 'element':332B,854B,1376B 'elev':95B,617B,1139B 'empir':426B,948B,1470B 'engin':41B,71B,168B,194B,286B,353B,424B,497B,532B,563B,593B,690B,716B,808B,875B,946B,1019B,1054B,1085B,1115B,1212B,1238B,1330B,1397B,1468B,1541B,1576B 'environ':11A,22A,33A,291B,297B,367B,813B,819B,889B,1335B,1341B,1411B 'environment':147B,268B,669B,790B,1191B,1312B 'establish':316B,838B,1360B 'etc':337B,859B,1381B 'evalu':282B,804B,1326B 'execut':75B,597B,1119B 'experiment':462B,984B,1506B 'exploit':161B,683B,1205B 'extens':220B,742B,1264B 'extrem':296B,818B,1340B 'face':247B,769B,1291B 'factor':148B,670B,1192B 'failur':339B,861B,1383B 'fidel':502B,1024B,1546B 'first':510B,1032B,1554B 'flat':184B,434B,706B,956B,1228B,1478B 'focus':508B,1030B,1552B 'fuel':106B,628B,1150B 'full':351B,422B,530B,873B,944B,1052B,1395B,1466B,1574B 'full-scal':421B,529B,943B,1051B,1465B,1573B 'fulli':160B,682B,1204B 'gas':39B,561B,1083B 'gase':301B,823B,1345B 'generat':392B,429B,542B,914B,951B,1064B,1436B,1473B,1586B 'goal':468B,990B,1512B 'gradient':253B,313B,775B,835B,1297B,1357B 'hardwar':344B,866B,1388B 'high':56B,197B,298B,578B,719B,820B,1100B,1241B,1342B,1605A 'hot':68B,165B,300B,590B,687B,822B,1112B,1209B,1344B 'howev':188B,710B,1232B 'impact':276B,372B,798B,894B,1320B,1416B 'improv':92B,104B,614B,626B,1136B,1148B 'includ':91B,613B,1135B 'increas':97B,619B,1141B 'initi':546B,1068B,1590B 'innov':37B,136B,381B,559B,658B,903B,1081B,1180B,1425B 'insight':523B,1045B,1567B 'introduct':419B,941B,1463B 'issu':526B,1048B,1570B 'life':280B,375B,437B,471B,494B,516B,802B,897B,959B,993B,1016B,1038B,1324B,1419B,1481B,1515B,1538B,1560B,1610A 'limit':514B,1036B,1558B 'link':1A,12A,23A 'load':250B,306B,364B,772B,828B,886B,1294B,1350B,1408B 'manufactur':231B,753B,1275B 'materi':47B,58B,120B,569B,580B,642B,1091B,1102B,1164B 'materials/processes':1600A,1601A,1602A 'matrix':50B,212B,572B,734B,1094B,1256B 'mechan':249B,270B,771B,792B,1293B,1314B 'metal':124B,321B,646B,843B,1168B,1365B 'method':318B,382B,459B,488B,519B,840B,904B,981B,1010B,1041B,1362B,1426B,1503B,1532B,1563B 'methodolog':138B,660B,1182B 'model':1604A 'moistur':303B,825B,1347B 'much':34B,556B,1078B 'need':110B,158B,384B,479B,489B,632B,680B,906B,1001B,1011B,1154B,1202B,1428B,1523B,1533B 'new':379B,395B,901B,917B,1423B,1439B 'next':541B,1063B,1585B 'ni':86B,608B,1130B 'ni-bas':85B,607B,1129B 'occur':341B,863B,1385B 'order':511B,1033B,1555B 'oxid':1603A 'panel':185B,435B,707B,957B,1229B,1479B 'part':357B,879B,1401B 'path':118B,640B,1162B 'perform':390B,912B,1434B 'physic':140B,662B,1184B 'pli':207B,210B,237B,729B,732B,759B,1251B,1254B,1281B 'poros':235B,757B,1279B 'possibl':406B,928B,1450B 'potenti':525B,1047B,1569B 'predict':491B,504B,1013B,1026B,1535B,1548B,1611A 'preexist':368B,890B,1412B 'prefer':458B,980B,1502B 'pressur':299B,821B,1343B 'prior':416B,938B,1460B 'process':404B,926B,1448B 'program':555B,1077B,1599B 'prolong':445B,967B,1489B 'promis':55B,577B,1099B 'properti':177B,699B,1221B 'propos':487B,518B,1009B,1040B,1531B,1562B 'propuls':544B,1066B,1588B 'provid':408B,522B,930B,1044B,1452B,1566B 'ratio':102B,624B,1146B 'recent':62B,584B,1106B 'reduc':474B,996B,1518B 'reduct':410B,932B,1454B 'region':214B,736B,1258B 'relev':9A,20A,31A,146B,289B,668B,811B,1190B,1333B 'requir':206B,292B,443B,728B,814B,965B,1250B,1336B,1487B 'research':174B,696B,1218B 'result':254B,776B,1298B 'rich':213B,735B,1257B 'roll':346B,868B,1390B 'scale':335B,352B,423B,531B,857B,874B,945B,1053B,1379B,1396B,1467B,1575B 'section':69B,166B,591B,688B,1113B,1210B 'servic':10A,21A,32A,290B,366B,369B,374B,493B,515B,812B,888B,891B,896B,1015B,1037B,1334B,1410B,1413B,1418B,1537B,1559B 'sever':63B,78B,585B,600B,1107B,1122B 'signific':275B,797B,1319B 'specif':105B,627B,1149B 'standard':265B,787B,1309B 'state':258B,780B,1302B 'still':340B,862B,1384B 'stress':257B,779B,1301B 'studi':219B,741B,1263B 'sub':331B,334B,853B,856B,1375B,1378B 'sub-el':330B,852B,1374B 'sub-scal':333B,855B,1377B 'success':64B,586B,1108B 'super':88B,610B,1132B 'support':538B,1060B,1582B 'technolog':42B,48B,398B,545B,564B,570B,920B,1067B,1086B,1092B,1442B,1589B 'temperatur':57B,96B,579B,618B,1101B,1140B,1606A 'test':137B,187B,266B,317B,355B,414B,478B,659B,709B,788B,839B,877B,936B,1000B,1181B,1231B,1310B,1361B,1399B,1458B,1522B,1607A 'thermal':252B,312B,774B,834B,1296B,1356B 'throughout':322B,844B,1366B 'thrust':99B,621B,1143B 'thrust-to-weight':98B,620B,1142B 'time':415B,447B,937B,969B,1459B,1491B 'tool':143B,472B,665B,994B,1187B,1516B 'tradit':84B,606B,1128B 'transit':117B,639B,1161B 'turbin':40B,70B,167B,193B,202B,285B,562B,592B,689B,715B,724B,807B,1084B,1114B,1211B,1237B,1246B,1329B 'unanticip':338B,860B,1382B 'uniqu':132B,153B,654B,675B,1176B,1197B 'use':81B,163B,315B,603B,685B,837B,1125B,1207B,1359B 'vaat':554B,1076B,1598B 'vane':205B,727B,1249B 'verifi':386B,908B,1430B 'vibratori':310B,832B,1354B 'weight':101B,623B,1145B 'within':499B,552B,1021B,1074B,1543B,1596B 'wrinkl':238B,760B,1282B	AirForce
114	AF151-101	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46400	Hardware-in-the-loop Celestial Navigation Test Bed	2	Celestial navigation concepts are being developed to augment inertial navigation systems on long-range guidance systems. These systems sense airframe attitude, through measurement of the relative angular position of known celestial objects, and position, if a reference frame relative to the local horizontal can be inferred. Since these systems directly impact accuracy of closed-loop guidance, a capability to test them as an integral part of the guidance system, i.e., hardware-in-the-loop simulation, is desired. Development of advanced star trackers for use in manned aircraft, remotely piloted aircraft (RPAs) and weapons will require a hardware-in-the-loop capability to integrate, test, and calibrate the system on the ground. This technology could also be used to support commercial interests, such as testing trackers for use in commercial maritime, aviation, and space navigation applications.\r\n\r\nA number of challenges exist that exceed the capability of current hardware-in-the-loop simulators.  Optical representation of star maps with radiometric accuracy is required in the visible through the short wave infrared spectrum. Collimated representation of the star field is required to sub-microradian accuracy. These advancements will require innovative solutions to extend scene generation capabilities to shorter wavelengths with increased contrast (greater than 2000:1).\r\n\r\nCapability is needed to represent the sky and stellar background including for a wide range of day and night celestial objects, backgrounds and optical distortions.  Representation of atmospheric objects (clouds, aerosols, etc.) and scatter along with possible interference of earth/sea glint and earth limb must also be considered. It is also a goal to provide radiometrically adjustable targets.  In other words, it would be nice to have the ability to accurately simulate star color in the scene generator.\r\n\r\nThese advancements will require innovative solutions to extend scene generation capabilities to shorter wavelengths with increased contrast (much greater than 2000:1), represent point source angular position to higher accuracy (about 100 urad) over a large field of view (greater than 20 degrees), and to represent a broad spectrum of airframe motion to navigation accuracy (greater than 400 deg/sec). Dynamic representation of stellar objects including Sun (V.M. -26), Moon, stars and space objects ranging from Magnitude 15 to Mag  -4+ are needed.  The need for objects with static magnitudes and temporally modulated magnitudes is also anticipated.\r\n\r\nInnovative solutions are being sought that will allow the insertion of celestial navigation systems, including associated inertial measurement units, into a hardware-in-the-loop test environment. While complete solution concepts are strongly encouraged and will be given priority, partial capabilities that describe one or more of the identified challenges will also be considered. Anticipated solutions range from complete environmental simulation using hardware simulators, to full or partial digital injection capabilities if hardware solutions are unreasonable.\r\n\r\nDynamics of the platforms under consideration deviate in major ways from traditional stellar inertial instrument application for attitude control on stable satellite platforms.  A star tracker for use in manned aircraft, RPAs and weapons will require a much more robust dynamic environment for targets and backgrounds due to the missile and aircraft high G dynamics and severe flight vibrations to be replicated during star tracker testing. Some instrument concepts under consideration require stimulation of the star field at up to 800 frames per seconds to reduce air frame vibration effects at high Mach number.\r\n\r\nThe approach should represent point source angular position to higher accuracy (less than 100 microradians) over a large field of view (greater than 20 degrees), and to represent a broad spectrum of airframe motion to navigation accuracy. Goals include to provide image motion rates of more than 400 deg/second in a random direction to represent actual flight dynamics of an airborne missile platform.  The number and type of targets to be projected or simulated and the approach for quasistatic and dynamic stellar objects must be addressed to provide a representative number of objects in the stellar instrument field of view.\r\n\r\nOther considerations include angular static accuracy measurement.  Calibration of the instrument in a very high fidelity angular measurement system  something that is capable of calibrating to 5-10X better than what is required on the star tracker.  Current test systems range from an angular accuracy of about 1 arcsecond to 20 milli-arc-seconds (100 nanoradians).	Develop technologies leading to an advanced hardware-in-the-loop (HWIL) test and demonstration capability for integration of future miniature strap-down precision celestial navigation systems with guidance concepts for long-range platforms.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'-10':691B '-26':364B '-4':376B '1':218B,318B,712B '100':328B,577B,720B '15':373B '20':338B,587B,715B '2000':217B,317B '400':354B,611B '5':690B '800':550B 'abil':287B 'accur':289B 'accuraci':62B,173B,197B,326B,351B,574B,600B,669B,709B 'actual':619B 'address':649B 'adjust':275B 'advanc':92B,199B,298B 'aerosol':249B 'air':556B 'airborn':624B 'aircraft':99B,102B,500B,521B 'airfram':30B,347B,596B 'allow':400B 'along':253B 'also':128B,264B,269B,391B,445B 'angular':37B,322B,570B,667B,680B,708B 'anticip':392B,448B 'applic':148B,485B 'approach':565B,640B 'arc':718B 'arcsecond':713B 'associ':408B 'atmospher':246B 'attitud':31B,487B 'augment':17B 'aviat':144B 'background':228B,240B,515B 'bed':9A 'better':693B 'broad':344B,593B 'calibr':119B,671B,688B 'capabl':69B,114B,157B,208B,219B,307B,434B,464B,686B 'celesti':6A,10B,41B,238B,404B 'challeng':152B,443B 'close':65B 'closed-loop':64B 'cloud':248B 'collim':185B 'color':292B 'commerci':133B,142B 'complet':422B,452B 'concept':12B,424B,538B 'consid':266B,447B 'consider':475B,540B,665B 'contrast':214B,313B 'control':488B 'could':127B 'current':159B,702B 'day':235B 'deg/sec':355B 'deg/second':612B 'degre':339B,588B 'describ':436B 'desir':89B 'develop':15B,90B 'deviat':476B 'digit':462B 'direct':60B,616B 'distort':243B 'due':516B 'dynam':356B,470B,510B,524B,621B,644B 'earth':261B 'earth/sea':258B 'effect':559B 'encourag':427B 'environ':420B,511B 'environment':453B 'etc':250B 'exceed':155B 'exist':153B 'extend':205B,304B 'fidel':679B 'field':190B,333B,546B,582B,661B 'flight':527B,620B 'frame':48B,551B,557B 'full':459B 'g':523B 'generat':207B,296B,306B 'given':431B 'glint':259B 'goal':271B,601B 'greater':215B,315B,336B,352B,585B 'ground':124B 'guidanc':25B,67B,79B 'hardwar':2A,83B,110B,161B,415B,456B,466B 'hardware-in-the-loop':1A,82B,109B,160B,414B 'high':522B,561B,678B 'higher':325B,573B 'horizont':53B 'i.e':81B 'identifi':442B 'imag':605B 'impact':61B 'includ':229B,361B,407B,602B,666B 'increas':213B,312B 'inerti':18B,409B,483B 'infer':56B 'infrar':183B 'inject':463B 'innov':202B,301B,393B 'insert':402B 'instrument':484B,537B,660B,674B 'integr':75B,116B 'interest':134B 'interfer':256B 'known':40B 'larg':332B,581B 'less':575B 'limb':262B 'local':52B 'long':23B 'long-rang':22B 'loop':5A,66B,86B,113B,164B,418B 'mach':562B 'mag':375B 'magnitud':372B,385B,389B 'major':478B 'man':98B,499B 'map':170B 'maritim':143B 'measur':33B,410B,670B,681B 'microradian':196B,578B 'milli':717B 'milli-arc-second':716B 'missil':519B,625B 'modul':388B 'moon':365B 'motion':348B,597B,606B 'much':314B,507B 'must':263B,647B 'nanoradian':721B 'navig':7A,11B,19B,147B,350B,405B,599B 'need':221B,378B,380B 'nice':283B 'night':237B 'number':150B,563B,628B,654B 'object':42B,239B,247B,360B,369B,382B,646B,656B 'one':437B 'optic':166B,242B,723A 'part':76B 'partial':433B,461B 'per':552B 'pilot':101B 'platform':473B,492B,626B 'point':320B,568B 'posit':38B,44B,323B,571B 'possibl':255B 'prioriti':432B 'project':635B 'provid':273B,604B,651B 'quasistat':642B 'radiometr':172B,274B 'random':615B 'rang':24B,233B,370B,450B,705B 'rate':607B 'reduc':555B 'refer':47B 'relat':36B,49B 'remot':100B 'replic':531B 'repres':223B,319B,342B,567B,591B,618B,653B 'represent':167B,186B,244B,357B 'requir':107B,175B,192B,201B,300B,505B,541B,697B 'robust':509B 'rpas':103B,501B 'satellit':491B 'scatter':252B 'scene':206B,295B,305B 'second':553B,719B 'sens':29B 'sever':526B 'short':181B 'shorter':210B,309B 'simul':87B,165B,290B,454B,457B,637B,724A 'sinc':57B 'sky':225B 'solut':203B,302B,394B,423B,449B,467B 'someth':683B 'sought':397B 'sourc':321B,569B 'space':146B,368B 'spectrum':184B,345B,594B 'stabl':490B 'star':93B,169B,189B,291B,366B,494B,533B,545B,700B 'static':384B,668B 'stellar':227B,359B,482B,645B,659B 'stimul':542B 'strong':426B 'sub':195B 'sub-microradian':194B 'sun':362B 'support':132B 'system':20B,26B,28B,59B,80B,121B,406B,682B,704B 'target':276B,513B,632B 'technolog':126B 'tempor':387B 'test':8A,71B,117B,137B,419B,535B,703B 'tracker':94B,138B,495B,534B,701B 'tradit':481B 'type':630B 'unit':411B 'unreason':469B 'urad':329B 'use':96B,130B,140B,455B,497B 'v.m':363B 'vibrat':528B,558B 'view':335B,584B,663B 'visibl':178B 'wave':182B 'wavelength':211B,310B 'way':479B 'weapon':105B,503B,722A 'wide':232B 'word':279B 'would':281B 'x':692B	AirForce
67	AF151-158	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46448	Very Large Multi-Modal NDI	2	As the age of our legacy fleets increase, there is an increasing requirement to scan very large areas of the outer mold line.  Traditional inspection equipment were primarily designed as hand held operations for specific locations on the structure.  This equipment was adapted for semi-automated operations and manipulation by computers and x-y scanners.  Research should include but not limited to the use of array probes, both ultrasonic and eddy current, to increase the area that can be scanned at one time, increased scan speed, improve data collection rates, improve data fusion, and provide automatic defect recognition/reporting.  This program will also investigate using multiple inspection modes simultaneously, (i.e., ultrasonic/eddy current, high frequency/low frequency).  For example, the KC-135 has an inspection requirement on the crown skin for both a high frequency and a low frequency eddy current inspection of the spot welds.  This currently requires two set ups and two separate scans.  If high frequency and low frequency eddy current could be combined, this would result in an automatic 50 percent reduction in manhours, and the use of arrays will be faster than manual, further reducing the manhours required.	The objective is to move away from non-destructive inspection (NDI) hand-held operations to very large surface areas of aircraft structures that will reduce man hours and depot cycle times.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'-135':133B,325B '50':185B,377B 'adapt':55B,247B 'age':15B,207B 'also':116B,308B 'area':30B,90B,222B,282B 'array':80B,194B,272B,386B 'autom':59B,251B 'automat':110B,184B,302B,376B 'collect':103B,295B 'combin':178B,370B 'comput':64B,256B 'could':176B,368B 'crown':140B,332B 'current':86B,125B,152B,159B,175B,278B,317B,344B,351B,367B 'data':102B,106B,294B,298B 'defect':111B,303B 'design':41B,233B 'eddi':85B,151B,174B,277B,343B,366B 'equip':38B,53B,230B,245B 'exampl':130B,322B 'faster':197B,389B 'fleet':19B,211B 'frequenc':128B,146B,150B,170B,173B,320B,338B,342B,362B,365B 'frequency/low':127B,319B 'fusion':107B,299B 'hand':43B,235B 'held':44B,236B 'high':126B,145B,169B,318B,337B,361B 'i.e':123B,315B 'improv':101B,105B,293B,297B 'includ':72B,264B 'increas':20B,24B,88B,98B,212B,216B,280B,290B 'inspect':37B,120B,136B,153B,229B,312B,328B,345B 'investig':117B,309B 'kc':132B,324B 'larg':2A,8A,29B,221B 'legaci':18B,210B 'limit':75B,267B 'line':35B,227B 'locat':48B,240B 'low':149B,172B,341B,364B 'manhour':189B,203B,381B,395B 'manipul':62B,254B 'manual':199B,391B 'materials/processes':397A,398A 'modal':5A,11A 'mode':121B,313B 'mold':34B,226B 'multi':4A,10A 'multi-mod':3A,9A 'multipl':119B,311B 'ndi':6A,12A,399A 'one':96B,288B 'oper':45B,60B,237B,252B 'outer':33B,225B 'percent':186B,378B 'primarili':40B,232B 'probe':81B,273B 'program':114B,306B 'provid':109B,301B 'rate':104B,296B 'recognition/reporting':112B,304B 'reduc':201B,393B 'reduct':187B,379B 'requir':25B,137B,160B,204B,217B,329B,352B,396B 'research':70B,262B 'result':181B,373B 'scan':27B,94B,99B,167B,219B,286B,291B,359B,401A 'scanner':69B,261B 'semi':58B,250B 'semi-autom':57B,249B 'separ':166B,358B 'set':162B,354B 'simultan':122B,314B 'skin':141B,333B 'specif':47B,239B 'speed':100B,292B 'spot':156B,348B 'structur':51B,243B 'time':97B,289B 'tradit':36B,228B 'two':161B,165B,353B,357B 'ultrason':83B,275B,400A 'ultrasonic/eddy':124B,316B 'up':163B,355B 'use':78B,118B,192B,270B,310B,384B 'weld':157B,349B 'would':180B,372B 'x':67B,259B 'x-i':66B,258B 'y':68B,260B	AirForce
173	AF151-096	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46397	Selecting Appropriate Protective Courses of Action when Information-Starved	2	Our U.S space systems operate in an extremely harsh space environment.  Additionally, the space environment, and in particular the Geostationary orbit, is becoming increasingly congested and contested.  To ensure the continued operation of the Air Forces global space missions (Missile Warning, Military Satellite Communications, and Precision Navigation and Timing) we require space systems capable of acting/reacting within the timelines dictated by expected hazards and threats.  However, this protective capability must also be properly balanced against mission requirements and system resource limitations, to prevent the unnecessary depletion of said resources or impacts to the mission (e.g. ambiguous sensor readings lead the satellite to maneuver which in turn reduces the systems station keeping capability, effectively shortening the satellites service life).\r\n\r\nThe Air Force Research Laboratory believes that enabling these protective responses at a temporally effective pace will require increased levels of system autonomy to identify, assess,  recommend, and eventually choose, plan and execute appropriate protective courses of action.  AFRL also believes that, similar to all other warfighting domains subject to the fog of war, that operators and (eventually) systems will have to make these choices in the presence of incomplete and/or low quality sets of data and information.  AFRLs efforts to enable more autonomous space systems, is broken into the four following, yet highly coupled, areas:\r\n1)  Sensor Data Fusion: Integration of data from multiple sources, in order to properly assess the situation.  The data can be from on-board sensors and satellite payloads, in addition to external sources of information (such as Space Situational Awareness information products from a Space Operations Center).\r\n2)  System Management: Housekeeping operations to keep the space vehicle operating.  Examples include controlling the charging and discharging of batteries, rotation of the solar arrays to maintain alignment with the sun, powering heaters to keep components from getting to cold, etc.\r\n3)  Course of Action (COA) Selection: Selecting the appropriate COA that a) minimizes the effects from the threat/hazard, b) maximizes attainment of mission requirements, and c) minimizes resource depletion.  Requires multivariable optimization, in a noisy environment, with incomplete or missing information.\r\n4)  Mission Planning: Once a COA has been selected, developing the set of procedures required to execute that COA.\r\n\r\nThis topic is focused specifically on COA selection, although some work may be extensible to other areas.\r\n\r\nTo enable efficient and effective COA selection, AFRL is interested in the following (non-inclusive) technology areas: \r\n1)  Hypothesis development and rejection, to quickly populate, and then reduce, the set of likely anomalies and satisfactory responses.\r\n2)  Sensor or system tasking to generate, or gather, the most critical pieces of information that are currently lacking.  Such taskings must also consider the temporal aspects of the information requirements. \r\n3)  Ensuring stability in under-defined and noisy mathematical systems.\r\n\r\nSince the intent is to transition the technology into operational satellites, preference will be shown to those proposals that demonstrate traceability to the size, weight and power (SWAP) and computational limits of current and/or future space processing architectures.	To develop algorithms, processes, and/or mathematical constructs that enable the selection of appropriate courses of action, even in the face of insufficient or low-quality data and information, in a congested and/or contested space environment.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'1':229B,413B '2':277B,432B '3':318B,463B '4':359B 'acting/reacting':67B 'action':6A,169B,321B 'addit':22B,259B 'afrl':170B,210B,402B 'air':45B,133B 'align':304B 'also':82B,171B,454B 'although':386B 'ambigu':107B 'and/or':202B,507B 'anomali':428B 'appropri':2A,165B,326B 'architectur':511B 'area':228B,394B,412B 'array':301B 'aspect':458B 'assess':157B,243B 'attain':338B 'autonom':216B 'autonomi':154B 'awar':269B 'b':336B 'balanc':85B 'batteri':296B 'becom':33B 'believ':137B,172B 'board':253B 'broken':220B 'c':343B 'capabl':65B,80B,124B 'center':276B 'charg':292B 'choic':196B 'choos':161B 'coa':322B,327B,364B,377B,384B,400B 'cold':316B 'communic':55B 'compon':312B 'comput':503B 'congest':35B 'consid':455B 'contest':37B 'continu':41B 'control':290B 'coupl':227B 'cours':4A,167B,319B 'critic':443B 'current':449B,506B 'data':207B,231B,235B,247B 'defin':469B 'demonstr':493B 'deplet':97B,346B 'develop':368B,415B 'dictat':71B 'discharg':294B 'domain':179B 'e.g':106B 'effect':125B,146B,332B,399B 'effici':397B 'effort':212B 'enabl':139B,214B,396B 'ensur':39B,464B 'environ':21B,25B,353B 'etc':317B 'eventu':160B,189B 'exampl':288B 'execut':164B,375B 'expect':73B 'extens':391B 'extern':261B 'extrem':18B 'focus':381B 'fog':183B 'follow':224B,407B 'forc':46B,134B 'four':223B 'fusion':232B 'futur':508B 'gather':440B 'generat':438B 'geostationari':30B 'get':314B 'global':48B 'harsh':19B 'hazard':74B 'heater':309B 'high':226B 'housekeep':280B 'howev':77B 'hypothesi':414B 'identifi':156B 'impact':102B 'includ':289B 'inclus':410B 'incomplet':201B,355B 'increas':34B,150B 'inform':9A,209B,264B,270B,358B,446B,461B,512A,515A 'information-starv':8A 'insuffici':514A 'integr':233B 'intent':476B 'interest':404B 'keep':123B,283B,311B 'laboratori':136B 'lack':450B 'lead':110B 'level':151B 'life':131B 'like':427B 'limit':92B,504B 'low':203B 'maintain':303B 'make':194B 'manag':279B 'maneuv':114B 'mathemat':472B 'maxim':337B 'may':389B 'militari':53B 'minim':330B,344B 'miss':357B 'missil':51B 'mission':50B,87B,105B,340B,360B 'multipl':237B 'multivari':348B 'must':81B,453B 'navig':58B 'noisi':352B,471B 'non':409B 'non-inclus':408B 'on-board':251B 'oper':15B,42B,187B,275B,281B,287B,483B 'optim':349B 'orbit':31B 'order':240B 'pace':147B 'particular':28B 'payload':257B 'piec':444B 'plan':162B,361B 'popul':420B 'power':308B,500B 'precis':57B 'prefer':485B 'presenc':199B 'prevent':94B 'procedur':372B 'process':510B 'product':271B 'proper':84B,242B 'propos':491B 'protect':3A,79B,141B,166B 'qualiti':204B 'quick':419B 'read':109B 'recommend':158B 'reduc':118B,423B 'reject':417B 'requir':62B,88B,149B,341B,347B,373B,462B 'research':135B 'resourc':91B,100B,345B 'respons':142B,431B 'rotat':297B 'said':99B 'satellit':54B,112B,128B,256B,484B 'satisfactori':430B 'select':1A,323B,324B,367B,385B,401B 'sensor':108B,230B,254B,433B 'servic':130B 'set':205B,370B,425B 'shorten':126B 'shown':488B 'similar':174B 'sinc':474B 'situat':245B,268B 'size':497B 'solar':300B 'sourc':238B,262B 'space':13B,20B,24B,49B,63B,217B,267B,274B,285B,509B 'specif':382B 'stabil':465B 'starv':10A 'station':122B 'subject':180B 'sun':307B 'swap':501B 'system':14B,64B,90B,120B,153B,190B,218B,278B,435B,473B,513A 'task':436B,452B 'technolog':411B,481B 'tempor':145B,457B 'threat':76B 'threat/hazard':335B 'time':60B 'timelin':70B 'topic':379B 'traceabl':494B 'transit':479B 'turn':117B 'u.s':12B 'under-defin':467B 'unnecessari':96B 'vehicl':286B 'war':185B 'warfight':178B 'warn':52B 'weight':498B 'within':68B 'work':388B 'yet':225B	AirForce
7	AF151-029	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46341	Infrastructure Agnostic Solutions for Anti-Reconnaissance and Cyber Deception	2	The collective stages used to infiltrate a system can be applied to perform a broad range of attacks. However, the most successful assailants rely heavily on the reconnaissance stages, which are primarily divided as passive or active approaches [1]. Passive reconnaissance is a mere collection of information using search engines or various other methods in obtaining publicly available information. This form of information gathering requires entities to practice discretionary posting of information and is often a disregarded tactic used by sophisticated criminals today. The active reconnaissance approach generally results in the act of probing and scanning hosts or servers to determine IP addresses, database information, operating systems used, passwords, usernames, etc. While defensive tactics such as monitoring traffic flow with intrusion detection systems (IDS) or stateful firewalls can help detect active reconnaissance practices, attackers are still able to administer stealthier techniques, such as sending smaller amounts of packets to avoid detection. Since reconnaissance is generally the preceding stage in an attempt to compromise a system, attackers can successfully perform a multitude of attacks on target systems using the gathered information.   As such, increasing the effort required on the part of the adversary to obtain actionable intelligence, or providing inaccurate information altogether can enhance the overall security posture of a system or network [2].\r\n\r\nThere is a need for secure, infrastructure agnostic, solutions designed for cyber agility and anti-reconnaissance.  Such solutions must effectively prevent traffic analysis, and must implement evasive and deceptive techniques such as misreporting source and destination IP and/or MAC addresses, and intermittently changing those addresses.  The technology must be capable of preventing an adversary from accurately determining the direction or volume of information moving within the network, or the size or topology of the network itself, and must be capable of taking measures to prevent, detect, and cease communication with non-compliant or rogue clients within the environment.\r\n\r\nConsideration will be given to solutions that 1) have little to no impact to network performance or the availability of services, 2) those that do not require customized, or otherwise "non-commodity" hardware, 3) those that provide for flexible infrastructure or enclaves that can be set up, re-segmented, and/or taken down quickly, and 4) those that are capable of supporting a PKI or other robust cryptosystem.  The performer should not assume that solely providing a large address space, in which it is difficult for the attacker to predict the next address, provides a sufficient level of assurance.	This topic seeks to provide new and novel approaches to delaying, disrupting and deceiving adversaries engaged in active network reconnaissance.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'1':49B,331B '2':223B,345B '3':358B '4':380B 'abl':147B 'accur':280B 'act':102B 'action':205B 'activ':47B,95B,141B 'address':113B,264B,269B,403B,417B 'administ':149B 'adversari':202B,278B 'agil':236B 'agnost':2A,231B 'altogeth':211B 'amount':156B 'analysi':247B 'and/or':262B,375B 'anti':6A,239B 'anti-reconnaiss':5A,238B 'appli':21B 'approach':48B,97B 'assail':33B 'assum':397B 'assur':423B 'attack':28B,144B,176B,183B,412B 'attempt':171B 'avail':68B,342B 'avoid':160B 'broad':25B 'capabl':274B,304B,384B 'ceas':312B 'chang':267B 'client':320B 'collect':12B,55B 'commod':356B 'communic':313B 'compliant':317B 'compromis':173B 'consider':324B 'crimin':92B 'cryptosystem':392B 'custom':351B 'cyber':9A,235B 'databas':114B 'decept':10A,253B 'defens':123B,428A 'design':233B 'destin':260B 'detect':132B,140B,161B,310B 'determin':111B,281B 'difficult':409B 'direct':283B 'discretionari':79B 'disregard':87B 'divid':43B 'effect':244B 'effort':195B 'enclav':366B 'engin':60B 'enhanc':213B 'entiti':76B 'environ':323B 'etc':121B 'evas':251B 'firewal':137B 'flexibl':363B 'flow':129B 'form':71B 'gather':74B,189B 'general':98B,165B 'given':327B 'hardwar':357B 'heavili':35B 'help':139B 'host':107B 'howev':29B 'id':134B 'impact':336B 'implement':250B 'inaccur':209B 'increas':193B 'infiltr':16B 'inform':57B,69B,73B,82B,115B,190B,210B,287B,424A 'infrastructur':1A,230B,364B 'intellig':206B 'intermitt':266B 'intrus':131B 'ip':112B,261B 'larg':402B 'level':421B 'littl':333B 'mac':263B 'measur':307B 'mere':54B 'method':64B 'misreport':257B 'monitor':127B 'move':288B,426A 'multitud':181B 'must':243B,249B,272B,302B 'need':227B 'network':222B,291B,299B,338B 'next':416B 'non':316B,355B 'non-commod':354B 'non-compli':315B 'obtain':66B,204B 'often':85B 'oper':116B 'otherwis':353B 'overal':215B 'packet':158B 'part':199B 'passiv':45B,50B 'password':119B 'perform':23B,179B,339B,394B 'pki':388B 'post':80B 'postur':217B 'practic':78B,143B 'preced':167B 'predict':414B 'prevent':245B,276B,309B 'primarili':42B 'probe':104B 'provid':208B,361B,400B,418B 'public':67B 'quick':378B 'rang':26B 're':373B 're-seg':372B 'reconnaiss':7A,38B,51B,96B,142B,163B,240B 'reli':34B 'requir':75B,196B,350B 'result':99B 'robust':391B 'rogu':319B 'scan':106B 'search':59B 'secur':216B,229B 'segment':374B 'send':154B 'server':109B 'servic':344B 'set':370B 'sinc':162B 'size':294B 'smaller':155B 'sole':399B 'solut':3A,232B,242B,329B 'sophist':91B 'sourc':258B 'space':404B 'stage':13B,39B,168B 'state':136B 'stealthier':150B 'still':146B 'success':32B,178B 'suffici':420B 'support':386B 'system':18B,117B,133B,175B,186B,220B,425A 'tactic':88B,124B 'take':306B 'taken':376B 'target':185B,427A 'techniqu':151B,254B 'technolog':271B 'today':93B 'topolog':296B 'traffic':128B,246B 'use':14B,58B,89B,118B,187B 'usernam':120B 'various':62B 'volum':285B 'within':289B,321B	AirForce
69	AF151-035	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46347	Miniature Link-16 Communications Device	2	Tactical Data Links (TDL) provide essential communication channels between forces to support interoperability.  The most common TDL for U.S., NATO and Coalition forces is Link-16.  Link-16 provides near real time exchange of tactical data among military units and is the global standard for modern command and control (C2) architectures.\r\n\r\nUnfortunately, size, weight, and power (SWaP) constraints of current Link-16 components prevent the dismounted operator from directly utilizing the Link-16 network.  The objective of this SBIR is to develop a miniature device design that minimizes SWaP to enable the dismounted operators to fully implement the Link 16 capability to enhance situational awareness (SA) and C2.  Market research suggests that a handheld Link-16 device, comparable to the Harris Corporations AN/PRC-152 radio, will be available by FY 2016.  This effort will focus on continued reduction of SWaP of miniature Link-16 devices.	Develop and demonstrate a prototype miniature Link-16 communications device.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'-16':3A,31B,33B,67B,78B,121B,149B '16':105B,154A '2016':136B 'among':42B 'an/prc-152':129B 'architectur':56B 'avail':133B 'awar':110B 'c2':55B,113B 'capabl':106B 'channel':13B 'coalit':27B 'command':52B 'common':21B 'communic':4A,12B 'compar':123B 'compon':68B 'constraint':63B 'continu':142B 'control':54B 'corpor':127B 'current':65B 'data':7B,41B 'design':91B 'develop':87B 'devic':5A,90B,122B,150B 'direct':74B 'dismount':71B,98B 'effort':138B 'enabl':96B 'enhanc':108B 'essenti':11B 'exchang':38B 'focus':140B 'forc':15B,28B 'fulli':101B 'fy':135B 'global':48B 'handheld':119B 'harri':126B 'implement':102B 'inform':151A 'interoper':18B 'link':2A,8B,30B,32B,66B,77B,104B,120B,148B,153A 'market':114B 'militari':43B 'miniatur':1A,89B,147B 'minim':93B 'modern':51B 'nato':25B 'near':35B 'network':79B 'object':81B 'oper':72B,99B 'power':61B 'prevent':69B 'provid':10B,34B 'radio':130B 'real':36B 'reduct':143B 'research':115B 'sa':111B 'sbir':84B 'situat':109B 'size':58B 'standard':49B 'suggest':116B 'support':17B 'swap':62B,94B,145B 'system':152A 'tactic':6B,40B 'tdl':9B,22B 'time':37B 'u.s':24B 'unfortun':57B 'unit':44B 'util':75B 'weight':59B	AirForce
51	AF151-083	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46388	Post Processing of Satellite Catalog Data for Event	2	When the space fence comes on line, it is estimated that the catalog will grow to 100,000 objects. In addition, the new High Accuracy Catalog (HAC) is expected to produce an estimated 400,000 element sets a day. As these two efforts come on line, the operator will soon be presented with 15,000 conjunctions a week to screen and monitor. With each conjunction the operator must determine the likelihood of the conjunction, the associated risk level, and the appropriate course of action. When determining the likelihood of a conjunction, today, the operator primarily considers two factors: probability of collision and miss distance. Each of these metrics has their own inherent problems. Miss distance cannot be solely considered since two conjuncting assets may have a miss distance less than 20 km however if the covariance matrix for each object is small then the risk factor of the conjunction is relatively small. Conversely, the miss distance could also be large, but if the covariance matrix for one of the objects is larger than the miss distance between the two objects then the conjunction still has a relatively high risk factor. There are similar concerns when considering probability of collision. In addition a covariance matrix does not fully take into account raw sensor data and its biases.  Typically the raw sensor data is fused into a flawed derived orbital product. A low probability of collision can result from both an unlikely event and a large covariance matrix. Physical object characteristics need to also be considered. An active asset conjuncting with a large secondary object is much more critical than two rocket bodies conjuncting and likewise two rocket bodies conjuncting is more important to track than say two small	Research and develop new ways to better determine what satellite orbital events are most critical to monitor and provide courses of action.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'000':26B,43B,63B '100':25B '15':62B '20':139B '400':42B 'account':218B 'accuraci':33B 'action':92B 'activ':264B 'addit':29B,209B 'also':166B,260B 'appropri':89B 'asset':131B,265B 'associ':84B 'bias':224B 'bodi':279B,285B 'cannot':124B 'catalog':5A,21B,34B 'characterist':257B 'collis':109B,207B,242B 'come':13B,52B 'concern':202B 'conjunct':64B,73B,82B,99B,130B,157B,191B,266B,280B,286B 'consid':104B,127B,204B,262B 'convers':161B 'could':165B 'cours':90B 'covari':144B,172B,211B,253B,298A 'critic':275B 'data':6A,221B,229B 'day':47B 'deriv':235B 'determin':77B,94B 'distanc':112B,123B,136B,164B,184B 'effort':51B 'element':44B 'estim':18B,41B 'event':8A,249B 'expect':37B 'factor':106B,154B,198B 'fenc':12B 'flaw':234B 'fulli':215B 'fuse':231B 'grow':23B 'hac':35B 'high':32B,196B 'howev':141B 'import':289B 'inform':296A 'inher':120B 'km':140B 'larg':168B,252B,269B 'larger':180B 'less':137B 'level':86B 'likelihood':79B,96B 'likewis':282B 'line':15B,54B 'low':239B 'matrix':145B,173B,212B,254B 'may':132B 'metric':116B 'miss':111B,122B,135B,163B,183B 'monitor':70B 'much':273B 'must':76B 'need':258B 'new':31B 'object':27B,148B,178B,188B,256B,271B 'one':175B 'oper':56B,75B,102B 'orbit':236B 'physic':255B 'post':1A 'present':60B 'primarili':103B 'probabl':107B,205B,240B 'problem':121B 'process':2A 'produc':39B 'product':237B 'raw':219B,227B 'relat':159B,195B 'result':244B 'risk':85B,153B,197B 'rocket':278B,284B 'satellit':4A 'say':293B 'screen':68B 'secondari':270B 'sensor':220B,228B 'set':45B 'similar':201B 'sinc':128B 'small':150B,160B,295B 'sole':126B 'soon':58B 'space':11B 'still':192B 'system':297A 'take':216B 'today':100B 'track':291B 'two':50B,105B,129B,187B,277B,283B,294B 'typic':225B 'unlik':248B 'week':66B	AirForce
14	AF151-084	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46389	High-Temperature, Radiation-Hard and High-Efficiency DC-DC Converters for Space	2	Spacecraft power management and distribution (PMAD) systems use DC-DC converters for bidirectional energy transfer from the batteries. They are also used for down converting the energy produced by the solar arrays for delivery to the various loads on the spacecraft.  While these converters traditionally operate at temperatures around 80 degrees centigrade, with convertor efficiencies ranging from 80 percent to 90 percent. Advanced technology switching devices that are becoming available will allow high-temperature operation and reduced switching losses. These devices, such as GaN HEMTs or SiC JFETs, have been shown to be inherently radiation hard, which should increase the overall converter hardness and reduce the radiation shielding requirements.\r\n\r\nThe challenge for this technology development is to demonstrate that a DC-DC converter can be developed to operate with power stage semiconductor switch junction temperatures between 200 and 250 degrees centigrade. The DC-DC converter should be suitable for use on large communications spacecraft with converter efficiencies greater than 95 percent, and specific power of 1kW/kg. We are primarily interested in large satellites so the converter modules should be scalable for use in 5 to 30 kW power systems; however, supporting smaller platforms (	Investigate advancements required to achieve high-temperature, high-efficiency and low-specific-mass DC-DC converters for spacecraft.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'1kw/kg':186B '200':156B '250':158B '30':206B '5':204B '80':67B,75B '90':78B '95':180B 'advanc':80B 'allow':89B 'also':38B 'around':66B 'array':49B 'avail':87B 'batteri':35B 'becom':86B 'bidirect':30B 'centigrad':69B,160B 'challeng':129B 'communic':173B 'convert':14A,28B,42B,61B,120B,142B,165B,176B,196B 'convertor':71B 'dc':12A,13A,26B,27B,140B,141B,163B,164B 'dc-dc':11A,25B,139B,162B 'degre':68B,159B 'deliveri':51B 'demonstr':136B 'develop':133B,145B 'devic':83B,99B 'distribut':21B 'effici':10A,72B,177B 'energi':31B,44B 'gan':102B 'greater':178B 'hard':6A,114B,121B 'hemt':103B 'high':2A,9A,91B,216A 'high-effici':8A 'high-temperatur':1A,90B 'howev':210B 'increas':117B 'inher':112B 'interest':190B 'jfet':106B 'junction':153B 'kw':207B 'larg':172B,192B 'load':55B 'loss':97B 'manag':19B 'modul':197B 'oper':63B,93B,147B 'overal':119B 'percent':76B,79B,181B 'platform':213B,215A 'pmad':22B 'power':18B,149B,184B,208B 'primarili':189B 'produc':45B 'radiat':5A,113B,125B 'radiation-hard':4A 'rang':73B 'reduc':95B,123B 'requir':127B 'satellit':193B 'scalabl':200B 'semiconductor':151B 'shield':126B 'shown':109B 'sic':105B 'smaller':212B 'solar':48B 'space':16A,214A 'spacecraft':17B,58B,174B 'specif':183B 'stage':150B 'suitabl':168B 'support':211B 'switch':82B,96B,152B 'system':23B,209B 'technolog':81B,132B 'temperatur':3A,65B,92B,154B,217A 'tradit':62B 'transfer':32B 'use':24B,39B,170B,202B 'various':54B	AirForce
75	AF151-015	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46328	Transforming Cyber Data into Human-Centered Visualizations	2	Effective cyber operations, both on the offensive and defensive sides, are essential for conducting Air Force missions.  Cyber operators, who may be new to this domain because of the high demand this need has placed on the Air Force workforce, find themselves challenged on two fronts.  First, they must try to make sense of the vast amounts of data which are being presented to them, often in raw format.  Cyber operators are drowning in data that they cannot effectively understand, manage, and use to make sound decisions.  Second, they are constantly trying to learn new tools that are being offered to them, each independent from one another with unique features, rules, syntax, interfaces, interaction techniques, etc.  The Air Force Cyber Vision 2025 (Maybury, 2012) enumerates four Focused, Enabling S&T Areas, one of which is Optimize Human-Machine Systems, and the near-term goal is summarized as providing Advanced Situational Awareness for Cyber Operators.  Similarly, Air Force Space Command's Cyber Superiority S&T Guidance states that for effective knowledge operations, technologies are needed to vastly improve man-machine interfaces to speed the assimilation of data and the development of actionable information and courses of action for cyber operators.  Based on these stated needs, the goal of this topic is to find innovative ways to optimize the assimilation, transformation, and visual presentation of cyber data in ways that support the operators cognitive capabilities so they can effectively do their job.\r\n\r\nThe cyber domain has the unique characteristic that the resources necessary for superiority in the domain are not aircraft and airfields as in the air domain, but highly trained and competent personnel (Bryant, 2013).  This statement boldly places the success or failure of cyber superiority on the human factor - in the hands of the cyber operator.  Therefore, it is imperative that the information displays with which these operators interact are designed for effective human use.\r\n\r\nSpecifically, this process must begin with a thorough understanding of the cyber analysts job (goals, tasks, objectives, information needed, decision processes, etc.), so the design team can determine the cognitive processes that need to be supported when these operators are performing their tasks.  The design team will use this knowledge to transform data and design visualizations accordingly.  Some visualization techniques that may be considered are parallel coordinates, tree maps, recurrence plots, theme rivers, and/or any new or innovatively used existing graphical techniques.  Visualizations can be static or interactive to provide multiple levels of information - overview, zoom/filter, details on demand (Shneiderman, 1996).  Visualizations may also include innovative ways to apply visualization techniques from other domains to the cyber data problem (i.e., determining how to apply text visualization techniques such as tag clouds to network data).  Iterative prototyping and user feedback should be part of the design process to ensure the visualizations meet the users needs.  A multi-disciplinary team will be necessary to perform the tasks in this effort.	Determine innovative ways to transform cyber data into visual representations based on the cognitive needs of cyber operators; design and evaluate visual representations to determine operator effectiveness in performing cyber tasks.	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'1996':427B '2012':132B '2013':285B '2025':130B 'accord':383B 'action':202B,207B 'advanc':159B 'air':23B,46B,126B,166B,276B 'aircraft':270B 'airfield':272B 'also':430B 'amount':65B 'analyst':339B,500A 'and/or':400B 'anoth':115B 'appli':435B,450B 'area':139B 'assimil':195B,229B 'awar':161B 'base':211B 'begin':331B 'bold':288B 'bryant':284B 'cannot':86B 'capabl':244B 'center':7A 'challeng':51B 'characterist':258B 'cloud':457B 'cognit':243B,356B 'command':169B 'compet':282B 'conduct':22B 'consid':390B 'constant':99B 'coordin':393B 'cours':205B 'cyber':2A,10B,26B,78B,128B,163B,171B,209B,235B,253B,295B,306B,338B,443B,499A 'data':3A,67B,83B,197B,236B,379B,444B,460B 'decis':95B,346B 'defens':17B 'demand':39B,425B 'design':322B,351B,371B,381B,471B 'detail':423B 'determin':354B,447B 'develop':200B 'disciplinari':485B 'display':315B 'domain':34B,254B,267B,277B,440B 'drown':81B 'effect':9B,87B,179B,248B,324B 'effort':496B 'enabl':136B 'ensur':474B 'enumer':133B 'essenti':20B 'etc':124B,348B 'exist':406B 'factor':300B 'failur':293B 'featur':118B 'feedback':465B 'find':49B,223B 'first':55B 'focus':135B 'forc':24B,47B,127B,167B 'format':77B 'four':134B 'front':54B 'goal':154B,217B,341B 'graphic':407B 'guidanc':175B 'hand':303B 'high':38B,279B 'human':6A,146B,299B,325B,497A 'human-cent':5A 'human-machin':145B 'i.e':446B 'imper':311B 'improv':187B 'includ':431B 'independ':112B 'inform':203B,314B,344B,420B 'innov':224B,404B,432B 'interact':122B,320B,414B 'interfac':121B,191B 'iter':461B 'job':251B,340B 'knowledg':180B,376B 'learn':102B 'level':418B 'machin':147B,190B 'make':60B,93B 'man':189B 'man-machin':188B 'manag':89B 'map':395B 'may':29B,388B,429B 'mayburi':131B 'meet':477B 'mission':25B 'multi':484B 'multi-disciplinari':483B 'multipl':417B 'must':57B,330B 'near':152B 'near-term':151B 'necessari':262B,489B 'need':41B,184B,215B,345B,359B,481B 'network':459B 'new':31B,103B,402B 'object':343B 'offens':15B 'offer':108B 'often':74B 'one':114B,140B 'oper':11B,27B,79B,164B,181B,210B,242B,307B,319B,365B 'optim':144B,227B 'overview':421B 'parallel':392B 'part':468B 'perform':367B,491B 'personnel':283B 'place':43B,289B 'plot':397B 'present':71B,233B 'problem':445B 'process':329B,347B,357B,472B 'prototyp':462B 'provid':158B,416B 'raw':76B 'recurr':396B 'resourc':261B 'river':399B 'rule':119B 'second':96B 'sens':61B 'shneiderman':426B 'side':18B 'similar':165B 'situat':160B 'sound':94B 'space':168B 'specif':327B 'speed':193B 'state':176B,214B 'statement':287B 'static':412B 'success':291B 'summar':156B 'superior':172B,264B,296B 'support':240B,362B 'syntax':120B 'system':148B,498A 'tag':456B 'task':342B,369B,493B 'team':352B,372B,486B 'techniqu':123B,386B,408B,437B,453B 'technolog':182B 'term':153B 'text':451B 'theme':398B 'therefor':308B 'thorough':334B 'tool':104B 'topic':220B 'train':280B 'transform':1A,230B,378B 'tree':394B 'tri':58B,100B 'two':53B 'understand':88B,335B 'uniqu':117B,257B 'use':91B,326B,374B,405B 'user':464B,479B 'vast':64B,186B 'vision':129B 'visual':8A,232B,382B,385B,409B,428B,436B,452B,476B 'way':225B,238B,433B 'workforc':48B 'zoom/filter':422B	AirForce
187	AF151-129	DoD SBIR 2015.1	http://www.dodsbir.net/sitis/display_topic.asp?Bookmark=46424	Nondestructive Method and Data Analysis for Organic Matrix Composite Leading Edges	2	Develop or optimize a nondestructive evaluation (NDE) method and data analysis routine for inspection of convex outer surfaces of organic matrix composite edges (i.e., chine, airfoil) with an inner radii objective/threshold of 0.1/0.25 in. NDE defect sensitivity objective/threshold of 0.1/0.25 in. diameter.\r\n\r\nAir Force-relevant applications include, but are not limited to nondestructive evaluation/inspection (NDE/I) of organic matrix composite (OMC) materials used in leading edges, chines that enable manned or unmanned air systems or airfoils used in gas turbine engines.  Currently all OMC components are inspected by NDE for defects before service and frequently during service as well.  Available NDE techniques and data analyses are very capable of detecting defects in flat plate geometries. However, these methods and analysis tools have difficulty inspecting across the apex of curved parts like leading edges and airfoils while maintaining the required sensitivity to defects.  Incremental improvements to current methods are not being sought.  The intent of this solicitation is to address a very complex inspection requirement that has not been resolved by incremental engineering of the standard five methods (ultrasound, eddy current, radiography, magnetic particle and fluorescent penetrant).  However, it is possible that the potential solution could be based on these methods. Measurements will occur in a variety of temperature and loading conditions on the structure or component when the measurement is performed. This means that the effect of temperature and/or load on the reproducibility and accuracy of the inspection capability must be addressed. Methods that use a baseline comparison (or subtraction) are not being sought. Method must be able to inspect through the thickness of the radii. Defects of interest include delaminations (real not simulated), foreign objects (e.g., backing paper, gloves or sticky notes), porosity, ply related defects (ply gaps, ply laps and ply wrinkles), and bridging.  Bridging is defined as when the outer radius (OR) plies and inner radius (IR) plies separate from each other during processing, creating a void or cavity between them running along the edge).  To further complicate the inspection space some of these components have additional filler materials, such as co-cured or pre-cured OMC noodles, which are placed between the OR plies and the IR plies to enable the OR to have a smaller radius than the IR. Components may have varying thickness values and other geometric features in addition to the complex curvature. It is expected that an NDE technique and the associated data analysis will need to be optimized and tailored to enable a single-sided (OR) inspection.  The technique and analysis should not be so specific to the target application that it cannot be easily used on similar parts (different material, layup or radii) with minimal changes to the technique and the analysis.	Develop or optimize a nondestructive evaluation method and data analysis for convex surfaces of organic matrix composite edges (chine, airfoil) with an inner radii objective/threshold of 0.1/0.25 in. Defect sensitivity obj/thres 0.1/0.25 in. diameter	2014-12-12 00:00:00	2015-01-15 00:00:00	2015-02-18 00:00:00	'/0.25':56B,64B,513B,521B '0.1':55B,63B,512B,520B 'abl':282B,739B 'accuraci':259B,716B 'across':149B,606B 'addit':364B,412B,821B,869B 'address':183B,266B,640B,723B 'air':67B,97B,524B,554B 'airfoil':48B,100B,159B,505B,557B,616B 'along':350B,807B 'analys':129B,586B 'analysi':5A,16A,33B,144B,428B,447B,479B,490B,601B,885B,904B,936B 'and/or':253B,710B 'apex':151B,608B 'applic':71B,456B,528B,913B 'associ':426B,883B 'avail':124B,581B 'back':302B,759B 'base':221B,678B 'baselin':271B,728B 'bridg':320B,321B,777B,778B 'cannot':459B,916B 'capabl':132B,263B,589B,720B 'caviti':346B,803B 'chang':473B,930B 'chine':47B,91B,504B,548B 'co':370B,827B 'co-cur':369B,826B 'comparison':272B,729B 'complex':186B,415B,643B,872B 'complic':355B,812B 'compon':109B,240B,362B,401B,566B,697B,819B,858B 'composit':9A,20A,44B,84B,501B,541B 'condit':235B,692B 'convex':38B,495B 'could':219B,676B 'creat':342B,799B 'cure':371B,375B,828B,832B 'current':106B,170B,204B,563B,627B,661B 'curv':153B,610B 'curvatur':416B,873B 'data':4A,15A,32B,128B,427B,489B,585B,884B 'defect':59B,115B,135B,166B,291B,311B,516B,572B,592B,623B,748B,768B 'defin':323B,780B 'delamin':295B,752B 'detect':134B,591B 'develop':23B,480B 'diamet':66B,523B 'differ':466B,923B 'difficulti':147B,604B 'e.g':301B,758B 'easili':461B,918B 'eddi':203B,660B 'edg':11A,22A,45B,90B,157B,352B,502B,547B,614B,809B 'effect':250B,707B 'enabl':93B,390B,437B,550B,847B,894B 'engin':105B,196B,562B,653B 'evalu':28B,485B 'evaluation/inspection':79B,536B 'expect':419B,876B 'featur':410B,867B 'filler':365B,822B 'five':200B,657B 'flat':137B,594B 'fluoresc':209B,666B 'forc':69B,526B 'force-relev':68B,525B 'foreign':299B,756B 'frequent':119B,576B 'gap':313B,770B 'gas':103B,560B 'geometr':409B,866B 'geometri':139B,596B 'glove':304B,761B 'howev':140B,211B,597B,668B 'i.e':46B,503B 'improv':168B,625B 'includ':72B,294B,529B,751B 'increment':167B,195B,624B,652B 'inner':51B,332B,508B,789B 'inspect':36B,111B,148B,187B,262B,284B,357B,443B,493B,568B,605B,644B,719B,741B,814B,900B,941A 'intent':177B,634B 'interest':293B,750B 'ir':334B,387B,400B,791B,844B,857B 'lap':315B,772B 'layup':468B,925B 'lead':10A,21A,89B,156B,546B,613B 'like':155B,612B 'limit':76B,533B 'load':234B,254B,691B,711B 'magnet':206B,663B 'maintain':161B,618B 'man':94B,551B 'materi':86B,366B,467B,543B,823B,924B 'materials/processes':937A,938A 'matrix':8A,19A,43B,83B,500B,540B 'may':402B,859B 'mean':247B,704B 'measur':225B,243B,682B,700B 'method':2A,13A,30B,142B,171B,201B,224B,267B,279B,487B,599B,628B,658B,681B,724B,736B 'minim':472B,929B 'must':264B,280B,721B,737B 'nde':29B,58B,113B,125B,422B,486B,515B,570B,582B,879B 'nde/i':80B,537B 'ndi':939A 'need':430B,887B 'nondestruct':1A,12A,27B,78B,484B,535B,940A 'noodl':377B,834B 'note':307B,764B 'object':300B,757B 'objective/threshold':53B,61B,510B,518B 'occur':227B,684B 'omc':85B,108B,376B,542B,565B,833B 'optim':25B,433B,482B,890B 'organ':7A,18A,42B,82B,499B,539B 'outer':39B,327B,496B,784B 'paper':303B,760B 'part':154B,465B,611B,922B 'particl':207B,664B 'penetr':210B,667B 'perform':245B,702B 'place':380B,837B 'plate':138B,595B 'pli':309B,312B,314B,317B,330B,335B,384B,388B,766B,769B,771B,774B,787B,792B,841B,845B 'poros':308B,765B 'possibl':214B,671B 'potenti':217B,674B 'pre':374B,831B 'pre-cur':373B,830B 'process':341B,798B 'radii':52B,290B,470B,509B,747B,927B 'radiographi':205B,662B 'radius':328B,333B,397B,785B,790B,854B 'real':296B,753B 'relat':310B,767B 'relev':70B,527B 'reproduc':257B,714B 'requir':163B,188B,620B,645B 'resolv':193B,650B 'routin':34B,491B 'run':349B,806B 'sensit':60B,164B,517B,621B 'separ':336B,793B 'servic':117B,121B,574B,578B 'side':441B,898B 'similar':464B,921B 'simul':298B,755B 'singl':440B,897B 'single-sid':439B,896B 'smaller':396B,853B 'solicit':180B,637B 'solut':218B,675B 'sought':175B,278B,632B,735B 'space':358B,815B 'specif':452B,909B 'standard':199B,656B 'sticki':306B,763B 'structur':238B,695B 'subtract':274B,731B 'surfac':40B,497B 'system':98B,555B 'tailor':435B,892B 'target':455B,912B 'techniqu':126B,423B,445B,476B,583B,880B,902B,933B 'temperatur':232B,252B,689B,709B 'thick':287B,405B,744B,862B 'tool':145B,602B 'turbin':104B,561B 'ultrasound':202B,659B 'unman':96B,553B 'use':87B,101B,269B,462B,544B,558B,726B,919B 'valu':406B,863B 'vari':404B,861B 'varieti':230B,687B 'void':344B,801B 'well':123B,580B 'wrinkl':318B,775B	AirForce
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('topics_id_seq', 1, false);


--
-- Data for Name: topicsareas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY topicsareas (topic_id, area_id) FROM stdin;
76	4
67	4
114	2
173	7
7	7
69	7
51	7
14	1
90	6
75	6
187	4
\.


--
-- Data for Name: topicskeywords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY topicskeywords (topic_id, keyword_id) FROM stdin;
76	910
90	984
67	19
114	214
90	404
173	217
7	267
90	292
69	996
51	672
76	756
14	259
76	681
75	487
67	630
187	630
187	843
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, password, active, secret, confirmed_at, last_login_at, current_login_at, last_login_ip, current_login_ip, login_count, name, title) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY workflows (id, name, description, created_at, updated_at, proposal_id) FROM stdin;
\.


--
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('workflows_id_seq', 1, false);


--
-- Data for Name: workflowstepresults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY workflowstepresults (id, result, completed_at, created_at, updated_at, workflowstep_id) FROM stdin;
\.


--
-- Name: workflowstepresults_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('workflowstepresults_id_seq', 1, false);


--
-- Data for Name: workflowsteps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY workflowsteps (id, name, description, work, created_at, updated_at, workflow_id) FROM stdin;
\.


--
-- Name: workflowsteps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('workflowsteps_id_seq', 1, false);


--
-- Name: areas_area_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_area_key UNIQUE (area);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: connections_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id);


--
-- Name: contents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (id);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: keywords_keyword_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY keywords
    ADD CONSTRAINT keywords_keyword_key UNIQUE (keyword);


--
-- Name: keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: participatingcomponents_participatingcomponent_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY participatingcomponents
    ADD CONSTRAINT participatingcomponents_participatingcomponent_key UNIQUE (participatingcomponent);


--
-- Name: participatingcomponents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY participatingcomponents
    ADD CONSTRAINT participatingcomponents_pkey PRIMARY KEY (id);


--
-- Name: phases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY phases
    ADD CONSTRAINT phases_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- Name: references_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "references"
    ADD CONSTRAINT references_pkey PRIMARY KEY (id);


--
-- Name: references_reference_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "references"
    ADD CONSTRAINT references_reference_key UNIQUE (reference);


--
-- Name: roles_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: topics_topic_number_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_topic_number_key UNIQUE (topic_number);


--
-- Name: topics_url_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_url_key UNIQUE (url);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: workflowstepresults_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY workflowstepresults
    ADD CONSTRAINT workflowstepresults_pkey PRIMARY KEY (id);


--
-- Name: workflowsteps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY workflowsteps
    ADD CONSTRAINT workflowsteps_pkey PRIMARY KEY (id);


--
-- Name: topics_fulltext_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX topics_fulltext_idx ON topics USING gin (full_text);


--
-- Name: connections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT connections_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: contents_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contents
    ADD CONSTRAINT contents_document_id_fkey FOREIGN KEY (document_id) REFERENCES documents(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: documents_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: documentskeywords_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentskeywords
    ADD CONSTRAINT documentskeywords_document_id_fkey FOREIGN KEY (document_id) REFERENCES documents(id);


--
-- Name: documentskeywords_keyword_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentskeywords
    ADD CONSTRAINT documentskeywords_keyword_id_fkey FOREIGN KEY (keyword_id) REFERENCES keywords(id);


--
-- Name: documentsproposals_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentsproposals
    ADD CONSTRAINT documentsproposals_document_id_fkey FOREIGN KEY (document_id) REFERENCES documents(id);


--
-- Name: documentsproposals_proposal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentsproposals
    ADD CONSTRAINT documentsproposals_proposal_id_fkey FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- Name: organizationsusers_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizationsusers
    ADD CONSTRAINT organizationsusers_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: organizationsusers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizationsusers
    ADD CONSTRAINT organizationsusers_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: participatingcomponentstopics_participatingcomponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY participatingcomponentstopics
    ADD CONSTRAINT participatingcomponentstopics_participatingcomponent_id_fkey FOREIGN KEY (participatingcomponent_id) REFERENCES participatingcomponents(id);


--
-- Name: participatingcomponentstopics_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY participatingcomponentstopics
    ADD CONSTRAINT participatingcomponentstopics_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES topics(id);


--
-- Name: phases_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY phases
    ADD CONSTRAINT phases_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES topics(id);


--
-- Name: proposals_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: references_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "references"
    ADD CONSTRAINT references_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES topics(id);


--
-- Name: roles_users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_users
    ADD CONSTRAINT roles_users_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: roles_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_users
    ADD CONSTRAINT roles_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: topics_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_program_id_fkey FOREIGN KEY (program_id) REFERENCES programs(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: topicsareas_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY topicsareas
    ADD CONSTRAINT topicsareas_area_id_fkey FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- Name: topicsareas_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY topicsareas
    ADD CONSTRAINT topicsareas_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES topics(id);


--
-- Name: topicskeywords_keyword_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY topicskeywords
    ADD CONSTRAINT topicskeywords_keyword_id_fkey FOREIGN KEY (keyword_id) REFERENCES keywords(id);


--
-- Name: topicskeywords_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY topicskeywords
    ADD CONSTRAINT topicskeywords_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES topics(id);


--
-- Name: workflows_proposal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workflows
    ADD CONSTRAINT workflows_proposal_id_fkey FOREIGN KEY (proposal_id) REFERENCES proposals(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: workflowstepresults_workflowstep_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workflowstepresults
    ADD CONSTRAINT workflowstepresults_workflowstep_id_fkey FOREIGN KEY (workflowstep_id) REFERENCES workflowsteps(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: workflowsteps_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workflowsteps
    ADD CONSTRAINT workflowsteps_workflow_id_fkey FOREIGN KEY (workflow_id) REFERENCES workflows(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

