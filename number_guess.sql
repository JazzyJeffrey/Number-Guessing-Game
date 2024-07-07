--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1719974313941', 2, 722);
INSERT INTO public.users VALUES ('user_1719974313942', 5, 80);
INSERT INTO public.users VALUES ('user_1719974329777', 2, 526);
INSERT INTO public.users VALUES ('user_1719974329778', 5, 243);
INSERT INTO public.users VALUES ('user_1719974472702', 2, 357);
INSERT INTO public.users VALUES ('user_1719974472703', 5, 235);
INSERT INTO public.users VALUES ('user_1719974488052', 2, 106);
INSERT INTO public.users VALUES ('user_1719974488053', 5, 82);
INSERT INTO public.users VALUES ('user_1719974639581', 2, 170);
INSERT INTO public.users VALUES ('user_1719974639582', 5, 271);
INSERT INTO public.users VALUES ('user_1719974704848', 2, 349);
INSERT INTO public.users VALUES ('user_1719974704849', 5, 116);
INSERT INTO public.users VALUES ('user_1719974749195', 2, 180);
INSERT INTO public.users VALUES ('user_1719974749196', 5, 157);
INSERT INTO public.users VALUES ('user_1719974759910', 2, 836);
INSERT INTO public.users VALUES ('user_1719974759911', 5, 120);
INSERT INTO public.users VALUES ('user_1719974763665', 2, 639);
INSERT INTO public.users VALUES ('user_1719974763666', 5, 334);
INSERT INTO public.users VALUES ('user_1719974876594', 2, 87);
INSERT INTO public.users VALUES ('user_1719974876595', 5, 63);
INSERT INTO public.users VALUES ('user_1719974961371', 2, 358);
INSERT INTO public.users VALUES ('user_1719974961372', 5, 171);
INSERT INTO public.users VALUES ('user_1719974962324', 2, 457);
INSERT INTO public.users VALUES ('user_1719974962325', 5, 232);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

