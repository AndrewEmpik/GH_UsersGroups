--
-- PostgreSQL database dump
-- (slightly changed for INSERTS to work, launched from pgAdmin)
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Groups" (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE public."Groups" OWNER TO postgres;

--
-- Name: Groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Groups_id_seq" OWNER TO postgres;

--
-- Name: Groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Groups_id_seq" OWNED BY public."Groups".id;


--
-- Name: Interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Interests" (
    id integer NOT NULL,
    title text NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public."Interests" OWNER TO postgres;

--
-- Name: Interests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Interests_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Interests_id_seq" OWNER TO postgres;

--
-- Name: Interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Interests_id_seq" OWNED BY public."Interests".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: UsersGroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UsersGroups" (
    id integer NOT NULL,
    userid integer NOT NULL,
    groupid integer NOT NULL
);


ALTER TABLE public."UsersGroups" OWNER TO postgres;

--
-- Name: UsersGroups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."UsersGroups" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."UsersGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Groups" ALTER COLUMN id SET DEFAULT nextval('public."Groups_id_seq"'::regclass);


--
-- Name: Interests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Interests" ALTER COLUMN id SET DEFAULT nextval('public."Interests_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: Groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Groups" (id, title)
VALUES
(1,	'Junior'),
(2,	'Middle'),
(3,	'Senior'),
(4,	'Boss'),
(5,	'AdditionalGroup')
;


--
-- Data for Name: Interests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Interests" (id, title, userid)
VALUES
(1,	'JavaScript',	1),
(2,	'Node.js',		1),
(3,	'Prisma',		2),
(4,	'NestJS',		2),
(5,	'PostgreSQL',	3)
;


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Users" (id, name)
VALUES
(1,	'John'),
(2,	'Jane'),
(3,	'Jill')
;


--
-- Data for Name: UsersGroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."UsersGroups" (userid, groupid)
VALUES
(1,		1),
(2,		2),
(2,		5),
(3,		3),
(3,		4),
(3,		5)
;


--
-- Name: Groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Groups_id_seq"', 6, true);


--
-- Name: Interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Interests_id_seq"', 6, true);


--
-- Name: UsersGroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UsersGroups_id_seq"', 7, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 4, true);


--
-- Name: Groups Groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Groups"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);


--
-- Name: Interests Interests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Interests"
    ADD CONSTRAINT "Interests_pkey" PRIMARY KEY (id);


--
-- Name: UsersGroups UK_USER_GROUP; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsersGroups"
    ADD CONSTRAINT "UK_USER_GROUP" UNIQUE (userid, groupid);


--
-- Name: UsersGroups UsersGroups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsersGroups"
    ADD CONSTRAINT "UsersGroups_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: UsersGroups FK_GROUP_ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsersGroups"
    ADD CONSTRAINT "FK_GROUP_ID" FOREIGN KEY (groupid) REFERENCES public."Groups"(id);


--
-- Name: Interests FK_USER_ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Interests"
    ADD CONSTRAINT "FK_USER_ID" FOREIGN KEY (userid) REFERENCES public."Users"(id) NOT VALID;


--
-- Name: UsersGroups FK_USER_ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsersGroups"
    ADD CONSTRAINT "FK_USER_ID" FOREIGN KEY (userid) REFERENCES public."Users"(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

