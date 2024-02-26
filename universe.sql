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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    orbital_period integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(30),
    description text NOT NULL,
    name character varying(30),
    size_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    is_spherical boolean,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean,
    name character varying(30) NOT NULL,
    star_id integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    age_in_billion_years numeric,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_type character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Haleys Comet', 'One of the most famous comets.', 76);
INSERT INTO public.comet VALUES (2, 'Hyakutake', 'Icy blue with a faint gas tail.', 10000);
INSERT INTO public.comet VALUES (3, 'Hale Bopp', 'Last seem near Earth during the Bronze Age', 2534);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral', 'Contains our solar system.', 'Milky Way', 100000);
INSERT INTO public.galaxy VALUES (2, 'Spiral', 'Closest big galaxy to the Milky Way.', 'Andromeda', 260000);
INSERT INTO public.galaxy VALUES (3, 'Compact Dwarf', 'It looks like a bear claw.', 'Bear Claw Galaxy', 13500);
INSERT INTO public.galaxy VALUES (4, 'Starburst', 'It has a bright and spotty appearance.', 'Fireworks Galaxy', 40000);
INSERT INTO public.galaxy VALUES (5, 'Spiral', 'It is named after David Malin.', 'Malin 1', 650000);
INSERT INTO public.galaxy VALUES (6, 'Intermediate Spiral', 'It is named after its structural appearance.', 'Eye of God', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, true, 'The Moon', 1, 'It is the fifth largest satelite in the Solar System.');
INSERT INTO public.moon VALUES (2, true, 'Phobos', 2, 'It is a heavily cratered moon.');
INSERT INTO public.moon VALUES (3, true, 'Deimos', 2, 'It is covered in debris from impacts.');
INSERT INTO public.moon VALUES (4, true, 'Titan', 3, 'It has lakes, rivers, and mountains.');
INSERT INTO public.moon VALUES (5, true, 'Mimas', 3, 'It looks like the Death Star.');
INSERT INTO public.moon VALUES (6, true, 'Tethys', 3, 'It has a large impact basin.');
INSERT INTO public.moon VALUES (7, true, 'Miranda', 4, 'It contains ice rock and silicate rock.');
INSERT INTO public.moon VALUES (8, true, 'Ariel', 4, 'Carbon dioxide has been detected here.');
INSERT INTO public.moon VALUES (9, true, 'Umbriel', 4, 'It is the darkest of the largest Uranus moons.');
INSERT INTO public.moon VALUES (10, true, 'Titania', 4, 'This is the largest Uranus moon.');
INSERT INTO public.moon VALUES (11, true, 'Oberon', 4, 'It has at least one large mountain.');
INSERT INTO public.moon VALUES (12, true, 'Ganymede', 5, 'The largest moon in our solar system.');
INSERT INTO public.moon VALUES (13, true, 'Europa', 5, 'It is about 90 percent the size of earth.');
INSERT INTO public.moon VALUES (14, true, 'Callisto', 5, 'The most heavily cratered object in our solar system.');
INSERT INTO public.moon VALUES (15, true, 'Io', 5, 'It is very volcanically active.');
INSERT INTO public.moon VALUES (16, true, 'Charon', 6, 'It is half the size of Pluto.');
INSERT INTO public.moon VALUES (18, false, 'Hydra', 6, 'Discovered in 2005.');
INSERT INTO public.moon VALUES (17, false, 'Nix', 6, 'Discovered with the Hubble Space Telescope');
INSERT INTO public.moon VALUES (20, false, 'Styx', 6, 'It was discovered in 2015.');
INSERT INTO public.moon VALUES (19, false, 'Kerberos', 6, 'It could have formed from two smaller objects.');
INSERT INTO public.moon VALUES (21, false, 'Phoebe', 3, 'It has an irregular, elliptical orbit.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 'Earth', 4, 1);
INSERT INTO public.planet VALUES (2, false, 'Mars', 4, 2);
INSERT INTO public.planet VALUES (3, false, 'Saturn', 4, 146);
INSERT INTO public.planet VALUES (4, false, 'Uranus', 4, 27);
INSERT INTO public.planet VALUES (5, false, 'Jupiter', 4, 95);
INSERT INTO public.planet VALUES (6, false, 'Pluto', 4, 5);
INSERT INTO public.planet VALUES (7, false, 'Proxima Centauri D', 1, 1);
INSERT INTO public.planet VALUES (8, false, 'Keplar 1625b', 8, 1);
INSERT INTO public.planet VALUES (9, false, 'Keplar 90b', 7, 0);
INSERT INTO public.planet VALUES (10, false, 'Keplar 90c', 7, 0);
INSERT INTO public.planet VALUES (11, false, 'Keplar 90f', 7, 0);
INSERT INTO public.planet VALUES (12, false, 'Keplar 90g', 7, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 4.853, 'Proxima Centauri', 1, 'Red Dwarf');
INSERT INTO public.star VALUES (2, 10.01, 'Barnards Star', 1, 'Red Dwarf');
INSERT INTO public.star VALUES (3, 6.5, 'Toliman', 1, 'Main-sequence');
INSERT INTO public.star VALUES (4, 4.603, 'The Sun', 1, 'Yellow Dwarf');
INSERT INTO public.star VALUES (5, 13.7, 'Methuselah', 1, 'Subgiant');
INSERT INTO public.star VALUES (6, 7.105, 'Arcturus', 1, 'Red Giant');
INSERT INTO public.star VALUES (7, 2, 'Keplar 90', 1, 'G Type');
INSERT INTO public.star VALUES (8, 8.7, 'Keplar 1625', 1, 'G Type');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

