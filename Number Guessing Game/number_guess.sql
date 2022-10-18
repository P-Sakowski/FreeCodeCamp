--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 12, 839);
INSERT INTO public.games VALUES (2, 12, 874);
INSERT INTO public.games VALUES (3, 13, 30);
INSERT INTO public.games VALUES (4, 13, 455);
INSERT INTO public.games VALUES (5, 12, 300);
INSERT INTO public.games VALUES (6, 12, 209);
INSERT INTO public.games VALUES (7, 12, 69);
INSERT INTO public.games VALUES (8, 14, 50);
INSERT INTO public.games VALUES (9, 14, 457);
INSERT INTO public.games VALUES (10, 15, 993);
INSERT INTO public.games VALUES (11, 15, 145);
INSERT INTO public.games VALUES (12, 14, 462);
INSERT INTO public.games VALUES (13, 14, 143);
INSERT INTO public.games VALUES (14, 14, 451);
INSERT INTO public.games VALUES (15, 16, 174);
INSERT INTO public.games VALUES (16, 16, 41);
INSERT INTO public.games VALUES (17, 17, 62);
INSERT INTO public.games VALUES (18, 17, 968);
INSERT INTO public.games VALUES (19, 16, 88);
INSERT INTO public.games VALUES (20, 16, 928);
INSERT INTO public.games VALUES (21, 16, 102);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Raphael');
INSERT INTO public.users VALUES (2, 'user_1666119492120');
INSERT INTO public.users VALUES (3, 'user_1666119492119');
INSERT INTO public.users VALUES (4, 'user_1666119539116');
INSERT INTO public.users VALUES (5, 'user_1666119539115');
INSERT INTO public.users VALUES (6, 'user_1666119582219');
INSERT INTO public.users VALUES (7, 'user_1666119582218');
INSERT INTO public.users VALUES (8, 'user_1666120244788');
INSERT INTO public.users VALUES (9, 'user_1666120244787');
INSERT INTO public.users VALUES (10, 'user_1666120563161');
INSERT INTO public.users VALUES (11, 'user_1666120563160');
INSERT INTO public.users VALUES (12, 'user_1666120628450');
INSERT INTO public.users VALUES (13, 'user_1666120628449');
INSERT INTO public.users VALUES (14, 'user_1666120659002');
INSERT INTO public.users VALUES (15, 'user_1666120659001');
INSERT INTO public.users VALUES (16, 'user_1666120696326');
INSERT INTO public.users VALUES (17, 'user_1666120696325');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 21, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

