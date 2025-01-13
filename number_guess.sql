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
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('', 0, NULL);
INSERT INTO public.users VALUES ('user_1736718972800', 0, NULL);
INSERT INTO public.users VALUES ('user_1736718972799', 0, NULL);
INSERT INTO public.users VALUES ('user_1736719319793', 0, NULL);
INSERT INTO public.users VALUES ('user_1736719319792', 0, NULL);
INSERT INTO public.users VALUES ('user_1736719486286', 0, NULL);
INSERT INTO public.users VALUES ('user_1736719486285', 0, NULL);
INSERT INTO public.users VALUES ('user_1736719511406', 0, NULL);
INSERT INTO public.users VALUES ('user_1736719511405', 0, NULL);
INSERT INTO public.users VALUES ('user_1736719702954', 0, NULL);
INSERT INTO public.users VALUES ('user_1736719702953', 0, NULL);
INSERT INTO public.users VALUES ('user_1736720323539', 0, NULL);
INSERT INTO public.users VALUES ('user_1736720323538', 0, NULL);
INSERT INTO public.users VALUES ('user_1736720407951', 0, NULL);
INSERT INTO public.users VALUES ('user_1736720407950', 0, NULL);
INSERT INTO public.users VALUES ('user_1736721170141', 2, 329);
INSERT INTO public.users VALUES ('user_1736721170142', 5, 38);
INSERT INTO public.users VALUES ('user_1736723404550', 2, 119);
INSERT INTO public.users VALUES ('user_1736721679552', 2, 55);
INSERT INTO public.users VALUES ('user_1736723404551', 5, 54);
INSERT INTO public.users VALUES ('user_1736723639634', 0, NULL);
INSERT INTO public.users VALUES ('user_1736721679553', 5, 148);
INSERT INTO public.users VALUES ('user_1736723639633', 0, NULL);
INSERT INTO public.users VALUES ('megj', 1, 11);
INSERT INTO public.users VALUES ('user_1736721721723', 2, 682);
INSERT INTO public.users VALUES ('user_1736721721724', 5, 126);
INSERT INTO public.users VALUES ('user_1736723917848', 2, 56);
INSERT INTO public.users VALUES ('user_1736722119762', 2, 461);
INSERT INTO public.users VALUES ('user_1736722119763', 5, 86);
INSERT INTO public.users VALUES ('user_1736723917849', 5, 416);
INSERT INTO public.users VALUES ('user_1736722679553', 2, 438);
INSERT INTO public.users VALUES ('user_1736722679554', 5, 87);
INSERT INTO public.users VALUES ('test_user', 1, 12);
INSERT INTO public.users VALUES ('user_1736725816210', 2, 846);
INSERT INTO public.users VALUES ('user_1736722923956', 2, 595);
INSERT INTO public.users VALUES ('user_1736725816211', 5, 199);
INSERT INTO public.users VALUES ('user_1736722923957', 5, 119);
INSERT INTO public.users VALUES ('user_1736722974918', 2, 230);
INSERT INTO public.users VALUES ('user_1736726036836', 2, 392);
INSERT INTO public.users VALUES ('user_1736722974919', 5, 10);
INSERT INTO public.users VALUES ('user_1736726036837', 5, 131);
INSERT INTO public.users VALUES ('user_1736723118925', 2, 134);
INSERT INTO public.users VALUES ('user_1736723118926', 5, 16);
INSERT INTO public.users VALUES ('user_1736727271999', 2, 305);
INSERT INTO public.users VALUES ('user_1736727272000', 5, 233);
INSERT INTO public.users VALUES ('user_1736727908417', 2, 375);
INSERT INTO public.users VALUES ('user_1736727908418', 5, 139);
INSERT INTO public.users VALUES ('user_1736728025490', 2, 66);
INSERT INTO public.users VALUES ('user_1736728025491', 5, 599);
INSERT INTO public.users VALUES ('user_1736728092849', 2, 401);
INSERT INTO public.users VALUES ('user_1736728092850', 5, 268);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

